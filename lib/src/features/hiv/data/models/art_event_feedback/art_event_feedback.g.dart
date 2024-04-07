// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_event_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ARTEventFeedbackImpl _$$ARTEventFeedbackImplFromJson(
        Map<String, dynamic> json) =>
    _$ARTEventFeedbackImpl(
      id: json['id'] as String?,
      eventId: json['eventId'] as String,
      confirmedAttendance: json['confirmedAttendance'] as bool? ?? false,
      requestedHomeDelivery: json['requestedHomeDelivery'] as bool? ?? false,
      note: json['note'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$ARTEventFeedbackImplToJson(
        _$ARTEventFeedbackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'confirmedAttendance': instance.confirmedAttendance,
      'requestedHomeDelivery': instance.requestedHomeDelivery,
      'note': instance.note,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
