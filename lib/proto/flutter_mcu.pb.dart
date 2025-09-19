// This is a generated file - do not edit.
//
// Generated from lib/proto/flutter_mcu.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'flutter_mcu.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'flutter_mcu.pbenum.dart';

/// Flutter call arguments
class ProtoUpdateCallArgument extends $pb.GeneratedMessage {
  factory ProtoUpdateCallArgument({
    $core.String? deviceUuid,
    $core.List<$core.int>? hash,
    $core.List<$core.int>? firmwareData,
    ProtoFirmwareUpgradeConfiguration? configuration,
  }) {
    final result = create();
    if (deviceUuid != null) result.deviceUuid = deviceUuid;
    if (hash != null) result.hash = hash;
    if (firmwareData != null) result.firmwareData = firmwareData;
    if (configuration != null) result.configuration = configuration;
    return result;
  }

  ProtoUpdateCallArgument._();

  factory ProtoUpdateCallArgument.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoUpdateCallArgument.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoUpdateCallArgument',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceUuid')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'firmwareData', $pb.PbFieldType.OY)
    ..aOM<ProtoFirmwareUpgradeConfiguration>(
        4, _omitFieldNames ? '' : 'configuration',
        subBuilder: ProtoFirmwareUpgradeConfiguration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateCallArgument clone() =>
      ProtoUpdateCallArgument()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateCallArgument copyWith(
          void Function(ProtoUpdateCallArgument) updates) =>
      super.copyWith((message) => updates(message as ProtoUpdateCallArgument))
          as ProtoUpdateCallArgument;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoUpdateCallArgument create() => ProtoUpdateCallArgument._();
  @$core.override
  ProtoUpdateCallArgument createEmptyInstance() => create();
  static $pb.PbList<ProtoUpdateCallArgument> createRepeated() =>
      $pb.PbList<ProtoUpdateCallArgument>();
  @$core.pragma('dart2js:noInline')
  static ProtoUpdateCallArgument getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoUpdateCallArgument>(create);
  static ProtoUpdateCallArgument? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceUuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get firmwareData => $_getN(2);
  @$pb.TagNumber(3)
  set firmwareData($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFirmwareData() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirmwareData() => $_clearField(3);

  @$pb.TagNumber(4)
  ProtoFirmwareUpgradeConfiguration get configuration => $_getN(3);
  @$pb.TagNumber(4)
  set configuration(ProtoFirmwareUpgradeConfiguration value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasConfiguration() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfiguration() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoFirmwareUpgradeConfiguration ensureConfiguration() => $_ensure(3);
}

class ProtoError extends $pb.GeneratedMessage {
  factory ProtoError({
    $core.String? localizedDescription,
  }) {
    final result = create();
    if (localizedDescription != null)
      result.localizedDescription = localizedDescription;
    return result;
  }

  ProtoError._();

  factory ProtoError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoError',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localizedDescription',
        protoName: 'localizedDescription')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoError clone() => ProtoError()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoError copyWith(void Function(ProtoError) updates) =>
      super.copyWith((message) => updates(message as ProtoError)) as ProtoError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoError create() => ProtoError._();
  @$core.override
  ProtoError createEmptyInstance() => create();
  static $pb.PbList<ProtoError> createRepeated() => $pb.PbList<ProtoError>();
  @$core.pragma('dart2js:noInline')
  static ProtoError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoError>(create);
  static ProtoError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localizedDescription => $_getSZ(0);
  @$pb.TagNumber(1)
  set localizedDescription($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLocalizedDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalizedDescription() => $_clearField(1);
}

class ProtoImage extends $pb.GeneratedMessage {
  factory ProtoImage({
    $core.int? image,
    $core.int? slot,
    $core.List<$core.int>? hash,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (image != null) result.image = image;
    if (slot != null) result.slot = slot;
    if (hash != null) result.hash = hash;
    if (data != null) result.data = data;
    return result;
  }

  ProtoImage._();

  factory ProtoImage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoImage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoImage',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'image', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoImage clone() => ProtoImage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoImage copyWith(void Function(ProtoImage) updates) =>
      super.copyWith((message) => updates(message as ProtoImage)) as ProtoImage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoImage create() => ProtoImage._();
  @$core.override
  ProtoImage createEmptyInstance() => create();
  static $pb.PbList<ProtoImage> createRepeated() => $pb.PbList<ProtoImage>();
  @$core.pragma('dart2js:noInline')
  static ProtoImage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoImage>(create);
  static ProtoImage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get image => $_getIZ(0);
  @$pb.TagNumber(1)
  set image($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get slot => $_getIZ(1);
  @$pb.TagNumber(2)
  set slot($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlot() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get hash => $_getN(2);
  @$pb.TagNumber(3)
  set hash($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearHash() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => $_clearField(4);
}

class ProtoUpdateWithImageCallArguments extends $pb.GeneratedMessage {
  factory ProtoUpdateWithImageCallArguments({
    $core.String? deviceUuid,
    $core.Iterable<ProtoImage>? images,
    ProtoFirmwareUpgradeConfiguration? configuration,
  }) {
    final result = create();
    if (deviceUuid != null) result.deviceUuid = deviceUuid;
    if (images != null) result.images.addAll(images);
    if (configuration != null) result.configuration = configuration;
    return result;
  }

  ProtoUpdateWithImageCallArguments._();

  factory ProtoUpdateWithImageCallArguments.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoUpdateWithImageCallArguments.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoUpdateWithImageCallArguments',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceUuid')
    ..pc<ProtoImage>(2, _omitFieldNames ? '' : 'images', $pb.PbFieldType.PM,
        subBuilder: ProtoImage.create)
    ..aOM<ProtoFirmwareUpgradeConfiguration>(
        3, _omitFieldNames ? '' : 'configuration',
        subBuilder: ProtoFirmwareUpgradeConfiguration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateWithImageCallArguments clone() =>
      ProtoUpdateWithImageCallArguments()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateWithImageCallArguments copyWith(
          void Function(ProtoUpdateWithImageCallArguments) updates) =>
      super.copyWith((message) =>
              updates(message as ProtoUpdateWithImageCallArguments))
          as ProtoUpdateWithImageCallArguments;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoUpdateWithImageCallArguments create() =>
      ProtoUpdateWithImageCallArguments._();
  @$core.override
  ProtoUpdateWithImageCallArguments createEmptyInstance() => create();
  static $pb.PbList<ProtoUpdateWithImageCallArguments> createRepeated() =>
      $pb.PbList<ProtoUpdateWithImageCallArguments>();
  @$core.pragma('dart2js:noInline')
  static ProtoUpdateWithImageCallArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoUpdateWithImageCallArguments>(
          create);
  static ProtoUpdateWithImageCallArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceUuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ProtoImage> get images => $_getList(1);

  @$pb.TagNumber(3)
  ProtoFirmwareUpgradeConfiguration get configuration => $_getN(2);
  @$pb.TagNumber(3)
  set configuration(ProtoFirmwareUpgradeConfiguration value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasConfiguration() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfiguration() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoFirmwareUpgradeConfiguration ensureConfiguration() => $_ensure(2);
}

/// STATE
class ProtoUpdateStateChangesStreamArg extends $pb.GeneratedMessage {
  factory ProtoUpdateStateChangesStreamArg({
    $core.String? uuid,
    $core.bool? done,
    ProtoError? error,
    ProtoUpdateStateChanges? updateStateChanges,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (done != null) result.done = done;
    if (error != null) result.error = error;
    if (updateStateChanges != null)
      result.updateStateChanges = updateStateChanges;
    return result;
  }

  ProtoUpdateStateChangesStreamArg._();

  factory ProtoUpdateStateChangesStreamArg.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoUpdateStateChangesStreamArg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoUpdateStateChangesStreamArg',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOB(2, _omitFieldNames ? '' : 'done')
    ..aOM<ProtoError>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..aOM<ProtoUpdateStateChanges>(
        4, _omitFieldNames ? '' : 'updateStateChanges',
        protoName: 'updateStateChanges',
        subBuilder: ProtoUpdateStateChanges.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateStateChangesStreamArg clone() =>
      ProtoUpdateStateChangesStreamArg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateStateChangesStreamArg copyWith(
          void Function(ProtoUpdateStateChangesStreamArg) updates) =>
      super.copyWith(
              (message) => updates(message as ProtoUpdateStateChangesStreamArg))
          as ProtoUpdateStateChangesStreamArg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoUpdateStateChangesStreamArg create() =>
      ProtoUpdateStateChangesStreamArg._();
  @$core.override
  ProtoUpdateStateChangesStreamArg createEmptyInstance() => create();
  static $pb.PbList<ProtoUpdateStateChangesStreamArg> createRepeated() =>
      $pb.PbList<ProtoUpdateStateChangesStreamArg>();
  @$core.pragma('dart2js:noInline')
  static ProtoUpdateStateChangesStreamArg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoUpdateStateChangesStreamArg>(
          create);
  static ProtoUpdateStateChangesStreamArg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get done => $_getBF(1);
  @$pb.TagNumber(2)
  set done($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDone() => $_has(1);
  @$pb.TagNumber(2)
  void clearDone() => $_clearField(2);

  @$pb.TagNumber(3)
  ProtoError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoError ensureError() => $_ensure(2);

  @$pb.TagNumber(4)
  ProtoUpdateStateChanges get updateStateChanges => $_getN(3);
  @$pb.TagNumber(4)
  set updateStateChanges(ProtoUpdateStateChanges value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdateStateChanges() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateStateChanges() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoUpdateStateChanges ensureUpdateStateChanges() => $_ensure(3);
}

class ProtoUpdateStateChanges extends $pb.GeneratedMessage {
  factory ProtoUpdateStateChanges({
    ProtoUpdateStateChanges_FirmwareUpgradeState? oldState,
    ProtoUpdateStateChanges_FirmwareUpgradeState? newState,
    $core.bool? canceled,
  }) {
    final result = create();
    if (oldState != null) result.oldState = oldState;
    if (newState != null) result.newState = newState;
    if (canceled != null) result.canceled = canceled;
    return result;
  }

  ProtoUpdateStateChanges._();

  factory ProtoUpdateStateChanges.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoUpdateStateChanges.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoUpdateStateChanges',
      createEmptyInstance: create)
    ..e<ProtoUpdateStateChanges_FirmwareUpgradeState>(
        1, _omitFieldNames ? '' : 'oldState', $pb.PbFieldType.OE,
        protoName: 'oldState',
        defaultOrMaker: ProtoUpdateStateChanges_FirmwareUpgradeState.NONE,
        valueOf: ProtoUpdateStateChanges_FirmwareUpgradeState.valueOf,
        enumValues: ProtoUpdateStateChanges_FirmwareUpgradeState.values)
    ..e<ProtoUpdateStateChanges_FirmwareUpgradeState>(
        2, _omitFieldNames ? '' : 'newState', $pb.PbFieldType.OE,
        protoName: 'newState',
        defaultOrMaker: ProtoUpdateStateChanges_FirmwareUpgradeState.NONE,
        valueOf: ProtoUpdateStateChanges_FirmwareUpgradeState.valueOf,
        enumValues: ProtoUpdateStateChanges_FirmwareUpgradeState.values)
    ..aOB(3, _omitFieldNames ? '' : 'canceled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateStateChanges clone() =>
      ProtoUpdateStateChanges()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoUpdateStateChanges copyWith(
          void Function(ProtoUpdateStateChanges) updates) =>
      super.copyWith((message) => updates(message as ProtoUpdateStateChanges))
          as ProtoUpdateStateChanges;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoUpdateStateChanges create() => ProtoUpdateStateChanges._();
  @$core.override
  ProtoUpdateStateChanges createEmptyInstance() => create();
  static $pb.PbList<ProtoUpdateStateChanges> createRepeated() =>
      $pb.PbList<ProtoUpdateStateChanges>();
  @$core.pragma('dart2js:noInline')
  static ProtoUpdateStateChanges getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoUpdateStateChanges>(create);
  static ProtoUpdateStateChanges? _defaultInstance;

  @$pb.TagNumber(1)
  ProtoUpdateStateChanges_FirmwareUpgradeState get oldState => $_getN(0);
  @$pb.TagNumber(1)
  set oldState(ProtoUpdateStateChanges_FirmwareUpgradeState value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOldState() => $_has(0);
  @$pb.TagNumber(1)
  void clearOldState() => $_clearField(1);

  @$pb.TagNumber(2)
  ProtoUpdateStateChanges_FirmwareUpgradeState get newState => $_getN(1);
  @$pb.TagNumber(2)
  set newState(ProtoUpdateStateChanges_FirmwareUpgradeState value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNewState() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewState() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get canceled => $_getBF(2);
  @$pb.TagNumber(3)
  set canceled($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCanceled() => $_has(2);
  @$pb.TagNumber(3)
  void clearCanceled() => $_clearField(3);
}

class ProtoFirmwareUpgradeConfiguration extends $pb.GeneratedMessage {
  factory ProtoFirmwareUpgradeConfiguration({
    $fixnum.Int64? estimatedSwapTimeMs,
    $core.bool? eraseAppSettings,
    $fixnum.Int64? pipelineDepth,
    ProtoFirmwareUpgradeConfiguration_ImageUploadAlignment? byteAlignment,
    $fixnum.Int64? reassemblyBufferSize,
    ProtoFirmwareUpgradeConfiguration_FirmwareUpgradeMode? firmwareUpgradeMode,
  }) {
    final result = create();
    if (estimatedSwapTimeMs != null)
      result.estimatedSwapTimeMs = estimatedSwapTimeMs;
    if (eraseAppSettings != null) result.eraseAppSettings = eraseAppSettings;
    if (pipelineDepth != null) result.pipelineDepth = pipelineDepth;
    if (byteAlignment != null) result.byteAlignment = byteAlignment;
    if (reassemblyBufferSize != null)
      result.reassemblyBufferSize = reassemblyBufferSize;
    if (firmwareUpgradeMode != null)
      result.firmwareUpgradeMode = firmwareUpgradeMode;
    return result;
  }

  ProtoFirmwareUpgradeConfiguration._();

  factory ProtoFirmwareUpgradeConfiguration.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFirmwareUpgradeConfiguration.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFirmwareUpgradeConfiguration',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'estimatedSwapTimeMs',
        protoName: 'estimatedSwapTimeMs')
    ..aOB(2, _omitFieldNames ? '' : 'eraseAppSettings',
        protoName: 'eraseAppSettings')
    ..aInt64(3, _omitFieldNames ? '' : 'pipelineDepth',
        protoName: 'pipelineDepth')
    ..e<ProtoFirmwareUpgradeConfiguration_ImageUploadAlignment>(
        4, _omitFieldNames ? '' : 'byteAlignment', $pb.PbFieldType.OE,
        protoName: 'byteAlignment',
        defaultOrMaker:
            ProtoFirmwareUpgradeConfiguration_ImageUploadAlignment.DISABLED,
        valueOf: ProtoFirmwareUpgradeConfiguration_ImageUploadAlignment.valueOf,
        enumValues:
            ProtoFirmwareUpgradeConfiguration_ImageUploadAlignment.values)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'reassemblyBufferSize', $pb.PbFieldType.OU6,
        protoName: 'reassemblyBufferSize', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<ProtoFirmwareUpgradeConfiguration_FirmwareUpgradeMode>(
        6, _omitFieldNames ? '' : 'firmwareUpgradeMode', $pb.PbFieldType.OE,
        protoName: 'firmwareUpgradeMode',
        defaultOrMaker:
            ProtoFirmwareUpgradeConfiguration_FirmwareUpgradeMode.TEST_ONLY,
        valueOf: ProtoFirmwareUpgradeConfiguration_FirmwareUpgradeMode.valueOf,
        enumValues:
            ProtoFirmwareUpgradeConfiguration_FirmwareUpgradeMode.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFirmwareUpgradeConfiguration clone() =>
      ProtoFirmwareUpgradeConfiguration()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFirmwareUpgradeConfiguration copyWith(
          void Function(ProtoFirmwareUpgradeConfiguration) updates) =>
      super.copyWith((message) =>
              updates(message as ProtoFirmwareUpgradeConfiguration))
          as ProtoFirmwareUpgradeConfiguration;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFirmwareUpgradeConfiguration create() =>
      ProtoFirmwareUpgradeConfiguration._();
  @$core.override
  ProtoFirmwareUpgradeConfiguration createEmptyInstance() => create();
  static $pb.PbList<ProtoFirmwareUpgradeConfiguration> createRepeated() =>
      $pb.PbList<ProtoFirmwareUpgradeConfiguration>();
  @$core.pragma('dart2js:noInline')
  static ProtoFirmwareUpgradeConfiguration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFirmwareUpgradeConfiguration>(
          create);
  static ProtoFirmwareUpgradeConfiguration? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get estimatedSwapTimeMs => $_getI64(0);
  @$pb.TagNumber(1)
  set estimatedSwapTimeMs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEstimatedSwapTimeMs() => $_has(0);
  @$pb.TagNumber(1)
  void clearEstimatedSwapTimeMs() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get eraseAppSettings => $_getBF(1);
  @$pb.TagNumber(2)
  set eraseAppSettings($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEraseAppSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearEraseAppSettings() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pipelineDepth => $_getI64(2);
  @$pb.TagNumber(3)
  set pipelineDepth($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPipelineDepth() => $_has(2);
  @$pb.TagNumber(3)
  void clearPipelineDepth() => $_clearField(3);

  @$pb.TagNumber(4)
  ProtoFirmwareUpgradeConfiguration_ImageUploadAlignment get byteAlignment =>
      $_getN(3);
  @$pb.TagNumber(4)
  set byteAlignment(
          ProtoFirmwareUpgradeConfiguration_ImageUploadAlignment value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasByteAlignment() => $_has(3);
  @$pb.TagNumber(4)
  void clearByteAlignment() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get reassemblyBufferSize => $_getI64(4);
  @$pb.TagNumber(5)
  set reassemblyBufferSize($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReassemblyBufferSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearReassemblyBufferSize() => $_clearField(5);

  @$pb.TagNumber(6)
  ProtoFirmwareUpgradeConfiguration_FirmwareUpgradeMode
      get firmwareUpgradeMode => $_getN(5);
  @$pb.TagNumber(6)
  set firmwareUpgradeMode(
          ProtoFirmwareUpgradeConfiguration_FirmwareUpgradeMode value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFirmwareUpgradeMode() => $_has(5);
  @$pb.TagNumber(6)
  void clearFirmwareUpgradeMode() => $_clearField(6);
}

class ProtoProgressUpdateStreamArg extends $pb.GeneratedMessage {
  factory ProtoProgressUpdateStreamArg({
    $core.String? uuid,
    $core.bool? done,
    ProtoError? error,
    ProtoProgressUpdate? progressUpdate,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (done != null) result.done = done;
    if (error != null) result.error = error;
    if (progressUpdate != null) result.progressUpdate = progressUpdate;
    return result;
  }

  ProtoProgressUpdateStreamArg._();

  factory ProtoProgressUpdateStreamArg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoProgressUpdateStreamArg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoProgressUpdateStreamArg',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOB(2, _omitFieldNames ? '' : 'done')
    ..aOM<ProtoError>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..aOM<ProtoProgressUpdate>(4, _omitFieldNames ? '' : 'progressUpdate',
        protoName: 'progressUpdate', subBuilder: ProtoProgressUpdate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoProgressUpdateStreamArg clone() =>
      ProtoProgressUpdateStreamArg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoProgressUpdateStreamArg copyWith(
          void Function(ProtoProgressUpdateStreamArg) updates) =>
      super.copyWith(
              (message) => updates(message as ProtoProgressUpdateStreamArg))
          as ProtoProgressUpdateStreamArg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoProgressUpdateStreamArg create() =>
      ProtoProgressUpdateStreamArg._();
  @$core.override
  ProtoProgressUpdateStreamArg createEmptyInstance() => create();
  static $pb.PbList<ProtoProgressUpdateStreamArg> createRepeated() =>
      $pb.PbList<ProtoProgressUpdateStreamArg>();
  @$core.pragma('dart2js:noInline')
  static ProtoProgressUpdateStreamArg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoProgressUpdateStreamArg>(create);
  static ProtoProgressUpdateStreamArg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get done => $_getBF(1);
  @$pb.TagNumber(2)
  set done($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDone() => $_has(1);
  @$pb.TagNumber(2)
  void clearDone() => $_clearField(2);

  @$pb.TagNumber(3)
  ProtoError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoError ensureError() => $_ensure(2);

  @$pb.TagNumber(4)
  ProtoProgressUpdate get progressUpdate => $_getN(3);
  @$pb.TagNumber(4)
  set progressUpdate(ProtoProgressUpdate value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasProgressUpdate() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgressUpdate() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoProgressUpdate ensureProgressUpdate() => $_ensure(3);
}

class ProtoProgressUpdate extends $pb.GeneratedMessage {
  factory ProtoProgressUpdate({
    $fixnum.Int64? bytesSent,
    $fixnum.Int64? imageSize,
    $core.double? timestamp,
  }) {
    final result = create();
    if (bytesSent != null) result.bytesSent = bytesSent;
    if (imageSize != null) result.imageSize = imageSize;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  ProtoProgressUpdate._();

  factory ProtoProgressUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoProgressUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoProgressUpdate',
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'bytesSent', $pb.PbFieldType.OU6,
        protoName: 'bytesSent', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'imageSize', $pb.PbFieldType.OU6,
        protoName: 'imageSize', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'timestamp', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoProgressUpdate clone() => ProtoProgressUpdate()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoProgressUpdate copyWith(void Function(ProtoProgressUpdate) updates) =>
      super.copyWith((message) => updates(message as ProtoProgressUpdate))
          as ProtoProgressUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoProgressUpdate create() => ProtoProgressUpdate._();
  @$core.override
  ProtoProgressUpdate createEmptyInstance() => create();
  static $pb.PbList<ProtoProgressUpdate> createRepeated() =>
      $pb.PbList<ProtoProgressUpdate>();
  @$core.pragma('dart2js:noInline')
  static ProtoProgressUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoProgressUpdate>(create);
  static ProtoProgressUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bytesSent => $_getI64(0);
  @$pb.TagNumber(1)
  set bytesSent($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBytesSent() => $_has(0);
  @$pb.TagNumber(1)
  void clearBytesSent() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get imageSize => $_getI64(1);
  @$pb.TagNumber(2)
  set imageSize($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageSize() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get timestamp => $_getN(2);
  @$pb.TagNumber(3)
  set timestamp($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
}

/// LOGS
class ProtoLogMessageStreamArg extends $pb.GeneratedMessage {
  factory ProtoLogMessageStreamArg({
    $core.String? uuid,
    $core.bool? done,
    ProtoError? error,
    ProtoLogMessage? protoLogMessage,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (done != null) result.done = done;
    if (error != null) result.error = error;
    if (protoLogMessage != null) result.protoLogMessage = protoLogMessage;
    return result;
  }

  ProtoLogMessageStreamArg._();

  factory ProtoLogMessageStreamArg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoLogMessageStreamArg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoLogMessageStreamArg',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOB(2, _omitFieldNames ? '' : 'done')
    ..aOM<ProtoError>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..aOM<ProtoLogMessage>(4, _omitFieldNames ? '' : 'protoLogMessage',
        protoName: 'protoLogMessage', subBuilder: ProtoLogMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoLogMessageStreamArg clone() =>
      ProtoLogMessageStreamArg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoLogMessageStreamArg copyWith(
          void Function(ProtoLogMessageStreamArg) updates) =>
      super.copyWith((message) => updates(message as ProtoLogMessageStreamArg))
          as ProtoLogMessageStreamArg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoLogMessageStreamArg create() => ProtoLogMessageStreamArg._();
  @$core.override
  ProtoLogMessageStreamArg createEmptyInstance() => create();
  static $pb.PbList<ProtoLogMessageStreamArg> createRepeated() =>
      $pb.PbList<ProtoLogMessageStreamArg>();
  @$core.pragma('dart2js:noInline')
  static ProtoLogMessageStreamArg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoLogMessageStreamArg>(create);
  static ProtoLogMessageStreamArg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get done => $_getBF(1);
  @$pb.TagNumber(2)
  set done($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDone() => $_has(1);
  @$pb.TagNumber(2)
  void clearDone() => $_clearField(2);

  @$pb.TagNumber(3)
  ProtoError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoError ensureError() => $_ensure(2);

  @$pb.TagNumber(4)
  ProtoLogMessage get protoLogMessage => $_getN(3);
  @$pb.TagNumber(4)
  set protoLogMessage(ProtoLogMessage value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasProtoLogMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearProtoLogMessage() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoLogMessage ensureProtoLogMessage() => $_ensure(3);
}

class ProtoLogMessage extends $pb.GeneratedMessage {
  factory ProtoLogMessage({
    $core.String? message,
    ProtoLogMessage_LogCategory? logCategory,
    ProtoLogMessage_LogLevel? logLevel,
    $fixnum.Int64? logDateTime,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (logCategory != null) result.logCategory = logCategory;
    if (logLevel != null) result.logLevel = logLevel;
    if (logDateTime != null) result.logDateTime = logDateTime;
    return result;
  }

  ProtoLogMessage._();

  factory ProtoLogMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoLogMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoLogMessage',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..e<ProtoLogMessage_LogCategory>(
        2, _omitFieldNames ? '' : 'logCategory', $pb.PbFieldType.OE,
        protoName: 'logCategory',
        defaultOrMaker: ProtoLogMessage_LogCategory.TRANSPORT,
        valueOf: ProtoLogMessage_LogCategory.valueOf,
        enumValues: ProtoLogMessage_LogCategory.values)
    ..e<ProtoLogMessage_LogLevel>(
        3, _omitFieldNames ? '' : 'logLevel', $pb.PbFieldType.OE,
        protoName: 'logLevel',
        defaultOrMaker: ProtoLogMessage_LogLevel.DEBUG,
        valueOf: ProtoLogMessage_LogLevel.valueOf,
        enumValues: ProtoLogMessage_LogLevel.values)
    ..aInt64(4, _omitFieldNames ? '' : 'logDateTime', protoName: 'logDateTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoLogMessage clone() => ProtoLogMessage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoLogMessage copyWith(void Function(ProtoLogMessage) updates) =>
      super.copyWith((message) => updates(message as ProtoLogMessage))
          as ProtoLogMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoLogMessage create() => ProtoLogMessage._();
  @$core.override
  ProtoLogMessage createEmptyInstance() => create();
  static $pb.PbList<ProtoLogMessage> createRepeated() =>
      $pb.PbList<ProtoLogMessage>();
  @$core.pragma('dart2js:noInline')
  static ProtoLogMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoLogMessage>(create);
  static ProtoLogMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  @$pb.TagNumber(2)
  ProtoLogMessage_LogCategory get logCategory => $_getN(1);
  @$pb.TagNumber(2)
  set logCategory(ProtoLogMessage_LogCategory value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLogCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogCategory() => $_clearField(2);

  @$pb.TagNumber(3)
  ProtoLogMessage_LogLevel get logLevel => $_getN(2);
  @$pb.TagNumber(3)
  set logLevel(ProtoLogMessage_LogLevel value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLogLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get logDateTime => $_getI64(3);
  @$pb.TagNumber(4)
  set logDateTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogDateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogDateTime() => $_clearField(4);
}

class ProtoReadLogCallArguments extends $pb.GeneratedMessage {
  factory ProtoReadLogCallArguments({
    $core.String? uuid,
    $core.bool? clearLogs,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (clearLogs != null) result.clearLogs = clearLogs;
    return result;
  }

  ProtoReadLogCallArguments._();

  factory ProtoReadLogCallArguments.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoReadLogCallArguments.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoReadLogCallArguments',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOB(2, _omitFieldNames ? '' : 'clearLogs', protoName: 'clearLogs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoReadLogCallArguments clone() =>
      ProtoReadLogCallArguments()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoReadLogCallArguments copyWith(
          void Function(ProtoReadLogCallArguments) updates) =>
      super.copyWith((message) => updates(message as ProtoReadLogCallArguments))
          as ProtoReadLogCallArguments;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoReadLogCallArguments create() => ProtoReadLogCallArguments._();
  @$core.override
  ProtoReadLogCallArguments createEmptyInstance() => create();
  static $pb.PbList<ProtoReadLogCallArguments> createRepeated() =>
      $pb.PbList<ProtoReadLogCallArguments>();
  @$core.pragma('dart2js:noInline')
  static ProtoReadLogCallArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoReadLogCallArguments>(create);
  static ProtoReadLogCallArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get clearLogs => $_getBF(1);
  @$pb.TagNumber(2)
  set clearLogs($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClearLogs() => $_has(1);
  @$pb.TagNumber(2)
  void clearClearLogs() => $_clearField(2);
}

class ProtoReadMessagesResponse extends $pb.GeneratedMessage {
  factory ProtoReadMessagesResponse({
    $core.String? uuid,
    $core.Iterable<ProtoLogMessage>? protoLogMessage,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (protoLogMessage != null) result.protoLogMessage.addAll(protoLogMessage);
    return result;
  }

  ProtoReadMessagesResponse._();

  factory ProtoReadMessagesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoReadMessagesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoReadMessagesResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..pc<ProtoLogMessage>(
        2, _omitFieldNames ? '' : 'protoLogMessage', $pb.PbFieldType.PM,
        protoName: 'protoLogMessage', subBuilder: ProtoLogMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoReadMessagesResponse clone() =>
      ProtoReadMessagesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoReadMessagesResponse copyWith(
          void Function(ProtoReadMessagesResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoReadMessagesResponse))
          as ProtoReadMessagesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoReadMessagesResponse create() => ProtoReadMessagesResponse._();
  @$core.override
  ProtoReadMessagesResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoReadMessagesResponse> createRepeated() =>
      $pb.PbList<ProtoReadMessagesResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoReadMessagesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoReadMessagesResponse>(create);
  static ProtoReadMessagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ProtoLogMessage> get protoLogMessage => $_getList(1);
}

/// IMAGE MANAGER
class ProtoListImagesResponse extends $pb.GeneratedMessage {
  factory ProtoListImagesResponse({
    $core.String? uuid,
    $core.bool? existing,
    $core.Iterable<ProtoImageSlot>? images,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (existing != null) result.existing = existing;
    if (images != null) result.images.addAll(images);
    return result;
  }

  ProtoListImagesResponse._();

  factory ProtoListImagesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoListImagesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoListImagesResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOB(2, _omitFieldNames ? '' : 'existing')
    ..pc<ProtoImageSlot>(3, _omitFieldNames ? '' : 'images', $pb.PbFieldType.PM,
        subBuilder: ProtoImageSlot.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoListImagesResponse clone() =>
      ProtoListImagesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoListImagesResponse copyWith(
          void Function(ProtoListImagesResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoListImagesResponse))
          as ProtoListImagesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoListImagesResponse create() => ProtoListImagesResponse._();
  @$core.override
  ProtoListImagesResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoListImagesResponse> createRepeated() =>
      $pb.PbList<ProtoListImagesResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoListImagesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoListImagesResponse>(create);
  static ProtoListImagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get existing => $_getBF(1);
  @$pb.TagNumber(2)
  set existing($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExisting() => $_has(1);
  @$pb.TagNumber(2)
  void clearExisting() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<ProtoImageSlot> get images => $_getList(2);
}

class ProtoImageSlot extends $pb.GeneratedMessage {
  factory ProtoImageSlot({
    $fixnum.Int64? image,
    $fixnum.Int64? slot,
    $core.String? version,
    $core.List<$core.int>? hash,
    $core.bool? bootable,
    $core.bool? pending,
    $core.bool? confirmed,
    $core.bool? active,
    $core.bool? permanent,
  }) {
    final result = create();
    if (image != null) result.image = image;
    if (slot != null) result.slot = slot;
    if (version != null) result.version = version;
    if (hash != null) result.hash = hash;
    if (bootable != null) result.bootable = bootable;
    if (pending != null) result.pending = pending;
    if (confirmed != null) result.confirmed = confirmed;
    if (active != null) result.active = active;
    if (permanent != null) result.permanent = permanent;
    return result;
  }

  ProtoImageSlot._();

  factory ProtoImageSlot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoImageSlot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoImageSlot',
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aOB(5, _omitFieldNames ? '' : 'bootable')
    ..aOB(6, _omitFieldNames ? '' : 'pending')
    ..aOB(7, _omitFieldNames ? '' : 'confirmed')
    ..aOB(8, _omitFieldNames ? '' : 'active')
    ..aOB(9, _omitFieldNames ? '' : 'permanent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoImageSlot clone() => ProtoImageSlot()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoImageSlot copyWith(void Function(ProtoImageSlot) updates) =>
      super.copyWith((message) => updates(message as ProtoImageSlot))
          as ProtoImageSlot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoImageSlot create() => ProtoImageSlot._();
  @$core.override
  ProtoImageSlot createEmptyInstance() => create();
  static $pb.PbList<ProtoImageSlot> createRepeated() =>
      $pb.PbList<ProtoImageSlot>();
  @$core.pragma('dart2js:noInline')
  static ProtoImageSlot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoImageSlot>(create);
  static ProtoImageSlot? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get image => $_getI64(0);
  @$pb.TagNumber(1)
  set image($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get slot => $_getI64(1);
  @$pb.TagNumber(2)
  set slot($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlot() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get hash => $_getN(3);
  @$pb.TagNumber(4)
  set hash($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearHash() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get bootable => $_getBF(4);
  @$pb.TagNumber(5)
  set bootable($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBootable() => $_has(4);
  @$pb.TagNumber(5)
  void clearBootable() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get pending => $_getBF(5);
  @$pb.TagNumber(6)
  set pending($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPending() => $_has(5);
  @$pb.TagNumber(6)
  void clearPending() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get confirmed => $_getBF(6);
  @$pb.TagNumber(7)
  set confirmed($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasConfirmed() => $_has(6);
  @$pb.TagNumber(7)
  void clearConfirmed() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get active => $_getBF(7);
  @$pb.TagNumber(8)
  set active($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasActive() => $_has(7);
  @$pb.TagNumber(8)
  void clearActive() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get permanent => $_getBF(8);
  @$pb.TagNumber(9)
  set permanent($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPermanent() => $_has(8);
  @$pb.TagNumber(9)
  void clearPermanent() => $_clearField(9);
}

/// FILE SYSTEM (FS) MANAGER
class ProtoFsEntry extends $pb.GeneratedMessage {
  factory ProtoFsEntry({
    $core.String? name,
    $fixnum.Int64? size,
    $core.bool? dir,
    $core.int? mode,
    $fixnum.Int64? mtime,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (size != null) result.size = size;
    if (dir != null) result.dir = dir;
    if (mode != null) result.mode = mode;
    if (mtime != null) result.mtime = mtime;
    return result;
  }

  ProtoFsEntry._();

  factory ProtoFsEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsEntry',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(3, _omitFieldNames ? '' : 'dir')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'mode', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'mtime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsEntry clone() => ProtoFsEntry()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsEntry copyWith(void Function(ProtoFsEntry) updates) =>
      super.copyWith((message) => updates(message as ProtoFsEntry))
          as ProtoFsEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsEntry create() => ProtoFsEntry._();
  @$core.override
  ProtoFsEntry createEmptyInstance() => create();
  static $pb.PbList<ProtoFsEntry> createRepeated() =>
      $pb.PbList<ProtoFsEntry>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsEntry>(create);
  static ProtoFsEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get dir => $_getBF(2);
  @$pb.TagNumber(3)
  set dir($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDir() => $_has(2);
  @$pb.TagNumber(3)
  void clearDir() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get mode => $_getIZ(3);
  @$pb.TagNumber(4)
  set mode($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMode() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get mtime => $_getI64(4);
  @$pb.TagNumber(5)
  set mtime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMtime() => $_has(4);
  @$pb.TagNumber(5)
  void clearMtime() => $_clearField(5);
}

class ProtoFsListResponse extends $pb.GeneratedMessage {
  factory ProtoFsListResponse({
    $core.String? uuid,
    $core.Iterable<ProtoFsEntry>? files,
    $core.bool? success,
    ProtoError? error,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (files != null) result.files.addAll(files);
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  ProtoFsListResponse._();

  factory ProtoFsListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsListResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..pc<ProtoFsEntry>(2, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM,
        subBuilder: ProtoFsEntry.create)
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..aOM<ProtoError>(4, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsListResponse clone() => ProtoFsListResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsListResponse copyWith(void Function(ProtoFsListResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoFsListResponse))
          as ProtoFsListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsListResponse create() => ProtoFsListResponse._();
  @$core.override
  ProtoFsListResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoFsListResponse> createRepeated() =>
      $pb.PbList<ProtoFsListResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsListResponse>(create);
  static ProtoFsListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ProtoFsEntry> get files => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => $_clearField(3);

  @$pb.TagNumber(4)
  ProtoError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(ProtoError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoError ensureError() => $_ensure(3);
}

class ProtoFsStatRequest extends $pb.GeneratedMessage {
  factory ProtoFsStatRequest({
    $core.String? uuid,
    $core.String? path,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (path != null) result.path = path;
    return result;
  }

  ProtoFsStatRequest._();

  factory ProtoFsStatRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsStatRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsStatRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsStatRequest clone() => ProtoFsStatRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsStatRequest copyWith(void Function(ProtoFsStatRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoFsStatRequest))
          as ProtoFsStatRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsStatRequest create() => ProtoFsStatRequest._();
  @$core.override
  ProtoFsStatRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoFsStatRequest> createRepeated() =>
      $pb.PbList<ProtoFsStatRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsStatRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsStatRequest>(create);
  static ProtoFsStatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => $_clearField(2);
}

class ProtoFsStatResponse extends $pb.GeneratedMessage {
  factory ProtoFsStatResponse({
    $core.String? uuid,
    ProtoFsEntry? stats,
    $core.bool? success,
    ProtoError? error,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (stats != null) result.stats = stats;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  ProtoFsStatResponse._();

  factory ProtoFsStatResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsStatResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsStatResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOM<ProtoFsEntry>(2, _omitFieldNames ? '' : 'stats',
        subBuilder: ProtoFsEntry.create)
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..aOM<ProtoError>(4, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsStatResponse clone() => ProtoFsStatResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsStatResponse copyWith(void Function(ProtoFsStatResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoFsStatResponse))
          as ProtoFsStatResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsStatResponse create() => ProtoFsStatResponse._();
  @$core.override
  ProtoFsStatResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoFsStatResponse> createRepeated() =>
      $pb.PbList<ProtoFsStatResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsStatResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsStatResponse>(create);
  static ProtoFsStatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  ProtoFsEntry get stats => $_getN(1);
  @$pb.TagNumber(2)
  set stats(ProtoFsEntry value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStats() => $_has(1);
  @$pb.TagNumber(2)
  void clearStats() => $_clearField(2);
  @$pb.TagNumber(2)
  ProtoFsEntry ensureStats() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => $_clearField(3);

  @$pb.TagNumber(4)
  ProtoError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(ProtoError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoError ensureError() => $_ensure(3);
}

class ProtoFsRemoveRequest extends $pb.GeneratedMessage {
  factory ProtoFsRemoveRequest({
    $core.String? uuid,
    $core.String? path,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (path != null) result.path = path;
    return result;
  }

  ProtoFsRemoveRequest._();

  factory ProtoFsRemoveRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsRemoveRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsRemoveRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsRemoveRequest clone() =>
      ProtoFsRemoveRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsRemoveRequest copyWith(void Function(ProtoFsRemoveRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoFsRemoveRequest))
          as ProtoFsRemoveRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsRemoveRequest create() => ProtoFsRemoveRequest._();
  @$core.override
  ProtoFsRemoveRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoFsRemoveRequest> createRepeated() =>
      $pb.PbList<ProtoFsRemoveRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsRemoveRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsRemoveRequest>(create);
  static ProtoFsRemoveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => $_clearField(2);
}

class ProtoFsRemoveResponse extends $pb.GeneratedMessage {
  factory ProtoFsRemoveResponse({
    $core.String? uuid,
    $core.bool? success,
    ProtoError? error,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  ProtoFsRemoveResponse._();

  factory ProtoFsRemoveResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsRemoveResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsRemoveResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aOM<ProtoError>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsRemoveResponse clone() =>
      ProtoFsRemoveResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsRemoveResponse copyWith(
          void Function(ProtoFsRemoveResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoFsRemoveResponse))
          as ProtoFsRemoveResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsRemoveResponse create() => ProtoFsRemoveResponse._();
  @$core.override
  ProtoFsRemoveResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoFsRemoveResponse> createRepeated() =>
      $pb.PbList<ProtoFsRemoveResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsRemoveResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsRemoveResponse>(create);
  static ProtoFsRemoveResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => $_clearField(2);

  @$pb.TagNumber(3)
  ProtoError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoError ensureError() => $_ensure(2);
}

class ProtoFsOpenRequest extends $pb.GeneratedMessage {
  factory ProtoFsOpenRequest({
    $core.String? uuid,
    $core.String? path,
    $core.int? flags,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (path != null) result.path = path;
    if (flags != null) result.flags = flags;
    return result;
  }

  ProtoFsOpenRequest._();

  factory ProtoFsOpenRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsOpenRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsOpenRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'flags', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsOpenRequest clone() => ProtoFsOpenRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsOpenRequest copyWith(void Function(ProtoFsOpenRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoFsOpenRequest))
          as ProtoFsOpenRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsOpenRequest create() => ProtoFsOpenRequest._();
  @$core.override
  ProtoFsOpenRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoFsOpenRequest> createRepeated() =>
      $pb.PbList<ProtoFsOpenRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsOpenRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsOpenRequest>(create);
  static ProtoFsOpenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get flags => $_getIZ(2);
  @$pb.TagNumber(3)
  set flags($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFlags() => $_has(2);
  @$pb.TagNumber(3)
  void clearFlags() => $_clearField(3);
}

class ProtoFsOpenResponse extends $pb.GeneratedMessage {
  factory ProtoFsOpenResponse({
    $core.String? uuid,
    $core.int? fd,
    $core.bool? success,
    ProtoError? error,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (fd != null) result.fd = fd;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  ProtoFsOpenResponse._();

  factory ProtoFsOpenResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsOpenResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsOpenResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fd', $pb.PbFieldType.O3)
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..aOM<ProtoError>(4, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsOpenResponse clone() => ProtoFsOpenResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsOpenResponse copyWith(void Function(ProtoFsOpenResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoFsOpenResponse))
          as ProtoFsOpenResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsOpenResponse create() => ProtoFsOpenResponse._();
  @$core.override
  ProtoFsOpenResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoFsOpenResponse> createRepeated() =>
      $pb.PbList<ProtoFsOpenResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsOpenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsOpenResponse>(create);
  static ProtoFsOpenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fd => $_getIZ(1);
  @$pb.TagNumber(2)
  set fd($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFd() => $_has(1);
  @$pb.TagNumber(2)
  void clearFd() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => $_clearField(3);

  @$pb.TagNumber(4)
  ProtoError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(ProtoError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoError ensureError() => $_ensure(3);
}

class ProtoFsReadRequest extends $pb.GeneratedMessage {
  factory ProtoFsReadRequest({
    $core.String? uuid,
    $core.int? fd,
    $fixnum.Int64? offset,
    $fixnum.Int64? length,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (fd != null) result.fd = fd;
    if (offset != null) result.offset = offset;
    if (length != null) result.length = length;
    return result;
  }

  ProtoFsReadRequest._();

  factory ProtoFsReadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsReadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsReadRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fd', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'length', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsReadRequest clone() => ProtoFsReadRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsReadRequest copyWith(void Function(ProtoFsReadRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoFsReadRequest))
          as ProtoFsReadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsReadRequest create() => ProtoFsReadRequest._();
  @$core.override
  ProtoFsReadRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoFsReadRequest> createRepeated() =>
      $pb.PbList<ProtoFsReadRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsReadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsReadRequest>(create);
  static ProtoFsReadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fd => $_getIZ(1);
  @$pb.TagNumber(2)
  set fd($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFd() => $_has(1);
  @$pb.TagNumber(2)
  void clearFd() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get offset => $_getI64(2);
  @$pb.TagNumber(3)
  set offset($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get length => $_getI64(3);
  @$pb.TagNumber(4)
  set length($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLength() => $_has(3);
  @$pb.TagNumber(4)
  void clearLength() => $_clearField(4);
}

class ProtoFsReadResponse extends $pb.GeneratedMessage {
  factory ProtoFsReadResponse({
    $core.String? uuid,
    $core.List<$core.int>? data,
    $core.bool? done,
    $core.bool? success,
    ProtoError? error,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (data != null) result.data = data;
    if (done != null) result.done = done;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  ProtoFsReadResponse._();

  factory ProtoFsReadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsReadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsReadResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOB(3, _omitFieldNames ? '' : 'done')
    ..aOB(4, _omitFieldNames ? '' : 'success')
    ..aOM<ProtoError>(5, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsReadResponse clone() => ProtoFsReadResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsReadResponse copyWith(void Function(ProtoFsReadResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoFsReadResponse))
          as ProtoFsReadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsReadResponse create() => ProtoFsReadResponse._();
  @$core.override
  ProtoFsReadResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoFsReadResponse> createRepeated() =>
      $pb.PbList<ProtoFsReadResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsReadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsReadResponse>(create);
  static ProtoFsReadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get done => $_getBF(2);
  @$pb.TagNumber(3)
  set done($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDone() => $_has(2);
  @$pb.TagNumber(3)
  void clearDone() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get success => $_getBF(3);
  @$pb.TagNumber(4)
  set success($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSuccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuccess() => $_clearField(4);

  @$pb.TagNumber(5)
  ProtoError get error => $_getN(4);
  @$pb.TagNumber(5)
  set error(ProtoError value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);
  @$pb.TagNumber(5)
  ProtoError ensureError() => $_ensure(4);
}

class ProtoFsCloseRequest extends $pb.GeneratedMessage {
  factory ProtoFsCloseRequest({
    $core.String? uuid,
    $core.int? fd,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (fd != null) result.fd = fd;
    return result;
  }

  ProtoFsCloseRequest._();

  factory ProtoFsCloseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsCloseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsCloseRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fd', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsCloseRequest clone() => ProtoFsCloseRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsCloseRequest copyWith(void Function(ProtoFsCloseRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoFsCloseRequest))
          as ProtoFsCloseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsCloseRequest create() => ProtoFsCloseRequest._();
  @$core.override
  ProtoFsCloseRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoFsCloseRequest> createRepeated() =>
      $pb.PbList<ProtoFsCloseRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsCloseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsCloseRequest>(create);
  static ProtoFsCloseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fd => $_getIZ(1);
  @$pb.TagNumber(2)
  set fd($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFd() => $_has(1);
  @$pb.TagNumber(2)
  void clearFd() => $_clearField(2);
}

class ProtoFsCloseResponse extends $pb.GeneratedMessage {
  factory ProtoFsCloseResponse({
    $core.String? uuid,
    $core.bool? success,
    ProtoError? error,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  ProtoFsCloseResponse._();

  factory ProtoFsCloseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsCloseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsCloseResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aOM<ProtoError>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsCloseResponse clone() =>
      ProtoFsCloseResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsCloseResponse copyWith(void Function(ProtoFsCloseResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoFsCloseResponse))
          as ProtoFsCloseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsCloseResponse create() => ProtoFsCloseResponse._();
  @$core.override
  ProtoFsCloseResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoFsCloseResponse> createRepeated() =>
      $pb.PbList<ProtoFsCloseResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsCloseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsCloseResponse>(create);
  static ProtoFsCloseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => $_clearField(2);

  @$pb.TagNumber(3)
  ProtoError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoError ensureError() => $_ensure(2);
}

class ProtoFsWriteRequest extends $pb.GeneratedMessage {
  factory ProtoFsWriteRequest({
    $core.String? uuid,
    $core.int? fd,
    $core.List<$core.int>? data,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (fd != null) result.fd = fd;
    if (data != null) result.data = data;
    if (offset != null) result.offset = offset;
    return result;
  }

  ProtoFsWriteRequest._();

  factory ProtoFsWriteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsWriteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsWriteRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fd', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsWriteRequest clone() => ProtoFsWriteRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsWriteRequest copyWith(void Function(ProtoFsWriteRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoFsWriteRequest))
          as ProtoFsWriteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsWriteRequest create() => ProtoFsWriteRequest._();
  @$core.override
  ProtoFsWriteRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoFsWriteRequest> createRepeated() =>
      $pb.PbList<ProtoFsWriteRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsWriteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsWriteRequest>(create);
  static ProtoFsWriteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fd => $_getIZ(1);
  @$pb.TagNumber(2)
  set fd($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFd() => $_has(1);
  @$pb.TagNumber(2)
  void clearFd() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get offset => $_getI64(3);
  @$pb.TagNumber(4)
  set offset($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOffset() => $_has(3);
  @$pb.TagNumber(4)
  void clearOffset() => $_clearField(4);
}

class ProtoFsWriteResponse extends $pb.GeneratedMessage {
  factory ProtoFsWriteResponse({
    $core.String? uuid,
    $fixnum.Int64? written,
    $core.bool? success,
    ProtoError? error,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (written != null) result.written = written;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  ProtoFsWriteResponse._();

  factory ProtoFsWriteResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoFsWriteResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoFsWriteResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'written', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..aOM<ProtoError>(4, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsWriteResponse clone() =>
      ProtoFsWriteResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoFsWriteResponse copyWith(void Function(ProtoFsWriteResponse) updates) =>
      super.copyWith((message) => updates(message as ProtoFsWriteResponse))
          as ProtoFsWriteResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoFsWriteResponse create() => ProtoFsWriteResponse._();
  @$core.override
  ProtoFsWriteResponse createEmptyInstance() => create();
  static $pb.PbList<ProtoFsWriteResponse> createRepeated() =>
      $pb.PbList<ProtoFsWriteResponse>();
  @$core.pragma('dart2js:noInline')
  static ProtoFsWriteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoFsWriteResponse>(create);
  static ProtoFsWriteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get written => $_getI64(1);
  @$pb.TagNumber(2)
  set written($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWritten() => $_has(1);
  @$pb.TagNumber(2)
  void clearWritten() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => $_clearField(3);

  @$pb.TagNumber(4)
  ProtoError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(ProtoError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoError ensureError() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
