class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://learning-with-purpose-backend.vercel.app/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;


  static const String login = "user/login";

  static const String markAttendance = "";

  static const String getSubjects = "api/subject/get";

  static const String updateStudent = "user/updateStudent/";

  static const String uploadFile = "file-upload/file";

  static const String getStudentDeatils = "user/all-students?_id=";

  static const String getAllStudent = "user/all-students";
}
