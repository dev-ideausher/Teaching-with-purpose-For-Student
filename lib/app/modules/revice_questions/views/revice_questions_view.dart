import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/revice_questions_controller.dart';

class ReviceQuestionsView extends GetView<ReviceQuestionsController> {
  const ReviceQuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReviceQuestionsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReviceQuestionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
