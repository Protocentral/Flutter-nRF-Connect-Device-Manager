import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:mcumgr_flutter/proto/flutter_mcu.pb.dart';

import 'method_channels.dart';

class FsEntry {
  final String name;
  final int size;
  final bool dir;
  final int mode;
  final int mtime;

  FsEntry(this.name, this.size, this.dir, this.mode, this.mtime);

  factory FsEntry.fromProto(ProtoFsEntry p) => FsEntry(
        p.name,
        p.size.toInt(),
        p.dir,
        p.mode,
        p.mtime.toInt(),
      );
}

class DeviceFsManager {
  final String _deviceId;

  DeviceFsManager._deviceIdentifier(this._deviceId);

  static Future<DeviceFsManager> getInstance(String deviceId) async {
    try {
      await methodChannel.invokeMethod(
          FsManagerMethod.initializeFsManager.rawValue, deviceId);
    } catch (error, stack) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: error,
        stack: stack,
        library: 'mcumgr_flutter',
        context: ErrorDescription('getInstance: initialize Fs Manager'),
      ));
    }

    return DeviceFsManager._deviceIdentifier(deviceId);
  }

  Future<List<FsEntry>?> list(String path) async {
    final arg = ProtoFsStatRequest()
      ..uuid = _deviceId
      ..path = path;
    final resp = await methodChannel.invokeMethod(FsManagerMethod.fsList.rawValue, arg.writeToBuffer());
    final ProtoFsListResponse listResp = ProtoFsListResponse.fromBuffer(resp);
    if (listResp.success) {
      return listResp.files.map((e) => FsEntry.fromProto(e)).toList();
    }
    return null;
  }

  Future<FsEntry?> stat(String path) async {
    final arg = ProtoFsStatRequest()
      ..uuid = _deviceId
      ..path = path;
    final resp = await methodChannel.invokeMethod(FsManagerMethod.fsStat.rawValue, arg.writeToBuffer());
    final ProtoFsStatResponse s = ProtoFsStatResponse.fromBuffer(resp);
    if (s.success && s.hasStats()) {
      return FsEntry.fromProto(s.stats);
    }
    return null;
  }

  Future<bool> remove(String path) async {
    final arg = ProtoFsRemoveRequest()
      ..uuid = _deviceId
      ..path = path;
    final resp = await methodChannel.invokeMethod(FsManagerMethod.fsRemove.rawValue, arg.writeToBuffer());
    final ProtoFsRemoveResponse r = ProtoFsRemoveResponse.fromBuffer(resp);
    return r.success;
  }

  Future<ProtoFsOpenResponse> open(String path, int flags) async {
    final arg = ProtoFsOpenRequest()
      ..uuid = _deviceId
      ..path = path
      ..flags = flags;
    final resp = await methodChannel.invokeMethod(FsManagerMethod.fsOpen.rawValue, arg.writeToBuffer());
    final ProtoFsOpenResponse r = ProtoFsOpenResponse.fromBuffer(resp);
    return r;
  }

  Future<ProtoFsReadResponse> read(int fd, int offset, int length) async {
    final arg = ProtoFsReadRequest()
      ..uuid = _deviceId
      ..fd = fd
      ..offset = offset
      ..length = length;
    final resp = await methodChannel.invokeMethod(FsManagerMethod.fsRead.rawValue, arg.writeToBuffer());
    return ProtoFsReadResponse.fromBuffer(resp);
  }

  Future<ProtoFsWriteResponse> write(int fd, Uint8List data, {int offset = 0}) async {
    final arg = ProtoFsWriteRequest()
      ..uuid = _deviceId
      ..fd = fd
      ..data = data
      ..offset = offset;
    final resp = await methodChannel.invokeMethod(FsManagerMethod.fsWrite.rawValue, arg.writeToBuffer());
    return ProtoFsWriteResponse.fromBuffer(resp);
  }

  Future<bool> close(int fd) async {
    final arg = ProtoFsCloseRequest()
      ..uuid = _deviceId
      ..fd = fd;
    final resp = await methodChannel.invokeMethod(FsManagerMethod.fsClose.rawValue, arg.writeToBuffer());
    final ProtoFsCloseResponse r = ProtoFsCloseResponse.fromBuffer(resp);
    return r.success;
  }
}
