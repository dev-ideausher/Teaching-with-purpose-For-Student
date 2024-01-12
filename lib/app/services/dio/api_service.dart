
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  APIManager._();
  ///Post API

  static Future<Response> login() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.login);  

  static Future<Response> uploadFile({required dynamic body}) async =>await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.uploadFile, data: body, options: Options(headers: {'Content-Type': 'multipart/form-data'}));

  static Future<Response> submitAssignment({required dynamic body}) async => await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.submitAssignmnet, data: body);



//Get API
  static Future<Response> getSubjects() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getSubjects);  

  static Future<Response> getStudentDetails({required String id}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getStudentDeatils + id);  

  static Future<Response> getEvents() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getEvents);  

  static Future<Response> getQuizz() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getQuiz);  

  static Future<Response> getAssignment() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getAssignment);  

  static Future<Response> getChapter({required String subjectId}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getChapter + subjectId);  

  static Future<Response> getQuestion({required String chapterId}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getQuestions + chapterId);  

  static Future<Response> getExamSheet() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.examSheet);  

  static Future<Response> getTimeTable() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.timeTable);  
  


//Patch API
  static Future<Response> updateStudentDetails({required String id,required dynamic body}) async =>await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch("${Endpoints.updateStudent}/$id",data: jsonEncode(body));

  static Future<Response> updateAssignment({required String id,required dynamic body}) async =>await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch("${Endpoints.updateAssignment}/$id",data: jsonEncode(body));






// Dawnload File
 static  Future<File> downloadFile(String url,{required String downloadPath, Map<String, dynamic>? parameters,Function(double progress)? onReceiveProgress}) async {
    try {
      final dio = Dio();
      dio.options.responseType = ResponseType.bytes;
      dio.options.followRedirects = false;
      final response = await dio.get(url,queryParameters: parameters,onReceiveProgress: (count, total) {onReceiveProgress?.call(count / total);});
      Directory(downloadPath).createSync(recursive: true);

      File file = File(downloadPath);
      await file.writeAsBytes(response.data, flush: true);
      dio.close();

      return file;
    } catch (e) {
      print('Error downloading file: $e');

      throw Exception('Error downloading file: $e');
    }
    }
}