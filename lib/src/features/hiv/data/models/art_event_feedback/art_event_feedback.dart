

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nishauri/src/features/hiv/data/models/models.dart';
part 'art_event_feedback.freezed.dart';
part 'art_event_feedback.g.dart';

@Freezed()
class ARTEventFeedback with _$ARTEventFeedback {
  const factory ARTEventFeedback({
    String? id,
    required String eventId,
    @Default(false) bool confirmedAttendance,
    @Default(false) bool requestedHomeDelivery,
    String? note,
    required String createdAt,
    required String updatedAt,
  }) = _ARTEventFeedback;

  factory ARTEventFeedback.fromJson(Map<String, dynamic> json)=> _$ARTEventFeedbackFromJson(json);
}