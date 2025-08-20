import Foundation
import iOSMcuManagerLibrary

class FsManager {
    let transport: McuMgrBleTransport
    let fs: FileSystemManager
    let peripheral: CBPeripheral

    init(peripheral: CBPeripheral) {
        self.peripheral = peripheral
        self.transport = McuMgrBleTransport(peripheral)
        self.fs = FileSystemManager(transporter: self.transport)
    }

    func list(path: String, completion: @escaping (Data?, Error?) -> Void) {
        fs.list(path: path) { response, error in
            var proto = ProtoFsListResponse()
            if let err = error {
                proto.success = false
                proto.error = ProtoError(localizedDescription: err.localizedDescription)
            } else if let resp = response {
                proto.success = true
                proto.files = resp.map { entry in
                    var e = ProtoFsEntry()
                    e.name = entry.name
                    e.size = UInt64(entry.size)
                    e.dir = entry.isDir
                    e.mode = UInt32(entry.mode)
                    e.mtime = UInt64(entry.mtime)
                    return e
                }
            } else {
                proto.success = false
            }

            do {
                completion(try proto.serializedData(), nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func stat(path: String, completion: @escaping (Data?, Error?) -> Void) {
        fs.stat(path: path) { response, error in
            var proto = ProtoFsStatResponse()
            if let err = error {
                proto.success = false
                proto.error = ProtoError(localizedDescription: err.localizedDescription)
            } else if let resp = response {
                proto.success = true
                var e = ProtoFsEntry()
                e.name = resp.name
                e.size = UInt64(resp.size)
                e.dir = resp.isDir
                e.mode = UInt32(resp.mode)
                e.mtime = UInt64(resp.mtime)
                proto.stats = e
            } else {
                proto.success = false
            }

            do {
                completion(try proto.serializedData(), nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func remove(path: String, completion: @escaping (Data?, Error?) -> Void) {
        fs.remove(path: path) { response, error in
            var proto = ProtoFsRemoveResponse()
            if let err = error {
                proto.success = false
                proto.error = ProtoError(localizedDescription: err.localizedDescription)
            } else if let resp = response {
                proto.success = resp
            } else {
                proto.success = false
            }

            do {
                completion(try proto.serializedData(), nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func open(path: String, flags: Int32, completion: @escaping (Data?, Error?) -> Void) {
        fs.open(path: path, flags: flags) { response, error in
            var proto = ProtoFsOpenResponse()
            if let err = error {
                proto.success = false
                proto.error = ProtoError(localizedDescription: err.localizedDescription)
            } else if let resp = response {
                proto.success = true
                proto.fd = Int32(resp)
            } else {
                proto.success = false
            }

            do {
                completion(try proto.serializedData(), nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func read(fd: Int32, offset: Int32, length: Int32, completion: @escaping (Data?, Error?) -> Void) {
        fs.read(fd: fd, offset: offset, length: length) { response, error in
            var proto = ProtoFsReadResponse()
            if let err = error {
                proto.success = false
                proto.error = ProtoError(localizedDescription: err.localizedDescription)
            } else if let resp = response {
                proto.success = true
                proto.data = resp
            } else {
                proto.success = false
            }

            do {
                completion(try proto.serializedData(), nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func write(fd: Int32, data: Data, offset: Int32, completion: @escaping (Data?, Error?) -> Void) {
        fs.write(fd: fd, data: data, offset: offset) { response, error in
            var proto = ProtoFsWriteResponse()
            if let err = error {
                proto.success = false
                proto.error = ProtoError(localizedDescription: err.localizedDescription)
            } else if let resp = response {
                proto.success = true
                proto.written = UInt32(resp)
            } else {
                proto.success = false
            }

            do {
                completion(try proto.serializedData(), nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func close(fd: Int32, completion: @escaping (Data?, Error?) -> Void) {
        fs.close(fd: fd) { response, error in
            var proto = ProtoFsCloseResponse()
            if let err = error {
                proto.success = false
                proto.error = ProtoError(localizedDescription: err.localizedDescription)
            } else if let resp = response {
                proto.success = resp
            } else {
                proto.success = false
            }

            do {
                completion(try proto.serializedData(), nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
