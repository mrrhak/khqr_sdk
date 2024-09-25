// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deeplink_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeeplinkInfoImpl _$$DeeplinkInfoImplFromJson(Map<String, dynamic> json) =>
    _$DeeplinkInfoImpl(
      qr: json['qr'] as String,
      url: json['url'] as String,
      sourceInfo: json['sourceInfo'] == null
          ? null
          : SourceInfo.fromJson(json['sourceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeeplinkInfoImplToJson(_$DeeplinkInfoImpl instance) =>
    <String, dynamic>{
      'qr': instance.qr,
      'url': instance.url,
      'sourceInfo': instance.sourceInfo,
    };
