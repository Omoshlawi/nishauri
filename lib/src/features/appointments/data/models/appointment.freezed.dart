// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  String? get id => throw _privateConstructorUsedError;
  String? get ccc_no => throw _privateConstructorUsedError;
  String? get program_name => throw _privateConstructorUsedError;
  String? get appointment_type => throw _privateConstructorUsedError;
  String get appointment_date => throw _privateConstructorUsedError;
  String? get appointment => throw _privateConstructorUsedError;
  String? get nextAppointmentDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call(
      {String? id,
      String? ccc_no,
      String? program_name,
      String? appointment_type,
      String appointment_date,
      String? appointment,
      String? nextAppointmentDate});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ccc_no = freezed,
    Object? program_name = freezed,
    Object? appointment_type = freezed,
    Object? appointment_date = null,
    Object? appointment = freezed,
    Object? nextAppointmentDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ccc_no: freezed == ccc_no
          ? _value.ccc_no
          : ccc_no // ignore: cast_nullable_to_non_nullable
              as String?,
      program_name: freezed == program_name
          ? _value.program_name
          : program_name // ignore: cast_nullable_to_non_nullable
              as String?,
      appointment_type: freezed == appointment_type
          ? _value.appointment_type
          : appointment_type // ignore: cast_nullable_to_non_nullable
              as String?,
      appointment_date: null == appointment_date
          ? _value.appointment_date
          : appointment_date // ignore: cast_nullable_to_non_nullable
              as String,
      appointment: freezed == appointment
          ? _value.appointment
          : appointment // ignore: cast_nullable_to_non_nullable
              as String?,
      nextAppointmentDate: freezed == nextAppointmentDate
          ? _value.nextAppointmentDate
          : nextAppointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentImplCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$AppointmentImplCopyWith(
          _$AppointmentImpl value, $Res Function(_$AppointmentImpl) then) =
      __$$AppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? ccc_no,
      String? program_name,
      String? appointment_type,
      String appointment_date,
      String? appointment,
      String? nextAppointmentDate});
}

/// @nodoc
class __$$AppointmentImplCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$AppointmentImpl>
    implements _$$AppointmentImplCopyWith<$Res> {
  __$$AppointmentImplCopyWithImpl(
      _$AppointmentImpl _value, $Res Function(_$AppointmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ccc_no = freezed,
    Object? program_name = freezed,
    Object? appointment_type = freezed,
    Object? appointment_date = null,
    Object? appointment = freezed,
    Object? nextAppointmentDate = freezed,
  }) {
    return _then(_$AppointmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ccc_no: freezed == ccc_no
          ? _value.ccc_no
          : ccc_no // ignore: cast_nullable_to_non_nullable
              as String?,
      program_name: freezed == program_name
          ? _value.program_name
          : program_name // ignore: cast_nullable_to_non_nullable
              as String?,
      appointment_type: freezed == appointment_type
          ? _value.appointment_type
          : appointment_type // ignore: cast_nullable_to_non_nullable
              as String?,
      appointment_date: null == appointment_date
          ? _value.appointment_date
          : appointment_date // ignore: cast_nullable_to_non_nullable
              as String,
      appointment: freezed == appointment
          ? _value.appointment
          : appointment // ignore: cast_nullable_to_non_nullable
              as String?,
      nextAppointmentDate: freezed == nextAppointmentDate
          ? _value.nextAppointmentDate
          : nextAppointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentImpl implements _Appointment {
  const _$AppointmentImpl(
      {this.id,
      this.ccc_no,
      this.program_name,
      this.appointment_type,
      required this.appointment_date,
      this.appointment,
      this.nextAppointmentDate});

  factory _$AppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentImplFromJson(json);

  @override
  final String? id;
  @override
  final String? ccc_no;
  @override
  final String? program_name;
  @override
  final String? appointment_type;
  @override
  final String appointment_date;
  @override
  final String? appointment;
  @override
  final String? nextAppointmentDate;

  @override
  String toString() {
    return 'Appointment(id: $id, ccc_no: $ccc_no, program_name: $program_name, appointment_type: $appointment_type, appointment_date: $appointment_date, appointment: $appointment, nextAppointmentDate: $nextAppointmentDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ccc_no, ccc_no) || other.ccc_no == ccc_no) &&
            (identical(other.program_name, program_name) ||
                other.program_name == program_name) &&
            (identical(other.appointment_type, appointment_type) ||
                other.appointment_type == appointment_type) &&
            (identical(other.appointment_date, appointment_date) ||
                other.appointment_date == appointment_date) &&
            (identical(other.appointment, appointment) ||
                other.appointment == appointment) &&
            (identical(other.nextAppointmentDate, nextAppointmentDate) ||
                other.nextAppointmentDate == nextAppointmentDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ccc_no, program_name,
      appointment_type, appointment_date, appointment, nextAppointmentDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      __$$AppointmentImplCopyWithImpl<_$AppointmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentImplToJson(
      this,
    );
  }
}

abstract class _Appointment implements Appointment {
  const factory _Appointment(
      {final String? id,
      final String? ccc_no,
      final String? program_name,
      final String? appointment_type,
      required final String appointment_date,
      final String? appointment,
      final String? nextAppointmentDate}) = _$AppointmentImpl;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$AppointmentImpl.fromJson;

  @override
  String? get id;
  @override
  String? get ccc_no;
  @override
  String? get program_name;
  @override
  String? get appointment_type;
  @override
  String get appointment_date;
  @override
  String? get appointment;
  @override
  String? get nextAppointmentDate;
  @override
  @JsonKey(ignore: true)
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}