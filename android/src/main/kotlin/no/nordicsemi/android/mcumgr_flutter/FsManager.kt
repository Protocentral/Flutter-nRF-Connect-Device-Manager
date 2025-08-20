package no.nordicsemi.android.mcumgr_flutter

import android.util.Log
import com.google.protobuf.kotlin.toByteString
import io.runtime.mcumgr.McuMgrCallback
import io.runtime.mcumgr.exception.McuMgrException
import io.runtime.mcumgr.managers.FileSystemManager
import io.runtime.mcumgr.response.fs.McuMgrFsListResponse
import io.runtime.mcumgr.response.fs.McuMgrFsStatResponse
import no.nordicsemi.android.mcumgr_flutter.gen.*
import no.nordicsemi.android.mcumgr_flutter.utils.StreamHandler

class FsManager(
    private val transport: LoggableMcuMgrBleTransport,
    private val readStreamHandler: StreamHandler,
    private val logStreamHandler: StreamHandler
) {
    private val fsManager: FileSystemManager = FileSystemManager(transport)
    private val address: String = transport.bluetoothDevice.address

    fun list(path: String, callbackResult: (ByteArray) -> Unit) {
        val cb = object : McuMgrCallback<McuMgrFsListResponse> {
            override fun onResponse(response: McuMgrFsListResponse) {
                val entries = response.files?.map { file ->
                    ProtoFsEntry(
                        name = file.name,
                        size = file.size,
                        dir = file.type == io.runtime.mcumgr.fs.McuMgrFsEntry.Type.DIRECTORY,
                        mode = file.mode.toInt(),
                        mtime = file.mtime
                    )
                } ?: listOf()

                val res = ProtoFsListResponse(
                    uuid = address,
                    files = entries,
                    success = true
                )
                callbackResult(res.encode())
            }

            override fun onError(exception: McuMgrException) {
                val res = ProtoFsListResponse(
                    uuid = address,
                    success = false,
                    error = ProtoError(localizedDescription = exception.message ?: "Unknown error")
                )
                callbackResult(res.encode())
            }
        }
        fsManager.list(path, cb)
    }

    fun stat(path: String, callbackResult: (ByteArray) -> Unit) {
        val cb = object : McuMgrCallback<McuMgrFsStatResponse> {
            override fun onResponse(response: McuMgrFsStatResponse) {
                val entry = response.entry?.let { e ->
                    ProtoFsEntry(
                        name = e.name,
                        size = e.size,
                        dir = e.type == io.runtime.mcumgr.fs.McuMgrFsEntry.Type.DIRECTORY,
                        mode = e.mode.toInt(),
                        mtime = e.mtime
                    )
                }
                val res = ProtoFsStatResponse(
                    uuid = address,
                    stats = entry,
                    success = true
                )
                callbackResult(res.encode())
            }

            override fun onError(exception: McuMgrException) {
                val res = ProtoFsStatResponse(
                    uuid = address,
                    success = false,
                    error = ProtoError(localizedDescription = exception.message ?: "Unknown error")
                )
                callbackResult(res.encode())
            }
        }

        fsManager.stat(path, cb)
    }

    fun remove(path: String, callbackResult: (ByteArray) -> Unit) {
        val cb = object : McuMgrCallback<Void> {
            override fun onResponse(response: Void?) {
                val res = ProtoFsRemoveResponse(
                    uuid = address,
                    success = true
                )
                callbackResult(res.encode())
            }

            override fun onError(exception: McuMgrException) {
                val res = ProtoFsRemoveResponse(
                    uuid = address,
                    success = false,
                    error = ProtoError(localizedDescription = exception.message ?: "Unknown error")
                )
                callbackResult(res.encode())
            }
        }
        fsManager.remove(path, cb)
    }

    fun open(path: String, flags: Int, callbackResult: (ByteArray) -> Unit) {
        val cb = object : McuMgrCallback<Int> {
            override fun onResponse(response: Int) {
                val res = ProtoFsOpenResponse(
                    uuid = address,
                    fd = response,
                    success = true
                )
                callbackResult(res.encode())
            }

            override fun onError(exception: McuMgrException) {
                val res = ProtoFsOpenResponse(
                    uuid = address,
                    fd = -1,
                    success = false,
                    error = ProtoError(localizedDescription = exception.message ?: "Unknown error")
                )
                callbackResult(res.encode())
            }
        }
        fsManager.open(path, flags, cb)
    }

    fun read(fd: Int, offset: Long, length: Long, callbackResult: (ByteArray) -> Unit) {
        val cb = object : McuMgrCallback<io.runtime.mcumgr.response.fs.McuMgrFsReadResponse> {
            override fun onResponse(response: io.runtime.mcumgr.response.fs.McuMgrFsReadResponse) {
                val data = response.data
                val res = ProtoFsReadResponse(
                    uuid = address,
                    data = data.toByteArray(),
                    done = response.eof,
                    success = true
                )
                callbackResult(res.encode())
            }

            override fun onError(exception: McuMgrException) {
                val res = ProtoFsReadResponse(
                    uuid = address,
                    data = ByteArray(0),
                    done = true,
                    success = false,
                    error = ProtoError(localizedDescription = exception.message ?: "Unknown error")
                )
                callbackResult(res.encode())
            }
        }
        fsManager.read(fd, offset, length, cb)
    }

    fun write(fd: Int, data: ByteArray, offset: Long, callbackResult: (ByteArray) -> Unit) {
        val cb = object : McuMgrCallback<Long> {
            override fun onResponse(response: Long) {
                val res = ProtoFsWriteResponse(
                    uuid = address,
                    written = response,
                    success = true
                )
                callbackResult(res.encode())
            }

            override fun onError(exception: McuMgrException) {
                val res = ProtoFsWriteResponse(
                    uuid = address,
                    written = 0,
                    success = false,
                    error = ProtoError(localizedDescription = exception.message ?: "Unknown error")
                )
                callbackResult(res.encode())
            }
        }
        fsManager.write(fd, data, offset, cb)
    }

    fun close(fd: Int, callbackResult: (ByteArray) -> Unit) {
        val cb = object : McuMgrCallback<Void> {
            override fun onResponse(response: Void?) {
                val res = ProtoFsCloseResponse(
                    uuid = address,
                    success = true
                )
                callbackResult(res.encode())
            }

            override fun onError(exception: McuMgrException) {
                val res = ProtoFsCloseResponse(
                    uuid = address,
                    success = false,
                    error = ProtoError(localizedDescription = exception.message ?: "Unknown error")
                )
                callbackResult(res.encode())
            }
        }
        fsManager.close(fd, cb)
    }
}
