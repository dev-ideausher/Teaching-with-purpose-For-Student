
import 'dart:convert';

import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  APIManager._();
  ///Post API

  static Future<Response> login() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.login);  

  static Future<Response> uploadFile({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).post(Endpoints.uploadFile, data: body, options: Options(headers: {'Content-Type': 'multipart/form-data'}));



//Get API
  static Future<Response> getSubjects() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getSubjects);  

  static Future<Response> getStudentDetails({required String id}) async => 
         await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getStudentDeatils + id);  



//Patch API
  static Future<Response> updateStudentDetails({required String id, required dynamic body}) async => 
          await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.updateStudent + id,data: jsonEncode(body));  
}