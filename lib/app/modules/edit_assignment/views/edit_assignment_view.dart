import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_assignment_controller.dart';

class EditAssignmentView extends GetView<EditAssignmentController> {
  const EditAssignmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditAssignmentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditAssignmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
