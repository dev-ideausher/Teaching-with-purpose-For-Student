import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/questions_controller.dart';

class QuestionsView extends GetView<QuestionsController> {
  const QuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuestionsView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Text(
          '${controller.questionsModelData.value.question}',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
