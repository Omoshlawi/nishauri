import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nishauri/src/features/user_programs/data/models/program_verificaton_contact.dart';

part 'program_verification_detail.freezed.dart';
part 'program_verification_detail.g.dart';

@Freezed()
class ProgramVerificationDetail with _$ProgramVerificationDetail {
  const factory ProgramVerificationDetail({
    String? programCode,
    String? message,
    @Default([]) List<ProgramVerificationContact> contacts,
  }) = _ProgramVerificationDetail;

  factory ProgramVerificationDetail.fromJson(Map<String, dynamic> json) =>
      _$ProgramVerificationDetailFromJson(json);
}
