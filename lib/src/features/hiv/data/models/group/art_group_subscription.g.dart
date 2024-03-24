// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_group_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ARTGroupSubscriptionImpl _$$ARTGroupSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$ARTGroupSubscriptionImpl(
      id: json['id'] as String?,
      group: json['group'] == null
          ? null
          : ARTGroup.fromJson(json['group'] as Map<String, dynamic>),
      user: ARTGroupMember.fromJson(json['user'] as Map<String, dynamic>),
      publicName: json['publicName'] as String?,
      createdAt: json['createdAt'] as String,
      isCurrent: json['isCurrent'] as bool? ?? false,
      hasConcented: json['hasConcented'] as bool? ?? false,
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$ARTGroupSubscriptionImplToJson(
        _$ARTGroupSubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'user': instance.user,
      'publicName': instance.publicName,
      'createdAt': instance.createdAt,
      'isCurrent': instance.isCurrent,
      'hasConcented': instance.hasConcented,
      'isAdmin': instance.isAdmin,
    };
