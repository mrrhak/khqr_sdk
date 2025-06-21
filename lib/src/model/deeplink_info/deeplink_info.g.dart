// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deeplink_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeeplinkInfo _$DeeplinkInfoFromJson(Map<String, dynamic> json) =>
    _DeeplinkInfo(
      qr: json['qr'] as String,
      url: json['url'] as String,
      sourceInfo:
          json['sourceInfo'] == null
              ? null
              : SourceInfo.fromJson(json['sourceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeeplinkInfoToJson(_DeeplinkInfo instance) =>
    <String, dynamic>{
      'qr': instance.qr,
      'url': instance.url,
      'sourceInfo': instance.sourceInfo,
    };
