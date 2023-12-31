///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class LoginModelUser {
/*
{
  "_id": "65701e37b9cdbf994405ddae",
  "rollNumber": 15,
  "school": "Sample School",
  "admissionId": "",
  "admissionDate": "2023-12-06T07:09:23.902Z",
  "district": "Sample District",
  "districtStudentID": "123456",
  "stateStudentID": "7890",
  "name": "John nil",
  "email": "student321@gmail.com",
  "image": "https://angolazone.s3.amazonaws.com/angolazone-User-Profile-PNG-High-Quality-Image.png.crdownload",
  "gender": "Male",
  "dob": "15-07-1996",
  "firebaseUid": "tRs34G9tTTbDXnm34i2oCdSNgj03",
  "firebaseSignInProvider": "custom",
  "active": true,
  "isDeleted": false,
  "__t": "Student",
  "createdAt": "2023-12-06T07:09:43.682Z",
  "updatedAt": "2023-12-06T07:09:43.682Z",
  "__v": 0
} 
*/

  String? Id;
  int? rollNumber;
  String? school;
  String? admissionId;
  String? admissionDate;
  String? district;
  String? districtStudentID;
  String? stateStudentID;
  String? name;
  String? email;
  String? image;
  String? gender;
  String? dob;
  String? firebaseUid;
  String? firebaseSignInProvider;
  bool? active;
  bool? isDeleted;
  String? T;
  String? createdAt;
  String? updatedAt;
  int? V;

  LoginModelUser({
    this.Id,
    this.rollNumber,
    this.school,
    this.admissionId,
    this.admissionDate,
    this.district,
    this.districtStudentID,
    this.stateStudentID,
    this.name,
    this.email,
    this.image,
    this.gender,
    this.dob,
    this.firebaseUid,
    this.firebaseSignInProvider,
    this.active,
    this.isDeleted,
    this.T,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  LoginModelUser.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    rollNumber = json['rollNumber']?.toInt();
    school = json['school']?.toString();
    admissionId = json['admissionId']?.toString();
    admissionDate = json['admissionDate']?.toString();
    district = json['district']?.toString();
    districtStudentID = json['districtStudentID']?.toString();
    stateStudentID = json['stateStudentID']?.toString();
    name = json['name']?.toString();
    email = json['email']?.toString();
    image = json['image']?.toString();
    gender = json['gender']?.toString();
    dob = json['dob']?.toString();
    firebaseUid = json['firebaseUid']?.toString();
    firebaseSignInProvider = json['firebaseSignInProvider']?.toString();
    active = json['active'];
    isDeleted = json['isDeleted'];
    T = json['__t']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['rollNumber'] = rollNumber;
    data['school'] = school;
    data['admissionId'] = admissionId;
    data['admissionDate'] = admissionDate;
    data['district'] = district;
    data['districtStudentID'] = districtStudentID;
    data['stateStudentID'] = stateStudentID;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['gender'] = gender;
    data['dob'] = dob;
    data['firebaseUid'] = firebaseUid;
    data['firebaseSignInProvider'] = firebaseSignInProvider;
    data['active'] = active;
    data['isDeleted'] = isDeleted;
    data['__t'] = T;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class LoginModel {
/*
{
  "status": true,
  "message": "User details",
  "user": {
    "_id": "65701e37b9cdbf994405ddae",
    "rollNumber": 15,
    "school": "Sample School",
    "admissionId": "",
    "admissionDate": "2023-12-06T07:09:23.902Z",
    "district": "Sample District",
    "districtStudentID": "123456",
    "stateStudentID": "7890",
    "name": "John nil",
    "email": "student321@gmail.com",
    "image": "https://angolazone.s3.amazonaws.com/angolazone-User-Profile-PNG-High-Quality-Image.png.crdownload",
    "gender": "Male",
    "dob": "15-07-1996",
    "firebaseUid": "tRs34G9tTTbDXnm34i2oCdSNgj03",
    "firebaseSignInProvider": "custom",
    "active": true,
    "isDeleted": false,
    "__t": "Student",
    "createdAt": "2023-12-06T07:09:43.682Z",
    "updatedAt": "2023-12-06T07:09:43.682Z",
    "__v": 0
  }
} 
*/

  bool? status;
  String? message;
  LoginModelUser? user;

  LoginModel({
    this.status,
    this.message,
    this.user,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    user = (json['user'] != null) ? LoginModelUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}


