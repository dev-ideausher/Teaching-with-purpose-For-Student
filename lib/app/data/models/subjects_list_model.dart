///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class SubjectsListModelData {
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

  SubjectsListModelData({
    this.icon,
    this.Id,
    this.subject,
    this.subjectCode,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  SubjectsListModelData.fromJson(Map<String, dynamic> json) {
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

class SubjectsListModel {
/*
{
  "status": true,
  "result": 6,
  "data": [
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
  ]
} 
*/

  bool? status;
  int? result;
  List<SubjectsListModelData?>? data;

  SubjectsListModel({
    this.status,
    this.result,
    this.data,
  });
  SubjectsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <SubjectsListModelData>[];
  v.forEach((v) {
  arr0.add(SubjectsListModelData.fromJson(v));
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

