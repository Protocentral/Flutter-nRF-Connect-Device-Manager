package no.nordicsemi.android.mcumgr_flutter

import android.bluetooth.BluetoothAdapter
import android.content.Context
import android.util.Pair
import androidx.annotation.NonNull
import com.google.protobuf.kotlin.toByteString
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.runtime.mcumgr.McuMgrCallback
import io.runtime.mcumgr.dfu.FirmwareUpgradeManager
import io.runtime.mcumgr.exception.McuMgrException
import io.runtime.mcumgr.response.img.McuMgrImageStateResponse
import no.nordicsemi.android.mcumgr_flutter.ext.toProto

import no.nordicsemi.android.mcumgr_flutter.logging.LoggableMcuMgrBleTransport
import no.nordicsemi.android.mcumgr_flutter.utils.*
import no.nordicsemi.android.mcumgr_flutter.gen.*

/** McumgrFlutterPlugin */
class McumgrFlutterPlugin : FlutterPlugin, MethodCallHandler {
	private val namespace = "mcumgr_flutter"

	/// The MethodChannel that will the communication between Flutter and native Android
	///
	/// This local reference serves to register the plugin with the Flutter Engine and unregister it
	/// when the Flutter Engine is detached from the Activity
	private lateinit var methodChannel: MethodChannel

	private lateinit var updateStateEventChannel: EventChannel
	private lateinit var updateProgressEventChannel: EventChannel
	private lateinit var logEventChannel: EventChannel

	private var updateStateStreamHandler = StreamHandler()
	private var updateProgressStreamHandler = StreamHandler()
	private var logStreamHandler = StreamHandler()

	private lateinit var context: Context

	private var managers: MutableMap<String, UpdateManager> = mutableMapOf()

	// File system managers per device
	private var fsManagers: MutableMap<String, FsManager> = mutableMapOf()

	override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
		context = flutterPluginBinding.applicationContext

		methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "$namespace/method_channel")
		methodChannel.setMethodCallHandler(this)

		updateStateEventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "$namespace/update_state_event_channel")
		updateStateEventChannel.setStreamHandler(updateStateStreamHandler)
		updateProgressEventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "$namespace/update_progress_event_channel")
		updateProgressEventChannel.setStreamHandler(updateProgressStreamHandler)
		logEventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "$namespace/log_event_channel")
		logEventChannel.setStreamHandler(logStreamHandler)
	}

	override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
		methodChannel.setMethodCallHandler(null)
	}

	override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
		val method = FlutterMethod.valueOfOrNull(call.method).guard {
			result.notImplemented()
			return
		}
		try {
			when (method) {
				FlutterMethod.initializeUpdateManager -> {
					initializeUpdateManager(call)
					result.success(null)
				}

				FlutterMethod.update -> {
					update(call)
					result.success(null)
				}

				FlutterMethod.updateSingleImage -> {
					updateSingleImage(call)
					result.success(null)
				}

				FlutterMethod.pause -> {
					retrieveManager(call).pause()
					result.success(null)
				}

				FlutterMethod.resume -> {
					retrieveManager(call).resume()
					result.success(null)
				}

				FlutterMethod.cancel -> {
					retrieveManager(call).cancel()
					result.success(null)
				}

				FlutterMethod.isPaused -> {
					val isPaused = retrieveManager(call).isPaused
					result.success(isPaused)
				}

				FlutterMethod.isInProgress -> {
					val isPaused = retrieveManager(call).isInProgress
					result.success(isPaused)
				}

				FlutterMethod.readLogs -> {
					result.success(readLogs(call))
				}

				FlutterMethod.clearLogs -> {
					retrieveManager(call).clearLogs()
					result.success(null)
				}

				FlutterMethod.kill -> {
					kill(call)
					result.success(null)
				}

				FlutterMethod.readImageList -> {
					imageList(call, result)
				}

				// FS Manager methods
				FlutterMethod.initializeFsManager -> {
					initializeFsManager(call)
					result.success(null)
				}

				FlutterMethod.fsList -> {
					fsList(call, result)
				}

				FlutterMethod.fsStat -> {
					fsStat(call, result)
				}

				FlutterMethod.fsRemove -> {
					fsRemove(call, result)
				}

				FlutterMethod.fsOpen -> {
					fsOpen(call, result)
				}

				FlutterMethod.fsRead -> {
					fsRead(call, result)
				}

				FlutterMethod.fsWrite -> {
					fsWrite(call, result)
				}

				FlutterMethod.fsClose -> {
					fsClose(call, result)
				}

				FlutterMethod.killFsManager -> {
					killFsManager(call)
					result.success(null)
				}
			}
		} catch (e: FlutterError) {
			result.error(e.code, e.message, null)
		}
	}

	@Throws(FlutterError::class)
	private fun initializeUpdateManager(@NonNull call: MethodCall) {
		val address = (call.arguments as? String).guard {
			throw WrongArguments("Device address expected")
		}
		if (managers.containsKey(address)) {
			throw UpdateManagerExists("Updated manager for provided peripheral already exists")
		}
		val device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(address)
		val transport = LoggableMcuMgrBleTransport(context, device , logStreamHandler)
		val updateManager = UpdateManager(transport,
			updateStateStreamHandler,
			updateProgressStreamHandler,
			logStreamHandler)

		managers[address] = updateManager
	}

	@Throws(FlutterError::class)
	private fun update(@NonNull call: MethodCall) {
		val bytes = (call.arguments as? ByteArray).guard {
			throw WrongArguments("Can not parse provided arguments: ${call.arguments.javaClass}")
		}
		val arg = ProtoUpdateWithImageCallArguments.ADAPTER.decode(bytes)
		val updateManager = managers[arg.device_uuid].guard {
			throw UpdateManagerDoesNotExist("Update manager does not exist")
		}

		val config = arg.configuration?.let { config ->
			return@let FirmwareUpgradeConfiguration(
				config.estimatedSwapTimeMs,
				config.eraseAppSettings,
				config.pipelineDepth.toInt(),
				when (config.byteAlignment) {
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.TWO_BYTE -> 2
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.FOUR_BYTE -> 4
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.EIGHT_BYTE -> 8
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.SIXTEEN_BYTE -> 16
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.DISABLED -> 0
				},
				config.reassemblyBufferSize,
				when (config.firmwareUpgradeMode) {
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.TEST_ONLY -> FirmwareUpgradeManager.Mode.TEST_ONLY
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.TEST_AND_CONFIRM -> FirmwareUpgradeManager.Mode.TEST_AND_CONFIRM
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.CONFIRM_ONLY -> FirmwareUpgradeManager.Mode.CONFIRM_ONLY
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.UPLOAD_ONLY -> FirmwareUpgradeManager.Mode.NONE
				}
			)
		}

		val images = arg.images.map { Pair.create(it.image, it.data_.toByteArray()) }
		updateManager.start(images, config)
	}

	@Throws(FlutterError::class)
	private fun updateSingleImage(@NonNull call: MethodCall) {
		val bytes = (call.arguments as? ByteArray).guard {
			throw WrongArguments("Can not parse provided arguments: ${call.arguments.javaClass}")
		}
		val args = ProtoUpdateCallArgument.ADAPTER.decode(bytes)
		val updateManager = managers[args.device_uuid].guard {
			throw UpdateManagerDoesNotExist("Update manager does not exist")
		}
		val image = args.firmware_data.toByteArray()

		val config = args.configuration?.let { config ->
			return@let FirmwareUpgradeConfiguration(
				config.estimatedSwapTimeMs,
				config.eraseAppSettings,
				config.pipelineDepth.toInt(),
				when (config.byteAlignment) {
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.TWO_BYTE -> 2
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.FOUR_BYTE -> 4
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.EIGHT_BYTE -> 8
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.SIXTEEN_BYTE -> 16
					ProtoFirmwareUpgradeConfiguration.ImageUploadAlignment.DISABLED -> 0
				},
				config.reassemblyBufferSize,
				when (config.firmwareUpgradeMode) {
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.TEST_ONLY -> FirmwareUpgradeManager.Mode.TEST_ONLY
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.TEST_AND_CONFIRM -> FirmwareUpgradeManager.Mode.TEST_AND_CONFIRM
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.CONFIRM_ONLY -> FirmwareUpgradeManager.Mode.CONFIRM_ONLY
					ProtoFirmwareUpgradeConfiguration.FirmwareUpgradeMode.UPLOAD_ONLY -> FirmwareUpgradeManager.Mode.NONE
				}
			)
		}

		updateManager.start(args.firmware_data.toByteArray(), config)
	}

	@Throws(FlutterError::class)
	private fun retrieveManager(@NonNull call: MethodCall): UpdateManager {
		val address = (call.arguments as? String).guard {
			throw WrongArguments("Device address expected")
		}
		return managers[address].guard {
			throw UpdateManagerDoesNotExist("Update manager does not exist")
		}
	}

	@Throws(FlutterError::class)
	private fun readLogs(@NonNull call: MethodCall): ByteArray {
		val data = (call.arguments as? ByteArray).guard {
			throw WrongArguments("Device address expected")
		}
		val arg = ProtoReadLogCallArguments.ADAPTER.decode(data)
		val address = arg.uuid
		val clearLogs = arg.clearLogs
		val updateManager = managers[address].guard {
			throw UpdateManagerDoesNotExist("Update manager does not exist")
		}

		return updateManager.readAllLogs(clearLogs).encode()
	}

	private fun kill(@NonNull call: MethodCall) {
		val address = (call.arguments as? String).guard {
			throw WrongArguments("Device Address expected")
		}
		if (managers.containsKey(address)) {
			managers[address]!!.releaseTransport();
		}
		managers.remove(address)
	}

	/** Image Manager */
	private fun imageList(@NonNull call: MethodCall, result: Result) {
		val address = (call.arguments as? String).guard {
			throw WrongArguments("Device address expected")
		}
		val updateManager = managers[address].guard {
			throw UpdateManagerDoesNotExist("Update manager does not exist")
		}

		val callback = object : McuMgrCallback<McuMgrImageStateResponse> {
			override fun onResponse(response: McuMgrImageStateResponse) {
				var protoResponse: ProtoListImagesResponse
				if (response.images != null) {
					val images = response.images.map { it.toProto() }
					protoResponse = ProtoListImagesResponse(
						uuid = address,
						images = images,
						existing = true
					)
				} else {
					protoResponse = ProtoListImagesResponse(
						uuid = address,
						existing = false
					)
				}
				result.success(protoResponse.encode())
			}

			override fun onError(exception: McuMgrException) {
				result.error("mcumgr_error", exception.message, null)
			}
		}

		updateManager.imageManager.list(callback)
	}

		// --- FS Manager helpers ---

		@Throws(FlutterError::class)
		private fun initializeFsManager(@NonNull call: MethodCall) {
			val address = (call.arguments as? String).guard {
				throw WrongArguments("Device address expected")
			}
			if (fsManagers.containsKey(address)) {
				// already initialized
				return
			}
			val device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(address)
			// Reuse existing transport if UpdateManager exists for device
			val transport = if (managers.containsKey(address)) {
				managers[address]!!.let { it }
				// access transport via UpdateManager (it exposes releaseTransport only) - retrieve transport via reflection not ideal
				// For now create a new transport; future improvement: share transport
				LoggableMcuMgrBleTransport(context, device, logStreamHandler)
			} else {
				LoggableMcuMgrBleTransport(context, device, logStreamHandler)
			}
			val fsManager = FsManager(transport, StreamHandler(), logStreamHandler)
			fsManagers[address] = fsManager
		}

		@Throws(FlutterError::class)
		private fun retrieveFsManager(@NonNull call: MethodCall): FsManager {
			val address = (call.arguments as? String).guard {
				throw WrongArguments("Device address expected")
			}
			return fsManagers[address].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
		}

		private fun fsList(@NonNull call: MethodCall, result: Result) {
			val bytes = (call.arguments as? ByteArray).guard {
				throw WrongArguments("Can not parse provided arguments: ${call.arguments?.javaClass}")
			}
			val arg = ProtoFsStatRequest.ADAPTER.decode(bytes)
			val fsManager = fsManagers[arg.uuid].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
			fsManager.list(arg.path) { rb -> result.success(rb) }
		}

		private fun fsStat(@NonNull call: MethodCall, result: Result) {
			val bytes = (call.arguments as? ByteArray).guard {
				throw WrongArguments("Can not parse provided arguments: ${call.arguments?.javaClass}")
			}
			val arg = ProtoFsStatRequest.ADAPTER.decode(bytes)
			val fsManager = fsManagers[arg.uuid].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
			fsManager.stat(arg.path) { rb -> result.success(rb) }
		}

		private fun fsRemove(@NonNull call: MethodCall, result: Result) {
			val bytes = (call.arguments as? ByteArray).guard {
				throw WrongArguments("Can not parse provided arguments: ${call.arguments?.javaClass}")
			}
			val arg = ProtoFsRemoveRequest.ADAPTER.decode(bytes)
			val fsManager = fsManagers[arg.uuid].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
			fsManager.remove(arg.path) { rb -> result.success(rb) }
		}

		private fun fsOpen(@NonNull call: MethodCall, result: Result) {
			val bytes = (call.arguments as? ByteArray).guard {
				throw WrongArguments("Can not parse provided arguments: ${call.arguments?.javaClass}")
			}
			val arg = ProtoFsOpenRequest.ADAPTER.decode(bytes)
			val fsManager = fsManagers[arg.uuid].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
			fsManager.open(arg.path, arg.flags) { rb -> result.success(rb) }
		}

		private fun fsRead(@NonNull call: MethodCall, result: Result) {
			val bytes = (call.arguments as? ByteArray).guard {
				throw WrongArguments("Can not parse provided arguments: ${call.arguments?.javaClass}")
			}
			val arg = ProtoFsReadRequest.ADAPTER.decode(bytes)
			val fsManager = fsManagers[arg.uuid].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
			fsManager.read(arg.fd, arg.offset, arg.length) { rb -> result.success(rb) }
		}

		private fun fsWrite(@NonNull call: MethodCall, result: Result) {
			val bytes = (call.arguments as? ByteArray).guard {
				throw WrongArguments("Can not parse provided arguments: ${call.arguments?.javaClass}")
			}
			val arg = ProtoFsWriteRequest.ADAPTER.decode(bytes)
			val fsManager = fsManagers[arg.uuid].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
			fsManager.write(arg.fd, arg.data_.toByteArray(), arg.offset) { rb -> result.success(rb) }
		}

		private fun fsClose(@NonNull call: MethodCall, result: Result) {
			val bytes = (call.arguments as? ByteArray).guard {
				throw WrongArguments("Can not parse provided arguments: ${call.arguments?.javaClass}")
			}
			val arg = ProtoFsCloseRequest.ADAPTER.decode(bytes)
			val fsManager = fsManagers[arg.uuid].guard {
				throw FlutterError("FsManagerDoesNotExist", "FS manager does not exist")
			}
			fsManager.close(arg.fd) { rb -> result.success(rb) }
		}

		private fun killFsManager(@NonNull call: MethodCall) {
			val address = (call.arguments as? String).guard {
				throw WrongArguments("Device Address expected")
			}
			if (fsManagers.containsKey(address)) {
				// release transport if needed
				// For now just remove
				fsManagers.remove(address)
			}
		}
}
