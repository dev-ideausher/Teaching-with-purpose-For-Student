///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class StudentPerformanceModelDataMarkId {
/*
{
  "_id": "65a955b52ed04b0b03837d1d",
  "studentId": "65701e37b9cdbf994405ddae",
  "examType": "half-yearly",
  "marks": 75,
  "grade": "B",
  "passOrFail": "pass",
  "isDeleted": false,
  "createdAt": "2024-01-18T16:45:41.845Z",
  "updatedAt": "2024-01-18T16:45:41.845Z",
  "__v": 0
} 
*/

  String? Id;
  String? studentId;
  String? examType;
  int? marks;
  String? grade;
  String? passOrFail;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? V;

  StudentPerformanceModelDataMarkId({
    this.Id,
    this.studentId,
    this.examType,
    this.marks,
    this.grade,
    this.passOrFail,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  StudentPerformanceModelDataMarkId.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    studentId = json['studentId']?.toString();
    examType = json['examType']?.toString();
    marks = json['marks']?.toInt();
    grade = json['grade']?.toString();
    passOrFail = json['passOrFail']?.toString();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['studentId'] = studentId;
    data['examType'] = examType;
    data['marks'] = marks;
    data['grade'] = grade;
    data['passOrFail'] = passOrFail;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class StudentPerformanceModelDataClassTimeTable {
/*
{
  "time": "10am-11am",
  "day": "monday",
  "subject": "657025d48c2337e8d3e2e30d",
  "subjectTeacher": "657021118c2337e8d3e2e307",
  "_id": "65d3019042db28a52371cb74"
} 
*/

  String? time;
  String? day;
  String? subject;
  String? subjectTeacher;
  String? Id;

  StudentPerformanceModelDataClassTimeTable({
    this.time,
    this.day,
    this.subject,
    this.subjectTeacher,
    this.Id,
  });
  StudentPerformanceModelDataClassTimeTable.fromJson(Map<String, dynamic> json) {
    time = json['time']?.toString();
    day = json['day']?.toString();
    subject = json['subject']?.toString();
    subjectTeacher = json['subjectTeacher']?.toString();
    Id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['day'] = day;
    data['subject'] = subject;
    data['subjectTeacher'] = subjectTeacher;
    data['_id'] = Id;
    return data;
  }
}

class StudentPerformanceModelDataClassClassFaculity {
/*
{
  "subjectTeacher": "657021118c2337e8d3e2e307",
  "subject": "6570261b8c2337e8d3e2e313",
  "_id": "65d3019042db28a52371cb72"
} 
*/

  String? subjectTeacher;
  String? subject;
  String? Id;

  StudentPerformanceModelDataClassClassFaculity({
    this.subjectTeacher,
    this.subject,
    this.Id,
  });
  StudentPerformanceModelDataClassClassFaculity.fromJson(Map<String, dynamic> json) {
    subjectTeacher = json['subjectTeacher']?.toString();
    subject = json['subject']?.toString();
    Id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['subjectTeacher'] = subjectTeacher;
    data['subject'] = subject;
    data['_id'] = Id;
    return data;
  }
}

class StudentPerformanceModelDataClass {
/*
{
  "_id": "65d3019042db28a52371cb71",
  "school": "65a52f67e6b1f330a3d7673d",
  "classTeacher": "657021118c2337e8d3e2e307",
  "className": "8th",
  "section": "A",
  "subject": "6570261b8c2337e8d3e2e313",
  "classCapcity": 30,
  "classFaculity": [
    {
      "subjectTeacher": "657021118c2337e8d3e2e307",
      "subject": "6570261b8c2337e8d3e2e313",
      "_id": "65d3019042db28a52371cb72"
    }
  ],
  "timeTable": [
    {
      "time": "10am-11am",
      "day": "monday",
      "subject": "657025d48c2337e8d3e2e30d",
      "subjectTeacher": "657021118c2337e8d3e2e307",
      "_id": "65d3019042db28a52371cb74"
    }
  ],
  "isDeleted": false,
  "createdAt": "2024-02-19T07:21:52.533Z",
  "updatedAt": "2024-02-19T07:21:52.533Z",
  "__v": 0
} 
*/

  String? Id;
  String? school;
  String? classTeacher;
  String? className;
  String? section;
  String? subject;
  int? classCapcity;
  List<StudentPerformanceModelDataClassClassFaculity?>? classFaculity;
  List<StudentPerformanceModelDataClassTimeTable?>? timeTable;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? V;

  StudentPerformanceModelDataClass({
    this.Id,
    this.school,
    this.classTeacher,
    this.className,
    this.section,
    this.subject,
    this.classCapcity,
    this.classFaculity,
    this.timeTable,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  StudentPerformanceModelDataClass.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    school = json['school']?.toString();
    classTeacher = json['classTeacher']?.toString();
    className = json['className']?.toString();
    section = json['section']?.toString();
    subject = json['subject']?.toString();
    classCapcity = json['classCapcity']?.toInt();
  if (json['classFaculity'] != null) {
  final v = json['classFaculity'];
  final arr0 = <StudentPerformanceModelDataClassClassFaculity>[];
  v.forEach((v) {
  arr0.add(StudentPerformanceModelDataClassClassFaculity.fromJson(v));
  });
    classFaculity = arr0;
    }
  if (json['timeTable'] != null) {
  final v = json['timeTable'];
  final arr0 = <StudentPerformanceModelDataClassTimeTable>[];
  v.forEach((v) {
  arr0.add(StudentPerformanceModelDataClassTimeTable.fromJson(v));
  });
    timeTable = arr0;
    }
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['school'] = school;
    data['classTeacher'] = classTeacher;
    data['className'] = className;
    data['section'] = section;
    data['subject'] = subject;
    data['classCapcity'] = classCapcity;
    if (classFaculity != null) {
      final v = classFaculity;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['classFaculity'] = arr0;
    }
    if (timeTable != null) {
      final v = timeTable;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['timeTable'] = arr0;
    }
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class StudentPerformanceModelDataSubject {
/*
{
  "icon": "",
  "_id": "6570261b8c2337e8d3e2e313",
  "subject": "English",
  "subjectCode": "005",
  "isDeleted": false,
  "createdAt": "2023-12-06T07:43:23.213Z",
  "updatedAt": "2023-12-06T07:43:23.213Z",
  "__v": 0
} 
*/

  String? icon;
  String? Id;
  String? subject;
  String? subjectCode;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? V;

  StudentPerformanceModelDataSubject({
    this.icon,
    this.Id,
    this.subject,
    this.subjectCode,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  StudentPerformanceModelDataSubject.fromJson(Map<String, dynamic> json) {
    icon = json['icon']?.toString();
    Id = json['_id']?.toString();
    subject = json['subject']?.toString();
    subjectCode = json['subjectCode']?.toString();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['_id'] = Id;
    data['subject'] = subject;
    data['subjectCode'] = subjectCode;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class StudentPerformanceModelData {
/*
{
  "_id": "65e1694df429291529827e9e",
  "subject": {
    "icon": "",
    "_id": "6570261b8c2337e8d3e2e313",
    "subject": "English",
    "subjectCode": "005",
    "isDeleted": false,
    "createdAt": "2023-12-06T07:43:23.213Z",
    "updatedAt": "2023-12-06T07:43:23.213Z",
    "__v": 0
  },
  "class": {
    "_id": "65d3019042db28a52371cb71",
    "school": "65a52f67e6b1f330a3d7673d",
    "classTeacher": "657021118c2337e8d3e2e307",
    "className": "8th",
    "section": "A",
    "subject": "6570261b8c2337e8d3e2e313",
    "classCapcity": 30,
    "classFaculity": [
      {
        "subjectTeacher": "657021118c2337e8d3e2e307",
        "subject": "6570261b8c2337e8d3e2e313",
        "_id": "65d3019042db28a52371cb72"
      }
    ],
    "timeTable": [
      {
        "time": "10am-11am",
        "day": "monday",
        "subject": "657025d48c2337e8d3e2e30d",
        "subjectTeacher": "657021118c2337e8d3e2e307",
        "_id": "65d3019042db28a52371cb74"
      }
    ],
    "isDeleted": false,
    "createdAt": "2024-02-19T07:21:52.533Z",
    "updatedAt": "2024-02-19T07:21:52.533Z",
    "__v": 0
  },
  "studentId": "65701e37b9cdbf994405ddae",
  "resultType": "live-quiz",
  "markId": {
    "_id": "65a955b52ed04b0b03837d1d",
    "studentId": "65701e37b9cdbf994405ddae",
    "examType": "half-yearly",
    "marks": 75,
    "grade": "B",
    "passOrFail": "pass",
    "isDeleted": false,
    "createdAt": "2024-01-18T16:45:41.845Z",
    "updatedAt": "2024-01-18T16:45:41.845Z",
    "__v": 0
  },
  "topic": "Grammar",
  "remarks": "Excellent performance!",
  "performance": "excellent",
  "isDeleted": false,
  "createdAt": "2024-03-01T05:36:13.707Z",
  "updatedAt": "2024-03-01T05:36:13.707Z",
  "__v": 0
} 
*/

  String? Id;
  StudentPerformanceModelDataSubject? subject;
  StudentPerformanceModelDataClass? theClass;
  String? studentId;
  String? resultType;
  StudentPerformanceModelDataMarkId? markId;
  String? topic;
  String? remarks;
  String? performance;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? V;

  StudentPerformanceModelData({
    this.Id,
    this.subject,
    this.theClass,
    this.studentId,
    this.resultType,
    this.markId,
    this.topic,
    this.remarks,
    this.performance,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  StudentPerformanceModelData.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    subject = (json['subject'] != null) ? StudentPerformanceModelDataSubject.fromJson(json['subject']) : null;
    theClass = (json['class'] != null) ? StudentPerformanceModelDataClass.fromJson(json['class']) : null;
    studentId = json['studentId']?.toString();
    resultType = json['resultType']?.toString();
    markId = (json['markId'] != null) ? StudentPerformanceModelDataMarkId.fromJson(json['markId']) : null;
    topic = json['topic']?.toString();
    remarks = json['remarks']?.toString();
    performance = json['performance']?.toString();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    if (theClass != null) {
      data['class'] = theClass!.toJson();
    }
    data['studentId'] = studentId;
    data['resultType'] = resultType;
    if (markId != null) {
      data['markId'] = markId!.toJson();
    }
    data['topic'] = topic;
    data['remarks'] = remarks;
    data['performance'] = performance;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class StudentPerformanceModel {
/*
{
  "status": true,
  "result": 1,
  "data": [
    {
      "_id": "65e1694df429291529827e9e",
      "subject": {
        "icon": "",
        "_id": "6570261b8c2337e8d3e2e313",
        "subject": "English",
        "subjectCode": "005",
        "isDeleted": false,
        "createdAt": "2023-12-06T07:43:23.213Z",
        "updatedAt": "2023-12-06T07:43:23.213Z",
        "__v": 0
      },
      "class": {
        "_id": "65d3019042db28a52371cb71",
        "school": "65a52f67e6b1f330a3d7673d",
        "classTeacher": "657021118c2337e8d3e2e307",
        "className": "8th",
        "section": "A",
        "subject": "6570261b8c2337e8d3e2e313",
        "classCapcity": 30,
        "classFaculity": [
          {
            "subjectTeacher": "657021118c2337e8d3e2e307",
            "subject": "6570261b8c2337e8d3e2e313",
            "_id": "65d3019042db28a52371cb72"
          }
        ],
        "timeTable": [
          {
            "time": "10am-11am",
            "day": "monday",
            "subject": "657025d48c2337e8d3e2e30d",
            "subjectTeacher": "657021118c2337e8d3e2e307",
            "_id": "65d3019042db28a52371cb74"
          }
        ],
        "isDeleted": false,
        "createdAt": "2024-02-19T07:21:52.533Z",
        "updatedAt": "2024-02-19T07:21:52.533Z",
        "__v": 0
      },
      "studentId": "65701e37b9cdbf994405ddae",
      "resultType": "live-quiz",
      "markId": {
        "_id": "65a955b52ed04b0b03837d1d",
        "studentId": "65701e37b9cdbf994405ddae",
        "examType": "half-yearly",
        "marks": 75,
        "grade": "B",
        "passOrFail": "pass",
        "isDeleted": false,
        "createdAt": "2024-01-18T16:45:41.845Z",
        "updatedAt": "2024-01-18T16:45:41.845Z",
        "__v": 0
      },
      "topic": "Grammar",
      "remarks": "Excellent performance!",
      "performance": "excellent",
      "isDeleted": false,
      "createdAt": "2024-03-01T05:36:13.707Z",
      "updatedAt": "2024-03-01T05:36:13.707Z",
      "__v": 0
    }
  ]
} 
*/

  bool? status;
  int? result;
  List<StudentPerformanceModelData?>? data;

  StudentPerformanceModel({
    this.status,
    this.result,
    this.data,
  });
  StudentPerformanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <StudentPerformanceModelData>[];
  v.forEach((v) {
  arr0.add(StudentPerformanceModelData.fromJson(v));
  });
    data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['result'] = result;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['data'] = arr0;
    }
    return data;
  }
}
