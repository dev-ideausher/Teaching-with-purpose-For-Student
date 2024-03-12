
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  APIManager._();
  ///Post API

  static Future<Response> login() async => await DioClient(Dio(), isOverlayLoader: true, showSnackbar: true).post(Endpoints.login);  

  static Future<Response> uploadFile({required dynamic body}) async =>await DioClient(Dio(), isOverlayLoader: true, showSnackbar: false).post(Endpoints.uploadFile, data: body, options: Options(headers: {'Content-Type': 'multipart/form-data'}));

  static Future<Response> sendFeedback({required dynamic body}) async => await DioClient(Dio(), isOverlayLoader: true, showSnackbar: false).post(Endpoints.feedbacks, data: jsonEncode(body));

  static Future<Response> giveRating({required dynamic body}) async => await DioClient(Dio(), isOverlayLoader: true, showSnackbar: false).post(Endpoints.ratings, data: jsonEncode(body));

  static Future<Response> submitAssignment({required dynamic body}) async => await DioClient(Dio(), isOverlayLoader: true, showSnackbar: false).post(Endpoints.sumbmitAssignment, data: jsonEncode(body));

  static Future<Response> submitQuizz({required dynamic body}) async => await DioClient(Dio(), isOverlayLoader: true, showSnackbar: false).post(Endpoints.submitQuizz, data: jsonEncode(body));

  static Future<Response> completeChapter({required dynamic body}) async => await DioClient(Dio(), isOverlayLoader: true, showSnackbar: false).post(Endpoints.completeChapter, data: jsonEncode(body));

  static Future<Response> markattendance({required dynamic body}) async => await DioClient(Dio(), isOverlayLoader: true, showSnackbar: false).post(Endpoints.markAttendance, data: jsonEncode(body));



//Get API
  static Future<Response> getUser({required String id}) async => await DioClient(Dio(), isOverlayLoader: false, showSnackbar: true).get(Endpoints.getStudentDeatils + id); 
  
  static Future<Response> getSubjects() async => await DioClient(Dio(), isOverlayLoader: false, showSnackbar: true).get(Endpoints.getSubjects);   

  static Future<Response> getEvents() async => await DioClient(Dio(),  isOverlayLoader: false, showSnackbar: true).get(Endpoints.getEvents);  

  static Future<Response> getQuizz() async => await DioClient(Dio(),  isOverlayLoader: false, showSnackbar: true).get(Endpoints.getQuiz);  

  static Future<Response> getAssignment() async => await DioClient(Dio(),  isOverlayLoader: false, showSnackbar: true).get(Endpoints.getAssignment);  

  static Future<Response> getChapter({required String subjectId}) async => await DioClient(Dio(),  isOverlayLoader: false, showSnackbar: true).get(Endpoints.getChapter + subjectId);  

  static Future<Response> getQuestion({required String chapterId}) async => await DioClient(Dio(),  isOverlayLoader: false, showSnackbar: true).get(Endpoints.getQuestions + chapterId);  

  static Future<Response> getExamSheet() async => await DioClient(Dio(),  isOverlayLoader: false, showSnackbar: true).get(Endpoints.examSheet);  

  static Future<Response> getTimeTable() async => await DioClient(Dio(),  isOverlayLoader: false, showSnackbar: true).get(Endpoints.timeTable);  

  static Future<Response> getSubmittedAssignment() async => await DioClient(Dio(), isOverlayLoader: false, showSnackbar: true).get(Endpoints.getSubmitedAssignment); 

  static Future<Response> getReviceQuestions({required String chapterId}) async => await DioClient(Dio(), isOverlayLoader: false, showSnackbar: true).get(Endpoints.getReviceQuestions + chapterId);  

  static Future<Response> getClasses() async => await DioClient(Dio(), isOverlayLoader: false, showSnackbar: true).get(Endpoints.getClasses);  

  static Future<Response> getAssignmentCompletion({required String studentId,String? subjectId}) async {String url = '${Endpoints.getAssignmentCompletion}/$studentId${subjectId != null ? '?subjectId=$subjectId' : ''}';
  return await DioClient(Dio(), isOverlayLoader: false, showSnackbar: true).get(url);} 

  static Future<Response> getPerformance({required String resultType, String? subject}) async {String url = '${Endpoints.getPerformance}?resultType=$resultType${subject != null ? '&subject=$subject' : ''}';
  return await DioClient(Dio(), showSnackbar: true, isOverlayLoader: false).get(url);}

  static Future<Response> getCourseCompletion({required String studentId,String? subject}) async {String url = '${Endpoints.getCourseCompletion}/$studentId${subject != null ? '?subjectId=$subject' : ''}';
  return await DioClient(Dio(), isOverlayLoader: false, showSnackbar: true).get(url);}

  





//Patch API
  static Future<Response> updateUser({required String id,required dynamic body}) async =>await DioClient(Dio(), isOverlayLoader: true, showSnackbar: true).patch("${Endpoints.updateStudent}/$id",data: jsonEncode(body));

  static Future<Response> updateAssignment({required String id,required dynamic body}) async =>await DioClient(Dio(), isOverlayLoader: true, showSnackbar: true).patch("${Endpoints.updateSubmittedAssignment}/$id",data: jsonEncode(body));






// Dawnload File
  static Future<File> downloadFile(
    String url, {required String downloadPath,Map<String, dynamic>? parameters,Function(double progress)? onReceiveProgress}) async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    dio.options.followRedirects = false;

    await dio.download(
      url,
      downloadPath,
      queryParameters: parameters,
      onReceiveProgress: (count, total) {
        onReceiveProgress?.call(count / total);
      },
    );

    return File(downloadPath);
  } catch (e) {
    log('Error downloading file: $e');
    throw Exception('Error downloading file: $e');
  }
}

}