// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'art_event_feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ARTEventFeedback _$ARTEventFeedbackFromJson(Map<String, dynamic> json) {
  return _ARTEventFeedback.fromJson(json);
}

/// @nodoc
mixin _$ARTEventFeedback {
  String? get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  bool get confirmedAttendance => throw _privateConstructorUsedError;
  bool get requestedHomeDelivery => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ARTEventFeedbackCopyWith<ARTEventFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ARTEventFeedbackCopyWith<$Res> {
  factory $ARTEventFeedbackCopyWith(
          ARTEventFeedback value, $Res Function(ARTEventFeedback) then) =
      _$ARTEventFeedbackCopyWithImpl<$Res, ARTEventFeedback>;
  @useResult
  $Res call(
      {String? id,
      String eventId,
      bool confirmedAttendance,
      bool requestedHomeDelivery,
      String? note,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$ARTEventFeedbackCopyWithImpl<$Res, $Val extends ARTEventFeedback>
    implements $ARTEventFeedbackCopyWith<$Res> {
  _$ARTEventFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eventId = null,
    Object? confirmedAttendance = null,
    Object? requestedHomeDelivery = null,
    Object? note = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedAttendance: null == confirmedAttendance
          ? _value.confirmedAttendance
          : confirmedAttendance // ignore: cast_nullable_to_non_nullable
              as bool,
      requestedHomeDelivery: null == requestedHomeDelivery
          ? _value.requestedHomeDelivery
          : requestedHomeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ARTEventFeedbackImplCopyWith<$Res>
    implements $ARTEventFeedbackCopyWith<$Res> {
  factory _$$ARTEventFeedbackImplCopyWith(_$ARTEventFeedbackImpl value,
          $Res Function(_$ARTEventFeedbackImpl) then) =
      __$$ARTEventFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String eventId,
      bool confirmedAttendance,
      bool requestedHomeDelivery,
      String? note,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$ARTEventFeedbackImplCopyWithImpl<$Res>
    extends _$ARTEventFeedbackCopyWithImpl<$Res, _$ARTEventFeedbackImpl>
    implements _$$ARTEventFeedbackImplCopyWith<$Res> {
  __$$ARTEventFeedbackImplCopyWithImpl(_$ARTEventFeedbackImpl _value,
      $Res Function(_$ARTEventFeedbackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eventId = null,
    Object? confirmedAttendance = null,
    Object? requestedHomeDelivery = null,
    Object? note = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ARTEventFeedbackImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedAttendance: null == confirmedAttendance
          ? _value.confirmedAttendance
          : confirmedAttendance // ignore: cast_nullable_to_non_nullable
              as bool,
      requestedHomeDelivery: null == requestedHomeDelivery
          ? _value.requestedHomeDelivery
          : requestedHomeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ARTEventFeedbackImpl
    with DiagnosticableTreeMixin
    implements _ARTEventFeedback {
  const _$ARTEventFeedbackImpl(
      {this.id,
      required this.eventId,
      this.confirmedAttendance = false,
      this.requestedHomeDelivery = false,
      this.note,
      required this.createdAt,
      required this.updatedAt});

  factory _$ARTEventFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$ARTEventFeedbackImplFromJson(json);

  @override
  final String? id;
  @override
  final String eventId;
  @override
  @JsonKey()
  final bool confirmedAttendance;
  @override
  @JsonKey()
  final bool requestedHomeDelivery;
  @override
  final String? note;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ARTEventFeedback(id: $id, eventId: $eventId, confirmedAttendance: $confirmedAttendance, requestedHomeDelivery: $requestedHomeDelivery, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ARTEventFeedback'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('eventId', eventId))
      ..add(DiagnosticsProperty('confirmedAttendance', confirmedAttendance))
      ..add(DiagnosticsProperty('requestedHomeDelivery', requestedHomeDelivery))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ARTEventFeedbackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.confirmedAttendance, confirmedAttendance) ||
                other.confirmedAttendance == confirmedAttendance) &&
            (identical(other.requestedHomeDelivery, requestedHomeDelivery) ||
                other.requestedHomeDelivery == requestedHomeDelivery) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, eventId, confirmedAttendance,
      requestedHomeDelivery, note, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ARTEventFeedbackImplCopyWith<_$ARTEventFeedbackImpl> get copyWith =>
      __$$ARTEventFeedbackImplCopyWithImpl<_$ARTEventFeedbackImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ARTEventFeedbackImplToJson(
      this,
    );
  }
}

abstract class _ARTEventFeedback implements ARTEventFeedback {
  const factory _ARTEventFeedback(
      {final String? id,
      required final String eventId,
      final bool confirmedAttendance,
      final bool requestedHomeDelivery,
      final String? note,
      required final String createdAt,
      required final String updatedAt}) = _$ARTEventFeedbackImpl;

  factory _ARTEventFeedback.fromJson(Map<String, dynamic> json) =
      _$ARTEventFeedbackImpl.fromJson;

  @override
  String? get id;
  @override
  String get eventId;
  @override
  bool get confirmedAttendance;
  @override
  bool get requestedHomeDelivery;
  @override
  String? get note;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ARTEventFeedbackImplCopyWith<_$ARTEventFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
