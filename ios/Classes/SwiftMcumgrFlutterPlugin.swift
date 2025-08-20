import Flutter
import UIKit
import CoreBluetooth
import iOSMcuManagerLibrary

public class SwiftMcumgrFlutterPlugin: NSObject, FlutterPlugin {
    private var initManagerResultQueue = ConcurrentQueue<(call: FlutterMethodCall, result: FlutterResult)>()
    
    static let namespace = "mcumgr_flutter"
    
    private var updateManagers: [String : UpdateManager] = [:]
    private var fsManagers: [String : FsManager] = [:]
    private var centralManager: CBCentralManager? = nil
    
    private let updateStateEventChannel: FlutterEventChannel
    private let updateProgressEventChannel: FlutterEventChannel
    
    // Log channels
    private let logEventChannel: FlutterEventChannel
    private let fsReadEventChannel: FlutterEventChannel
    
    private let updateStateStreamHandler = StreamHandler()
    private let updateProgressStreamHandler = StreamHandler()
    private let logStreamHandler = StreamHandler()
    
    public init(
        updateStateEventChannel: FlutterEventChannel, 
        updateProgressEventChannel: FlutterEventChannel, 
        logEventChannel: FlutterEventChannel,
        fsReadEventChannel: FlutterEventChannel
    ) {
        self.updateStateEventChannel = updateStateEventChannel
        self.updateProgressEventChannel = updateProgressEventChannel
        self.logEventChannel = logEventChannel
        self.fsReadEventChannel = fsReadEventChannel
        
        super.init()
        
    updateStateEventChannel.setStreamHandler(updateStateStreamHandler)
    updateProgressEventChannel.setStreamHandler(updateProgressStreamHandler)
    logEventChannel.setStreamHandler(logStreamHandler)
    fsReadEventChannel.setStreamHandler(StreamHandler())
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: namespace + "/method_channel", binaryMessenger: registrar.messenger())
        
        let updateStateEventChannel = FlutterEventChannel(channel: .updateStateEventChannel, binaryMessenger: registrar.messenger())
        let updateProgressEventChannel = FlutterEventChannel(channel: .updateProgressEventChannel, binaryMessenger: registrar.messenger())
        let logEventChannel = FlutterEventChannel(channel: .logEventChannel, binaryMessenger: registrar.messenger())
        let fsReadEventChannel = FlutterEventChannel(channel: .fsReadEventChannel, binaryMessenger: registrar.messenger())
       
        let instance = SwiftMcumgrFlutterPlugin(
            updateStateEventChannel: updateStateEventChannel,
            updateProgressEventChannel: updateProgressEventChannel,
            logEventChannel: logEventChannel,
            fsReadEventChannel: fsReadEventChannel
        )
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        guard let method = FlutterMethod(rawValue: call.method) else {
            let error = FlutterMethodNotImplemented
            result(error)
            return
        }
        
        do {
            switch method {
            case .update:
                try update(call: call)
                result(nil)
            case .updateSingleImage:
                try updateSingleImage(call: call)
                result(nil)
            case .initializeUpdateManager:
                try initializeUpdateManager(call: call, result: result)
            case .pause:
                try pause(call: call)
                result(nil)
            case .resume:
                try resume(call: call)
                result(nil)
            case .isPaused:
                result(try isPaused(call: call))
            case .isInProgress:
                result(try isInProgress(call: call))
            case .cancel:
                try cancel(call: call)
                result(nil)
            case .kill:
                try kill(call: call)
                result(nil)
            case .readLogs:
                result(try readLogs(call: call).serializedData())
            case .initializeFsManager:
                try initializeFsManager(call: call, result: result)
            case .fsList:
                try fsList(call: call, result: result)
            case .fsStat:
                try fsStat(call: call, result: result)
            case .fsRemove:
                try fsRemove(call: call, result: result)
            case .fsOpen:
                try fsOpen(call: call, result: result)
            case .fsRead:
                try fsRead(call: call, result: result)
            case .fsWrite:
                try fsWrite(call: call, result: result)
            case .fsClose:
                try fsClose(call: call, result: result)
            case .killFsManager:
                try killFsManager(call: call)
            case .clearLogs:
                try retrieveManager(call: call).updateLogger.clearLogs()
                result(nil)
            case .readImageList:
                try readImages(call: call, result: result)
            }
        } catch let e as FlutterError {
            result(e)
        } catch {
            result(FlutterError(error: error, call: call))
        }
        
    }
    
    private func initializeUpdateManager(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let uuidString = call.arguments as? String, let uuid = UUID(uuidString: uuidString) else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not create UUID from provided arguments", details: call.debugDetails)
        }
        
        if let centralManager {
            guard let peripheral = centralManager.retrievePeripherals(withIdentifiers: [uuid]).first else {
                throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can't retrieve peripheral with provided UUID", details: call.debugDetails)
            }
            
            try handleUpdateManager(for: peripheral, call: call)
            result(nil)
        } else {
            centralManager = CBCentralManager()
            centralManager?.delegate = self
            
            initManagerResultQueue.enqueue((call: call, result: result))
        }
    }
    
    private func handleUpdateManager(for peripheral: CBPeripheral, call: FlutterMethodCall) throws {
        guard let uuidString = call.arguments as? String else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not create UUID from provided arguments", details: call.debugDetails)
        }
        
        guard case .none = updateManagers[uuidString] else {
            throw FlutterError(code: ErrorCode.updateManagerExists.rawValue, message: "Updated manager for provided peripheral already exists", details: call.debugDetails)
        }
        
        let logger = UpdateLogger(identifier: uuidString, streamHandler: logStreamHandler)
        let updateManager = UpdateManager(peripheral: peripheral, progressStreamHandler: updateProgressStreamHandler, stateStreamHandler: updateStateStreamHandler, logStreamHandler: logStreamHandler, updateLogger: logger)
        updateManagers[uuidString] = updateManager
    }
    
    private func retrieveManager(call: FlutterMethodCall) throws -> UpdateManager {
        guard let uuid = call.arguments as? String else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can't retrieve UUID of the device", details: call.debugDetails)
        }

        guard let manager = updateManagers[uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Update manager does not exist", details: call.debugDetails)
        }

        return manager;
    }

    private func pause(call: FlutterMethodCall) throws {
        try retrieveManager(call: call).pause()
    }

    private func resume(call: FlutterMethodCall) throws {
        try retrieveManager(call: call).resume()
    }

    private func isPaused(call: FlutterMethodCall) throws -> Bool {
        try retrieveManager(call: call).dfuManager.isPaused()
    }

    private func isInProgress(call: FlutterMethodCall) throws -> Bool {
        try retrieveManager(call: call).dfuManager.isInProgress()
    }
    
    private func cancel(call: FlutterMethodCall) throws {
        try retrieveManager(call: call).cancel()
    }
    
    private func update(call: FlutterMethodCall) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }
        
        let args = try ProtoUpdateWithImageCallArguments(serializedData: data.data)
        guard let manager = updateManagers[args.deviceUuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Update manager does not exist", details: call.debugDetails)
        }
        
        let images = args.images.map { ImageManager.Image(proto: $0) }
        let config = args.hasConfiguration ? FirmwareUpgradeConfiguration(proto: args.configuration) : FirmwareUpgradeConfiguration()
        
        try manager.update(images: images, config: config)
    }
    
    private func updateSingleImage(call: FlutterMethodCall) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }
        
        let args = try ProtoUpdateCallArgument(serializedData: data.data)
        guard let manager = updateManagers[args.deviceUuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Update manager does not exist", details: call.debugDetails)
        }
        
        let config = args.hasConfiguration ? FirmwareUpgradeConfiguration(proto: args.configuration) : FirmwareUpgradeConfiguration()
        let hash: Data
        if args.hasHash {
            hash = args.hash
        } else {
            hash = try McuMgrImage(data: args.firmwareData).hash
        }
        
        try manager.update(hash: hash, data: args.firmwareData, config: config)
    }
    
    private func kill(call: FlutterMethodCall) throws {
        let uuid = try retrieveManager(call: call).peripheral.identifier.uuidString
        updateManagers.removeValue(forKey: uuid)
    }
    
    // MARK: Logs 
    private func readLogs(call: FlutterMethodCall) throws -> ProtoReadMessagesResponse {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }
        
        let args = try ProtoReadLogCallArguments(serializedData: data.data)
        guard let manager = updateManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Update manager does not exist", details: call.debugDetails)
        }
        
        return manager.updateLogger.readLogs()
    }
    
    private func readImages(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let uuid = call.arguments as? String else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can't retrieve UUID of the device", details: call.debugDetails)
        }
        
        let manager = try retrieveManager(call: call)
        
        manager.imageManager.list { response, error in
            if let error {
                result(FlutterError(error: error, call: call))
                return
            }
            
            var protoResponse = ProtoListImagesResponse()
            if let images = response?.images {
                protoResponse.images = images.map { $0.toProto() }
                protoResponse.existing = true
            } else {
                protoResponse.existing = false
            }
            
            protoResponse.uuid = uuid
            
            do {
                result(try protoResponse.serializedData())
            } catch {
                result(FlutterError(error: error, call: call))
            }
        }
    }

    // MARK: FS Manager
    private func initializeFsManager(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let uuidString = call.arguments as? String, let uuid = UUID(uuidString: uuidString) else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not create UUID from provided arguments", details: call.debugDetails)
        }

        if let centralManager {
            guard let peripheral = centralManager.retrievePeripherals(withIdentifiers: [uuid]).first else {
                throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can't retrieve peripheral with provided UUID", details: call.debugDetails)
            }

            try handleFsManager(for: peripheral, call: call)
            result(nil)
        } else {
            centralManager = CBCentralManager()
            centralManager?.delegate = self

            initManagerResultQueue.enqueue((call: call, result: result))
        }
    }

    private func handleFsManager(for peripheral: CBPeripheral, call: FlutterMethodCall) throws {
        guard let uuidString = call.arguments as? String else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not create UUID from provided arguments", details: call.debugDetails)
        }

        guard case .none = fsManagers[uuidString] else {
            throw FlutterError(code: ErrorCode.updateManagerExists.rawValue, message: "Fs manager for provided peripheral already exists", details: call.debugDetails)
        }

        let manager = FsManager(peripheral: peripheral)
        fsManagers[uuidString] = manager
    }

    private func retrieveFsManager(call: FlutterMethodCall) throws -> FsManager {
        guard let uuid = call.arguments as? String else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can't retrieve UUID of the device", details: call.debugDetails)
        }

        guard let manager = fsManagers[uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        return manager;
    }

    private func fsList(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }

        let args = try ProtoFsStatRequest(serializedData: data.data)
        guard let manager = fsManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        manager.list(path: args.path) { data, error in
            if let err = error {
                result(FlutterError(error: err, call: call))
                return
            }

            if let d = data {
                result(d)
            } else {
                result(FlutterError(code: ErrorCode.internalError.rawValue, message: "No data", details: call.debugDetails))
            }
        }
    }

    private func fsStat(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }

        let args = try ProtoFsStatRequest(serializedData: data.data)
        guard let manager = fsManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        manager.stat(path: args.path) { data, error in
            if let err = error {
                result(FlutterError(error: err, call: call))
                return
            }

            if let d = data {
                result(d)
            } else {
                result(FlutterError(code: ErrorCode.internalError.rawValue, message: "No data", details: call.debugDetails))
            }
        }
    }

    private func fsRemove(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }

        let args = try ProtoFsRemoveRequest(serializedData: data.data)
        guard let manager = fsManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        manager.remove(path: args.path) { data, error in
            if let err = error {
                result(FlutterError(error: err, call: call))
                return
            }

            if let d = data {
                result(d)
            } else {
                result(FlutterError(code: ErrorCode.internalError.rawValue, message: "No data", details: call.debugDetails))
            }
        }
    }

    private func fsOpen(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }

        let args = try ProtoFsOpenRequest(serializedData: data.data)
        guard let manager = fsManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        manager.open(path: args.path, flags: args.flags) { data, error in
            if let err = error {
                result(FlutterError(error: err, call: call))
                return
            }

            if let d = data {
                result(d)
            } else {
                result(FlutterError(code: ErrorCode.internalError.rawValue, message: "No data", details: call.debugDetails))
            }
        }
    }

    private func fsRead(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }

        let args = try ProtoFsReadRequest(serializedData: data.data)
        guard let manager = fsManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        manager.read(fd: args.fd, offset: Int32(args.offset), length: Int32(args.length)) { data, error in
            if let err = error {
                result(FlutterError(error: err, call: call))
                return
            }

            if let d = data {
                result(d)
            } else {
                result(FlutterError(code: ErrorCode.internalError.rawValue, message: "No data", details: call.debugDetails))
            }
        }
    }

    private func fsWrite(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }

        let args = try ProtoFsWriteRequest(serializedData: data.data)
        guard let manager = fsManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        manager.write(fd: args.fd, data: args.data, offset: Int32(args.offset)) { data, error in
            if let err = error {
                result(FlutterError(error: err, call: call))
                return
            }

            if let d = data {
                result(d)
            } else {
                result(FlutterError(code: ErrorCode.internalError.rawValue, message: "No data", details: call.debugDetails))
            }
        }
    }

    private func fsClose(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
        guard let data = call.arguments as? FlutterStandardTypedData else {
            throw FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not parse provided arguments", details: call.debugDetails)
        }

        let args = try ProtoFsCloseRequest(serializedData: data.data)
        guard let manager = fsManagers[args.uuid] else {
            throw FlutterError(code: ErrorCode.updateManagerDoesNotExist.rawValue, message: "Fs manager does not exist", details: call.debugDetails)
        }

        manager.close(fd: args.fd) { data, error in
            if let err = error {
                result(FlutterError(error: err, call: call))
                return
            }

            if let d = data {
                result(d)
            } else {
                result(FlutterError(code: ErrorCode.internalError.rawValue, message: "No data", details: call.debugDetails))
            }
        }
    }

    private func killFsManager(call: FlutterMethodCall) throws {
        let uuid = try retrieveManager(call: call).peripheral.identifier.uuidString
        fsManagers.removeValue(forKey: uuid)
    }
}

extension SwiftMcumgrFlutterPlugin: CBCentralManagerDelegate {
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            while let managerRequest = initManagerResultQueue.dequeue() {
                handlePostponedCall(call: managerRequest.call, result: managerRequest.result, central: central)
            }
            break
        case .unsupported:
            while let managerRequest = initManagerResultQueue.dequeue() {
                let error = FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Unsupported bluetooth state", details: managerRequest.call.debugDetails)
                managerRequest.result(error)
            }
        case .unauthorized:
            while let managerRequest = initManagerResultQueue.dequeue() {
                let error = FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Bluetooth is unauthorized", details: managerRequest.call.debugDetails)
                managerRequest.result(error)
            }
        case .poweredOff:
            while let managerRequest = initManagerResultQueue.dequeue() {
                let error = FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Bluetooth is powered off", details: managerRequest.call.debugDetails)
                managerRequest.result(error)
            }
        default:
            break
        }
    }
    
    private func handlePostponedCall(call: FlutterMethodCall, result: FlutterResult, central: CBCentralManager) {
        guard let uuidString = call.arguments as? String, let uuid = UUID(uuidString: uuidString) else {
            let error = FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not create UUID from provided arguments", details: call.debugDetails)
            result(error)
            return
        }
        if let peripheral = central.retrievePeripherals(withIdentifiers: [uuid]).first {
            do {
                try handleUpdateManager(for: peripheral, call: call)
                result(nil)
            } catch {
                result(error)
            }
        } else {
            let error = FlutterError(code: ErrorCode.wrongArguments.rawValue, message: "Can not retreive peripheral to update", details: call.debugDetails)
            result(error)
        }
    }
    
    
}
