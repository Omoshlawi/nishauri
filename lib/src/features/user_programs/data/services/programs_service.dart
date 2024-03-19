import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:nishauri/src/features/auth/data/respositories/auth_repository.dart';
import 'package:nishauri/src/features/auth/data/services/AuthApiService.dart';
import 'package:nishauri/src/features/user_programs/data/models/program.dart';
import 'package:nishauri/src/features/user_programs/data/models/program_verification_detail.dart';
import 'package:nishauri/src/features/user_programs/data/models/program_verificaton_contact.dart';
import 'package:nishauri/src/features/user_programs/data/models/user_program.dart';
import 'package:nishauri/src/shared/interfaces/HTTPService.dart';
import 'package:http/http.dart' as http;
import 'package:nishauri/src/utils/constants.dart';

class ProgramService extends HTTPService {
  final AuthRepository _repository = AuthRepository(AuthApiService());
  // final List<Program> _programs = [
  //   const Program(
  //     program_code: "HIV",
  //     name: "HIV Program",
  //     createdAt: "20th Oct 2023",
  //   ),
  //   const Program(
  //     program_code: "TB",
  //     name: "Tuberculosis Program",
  //     createdAt: "20th Oct 2023",
  //   ),
  //   const Program(
  //     program_code: "ASTHMA",
  //     name: "Asthma Program",
  //     createdAt: "20th Oct 2023",
  //   ),
  //   const Program(
  //     program_code: "DIABETES",
  //     name: "Diabetes Program",
  //     createdAt: "20th Oct 2023",
  //   ),
  //   const Program(
  //     program_code: "CANCER",
  //     name: "Cancer Program",
  //     createdAt: "20th Oct 2023",
  //   ),
  //   const Program(
  //     program_code: "HBP",
  //     name: "Hypertension",
  //     createdAt: "20th Oct 2023",
  //   ),
  // ];

  /*final List<UserProgram> _userPrograms = [
    // const UserProgram(
    //   program: Program(
    //     programCode: "HIV",
    //     name: "HIV Program",
    //     createdAt: "20th Oct 2023",
    //   ),
    //   user: "u-1",
    //   createdAt: "20th Oct 2023",
    // ),
    // const UserProgram(
    //   program: Program(
    //     programCode: "TB",
    //     name: "Tuberculosis Program",
    //     createdAt: "20th Oct 2023",
    //   ),
    //   user: "u-1",
    //   createdAt: "20th Oct 2023",
    // ),
    // const UserProgram(
    //   program: Program(
    //     programCode: "ASTHMA",
    //     name: "Asthma Program",
    //     createdAt: "20th Oct 2023",
    //   ),
    //   user: "u-1",
    //   createdAt: "20th Oct 2023",
    // ),
    // const UserProgram(
    //   program: Program(
    //     programCode: "DIABETES",
    //     name: "Diabetes Program",
    //     createdAt: "20th Oct 2023",
    //   ),
    //   user: "u-1",
    //   createdAt: "20th Oct 2023",
    // ),
    // const UserProgram(
    //   program: Program(
    //     programCode: "CANCER",
    //     name: "Cancer Program",
    //     createdAt: "20th Oct 2023",
    //   ),
    //   user: "u-1",
    //   createdAt: "20th Oct 2023",
    // ),
    // const UserProgram(
    //   program: Program(
    //     programCode: "HBP",
    //     name: "Hypertension",
    //     createdAt: "20th Oct 2023",
    //   ),
    //   user: "u-1",
    //   createdAt: "20th Oct 2023",
    // ),
  ];
*/
  // Future<List<Program>> getPrograms() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   return _programs;
  // }

  Future<List<UserProgram>> getUserPrograms() async {
    final response = await call(getUserPrograms_, null);
    final responseString = await response.stream.bytesToString();
    final Map<String, dynamic> programData = json.decode(responseString);
    final programs = (programData["programs"] as List<dynamic>)
        .map((e) => UserProgram.fromJson({
              ...e,
              "id": e["_id"],
              "program": Map<String, dynamic>.from(
                  {...e["program"][0], "id": e["program"][0]["_id"]})
            }))
        .toList();
    return programData["programs"];
  }

  Future<http.StreamedResponse> getUserPrograms_(dynamic args) async {
    final tokenPair = await getCachedToken();
    // var headers = {'x-access-token': tokenPair.accessToken};
    var request = http.Request('GET',
        Uri.parse('${Constants.BASE_URL_NEW}/get_program'));
    // request.headers.addAll(headers);
    return await request.send();
  }

  Future<ProgramVerificationDetail> registerProgram(
      Map<String, dynamic> data) async {
    http.StreamedResponse response =
        await call<Map<String, dynamic>>(registerProgram_, data);
    final responseString = await response.stream.bytesToString();
    final responseData = jsonDecode(responseString);
    if(responseData["success"] == true && responseData["msg"] == "Program Already Exist Succesfully. Please Login to access personalized data"){
      throw responseData["msg"];
    }
    return ProgramVerificationDetail.fromJson(responseData);
  }

  Future<http.StreamedResponse> registerProgram_(
      Map<String, dynamic> data) async {
    final tokenPair = await getCachedToken();
    final id = await _repository.getUserId();
    var user = {'user_id': id};
    var mergedData = {...data, ...user};
    var headers = {
      'Authorization': 'Bearer ${tokenPair.accessToken}',
      'Content-Type': 'application/json',
    };
    final data_ = Map.from(mergedData)..removeWhere((key, value) => key == "program");
    var request = http.Request(
        'POST', Uri.parse('${Constants.BASE_URL_NEW}/setprogram'));
    request.body = json.encode(data_);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<String> verifyProgramOTP(Map<String, dynamic> data) async {
    http.StreamedResponse response =
        await call<Map<String, dynamic>>(verifyProgramOTP_, data);
    final responseString = await response.stream.bytesToString();
    final responseData = jsonDecode(responseString);
    return responseData["detail"];
  }

  Future<http.StreamedResponse> verifyProgramOTP_(
      Map<String, dynamic> data) async {
    final tokenPair = await getCachedToken();
    var headers = {
      'x-access-token': tokenPair.accessToken,
      'Content-Type': 'application/json',
    };
    var request = http.Request(
      'POST',
      Uri.parse('${Constants.BASE_URL}/patients/programs/verify/'),
    );
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<String> requestVerificationCode(Map<String, dynamic> data) async {
    http.StreamedResponse response =
        await call<Map<String, dynamic>>(requestVerificationCode_, data);
    final responseString = await response.stream.bytesToString();
    final responseData = jsonDecode(responseString);
    return responseData["detail"];
  }

  Future<http.StreamedResponse> requestVerificationCode_(
      Map<String, dynamic> data) async {
    final tokenPair = await getCachedToken();
    var headers = {
      'x-access-token': tokenPair.accessToken,
      'Content-Type': 'application/json',
    };
    var request = http.Request(
      'GET',
      Uri.parse(
          '${Constants.BASE_URL}/patients/programs/verify/${getQueryParams(data)}'),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }
}
