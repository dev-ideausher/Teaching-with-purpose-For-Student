import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }
  bool get isLoggedIn => _runData.read('isLoggedIn') ?? false;

  set isLoggedIn(bool isLoggedIn) => _runData.write('isLoggedIn', isLoggedIn);

  String get token => _runData.read('token') ?? '';

  set token(String token) => _runData.write('token', token);

  String get name => _runData.read('name') ?? '';

  set name(String name) => _runData.write('name', name);

  String get id => _runData.read('id') ?? '';

  set id(String id) => _runData.write('id', id);

  String get rollNumber => _runData.read('rollNumber') ?? '';

  set rollNumber(String rollNumber) => _runData.write('rollNumber', rollNumber);  

  String get chapter => _runData.read('chapter') ?? '';

  set chapter(String chapter) => _runData.write('chapter', chapter);  

  String get concept => _runData.read('concept') ?? '';

  set concept(String concept) => _runData.write('concept', concept); 

  String get chapterId => _runData.read('chapterId') ?? '';

  set chapterId(String chapterId) => _runData.write('chapterId', chapterId); 

  bool get isAttendanceMarked => _runData.read('isAttendanceMarked') ?? false;

  set isAttendanceMarked(bool isAttendanceMarked) => _runData.write('isAttendanceMarked', isAttendanceMarked);

  DateTime? get lastAttendanceMarkedDate => _runData.read<DateTime>('lastAttendanceMarkedDate');

  set lastAttendanceMarkedDate(DateTime? date) => _runData.write('lastAttendanceMarkedDate', date?.toIso8601String());

  double get videoPosition => _runData.read('videoPosition') ?? 0.0;

  set videoPosition(double position) => _runData.write('videoPosition', position);

  String get videoUrl => _runData.read('videoUrl') ?? '';

  set videoUrl(String url) => _runData.write('videoUrl', url);






  void logout() {
    _runData.erase();
  }
}
