import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';

import '../controllers/subjects_controller.dart';

class SubjectsView extends GetView<SubjectsController> {
  const SubjectsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: Size.fromHeight(46.kh),
            child: CustomAppBar(title: 'Mathematics', isBack: true)),
      body: const Center(
        child: Text(
          'SubjectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
