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

  static const String updateStudent = "user/updateStudent";

  static const String uploadFile = "file-upload/file";

  static const String getStudentDeatils = "user/all-students?_id=";

  static const String getAllStudent = "user/all-students";

  static const String getEvents = "api/event/get";

  static const String getQuiz = "api/quiz/get";

  static const String getAssignment = "api/assignment/get";

  static const String updateAssignment = "api/assignment/update";

  static const String getChapter = "api/chapter/get?subjectId=";

  static const String getQuestions = "api/question/get?chapterId=";

  static const String examSheet = "api/examdate/get";

  static const String timeTable = "api/timetable/get";

  static const String feedbacks = "api/feedback/save";

  static const String ratings = "api/rating/save";

  static const String sumbmitAssignment = "api/assigmentsubmit/save";

  static const String submitQuizz = "api/quizsubmit/attend";










  

  static var temImg = "https://thumbs.dreamstime.com/b/group-school-kids-teacher-classroom-education-elementary-learning-people-concept-sitting-listening-to-57820297.jpg";
}
