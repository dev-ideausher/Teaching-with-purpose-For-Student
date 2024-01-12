import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:teaching_with_purpose_student/app/data/models/login_model.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin {
  var isPassVisible = false.obs;
  var password = ''.obs;

  FirebaseAuthenticationService auth = FirebaseAuthenticationService();

  final formkey = GlobalKey<FormState>();

  late AnimationController animationController;

  late Animation animation;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  RxBool isLoding = false.obs;
  

//-----------------------login-------------------------------

  void checkLogin() {
    if (!formkey.currentState!.validate()) {
      return;
    }
    onClickLogin();
  }

  void onClickLogin() async {
    signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text);
  }

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await auth.loginWithEmail(email: email, password: password).then((value) async {
      if (value.user != null) {
      handleGetContact();
      } else {
         Utils.showMySnackbar(title: "Error",desc: value.errorMessage ?? "");
      }
    });
  }

        //   if (value.user!.emailVerified) {
        //   handleGetContact();
        // }else{
        //   CommonUtils.showMySnackbar(title: "Email verify ", desc: "Please verify your email and continue"); 
        // }

  Future<void> handleGetContact() async {
    try {
      var firebasetoken = await auth.currentUser?.getIdToken();
      log('token....$firebasetoken');
      Get.find<GetStorageService>().token = firebasetoken!;
      login();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

 void login(){
  APIManager.login().then((responce)async{
   if(responce.statusCode == 200){
    log(jsonEncode(responce.data));
    LoginModel loginModel = LoginModel.fromJson(responce.data);
    
    Get.find<GetStorageService>().isLoggedIn = true;
    Get.find<GetStorageService>().name = loginModel.user!.name.toString();
    Get.find<GetStorageService>().id = loginModel.user!.Id.toString();
    

    Utils.showMySnackbar(desc: 'Successfully logged In');

    Get.offAllNamed(Routes.BOTTOM_NAVBAR);
   } else {
    Utils.showMySnackbar(desc: responce.data['message'].toString());
   }
  }).onError((error, stackTrace){
   log('error....*****...$error');
  });
 }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
