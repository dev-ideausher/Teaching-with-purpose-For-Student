///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UploadFileModel {
/*
{
  "status": true,
  "message": "File uploaded",
  "url": "https://angolazone.s3.amazonaws.com/angolazone-teacherimg.png"
} 
*/

  bool? status;
  String? message;
  String? url;

  UploadFileModel({
    this.status,
    this.message,
    this.url,
  });
  UploadFileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['url'] = url;
    return data;
  }
}
