import 'package:get/get.dart';

import '../modules/assignment/bindings/assignment_binding.dart';
import '../modules/assignment/views/assignment_view.dart';
import '../modules/assignment_completion/bindings/assignment_completion_binding.dart';
import '../modules/assignment_completion/views/assignment_completion_view.dart';
import '../modules/attendance/bindings/attendance_binding.dart';
import '../modules/attendance/views/attendance_view.dart';
import '../modules/book_marks/bindings/book_marks_binding.dart';
import '../modules/book_marks/views/bookmarks_view.dart';
import '../modules/bottom_navbar/bindings/bottom_navbar_binding.dart';
import '../modules/bottom_navbar/views/bottom_navbar_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/change_password/views/change_pwd_success_view.dart';
import '../modules/chapters/bindings/chapters_binding.dart';
import '../modules/chapters/views/chapters_view.dart';
import '../modules/chapters/views/selected_chapter_view.dart';
import '../modules/course_completion/bindings/course_completion_binding.dart';
import '../modules/course_completion/views/course_completion_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/education_profile/bindings/education_profile_binding.dart';
import '../modules/education_profile/views/education_profile_view.dart';
import '../modules/education_profile/views/screens/career_bio/personal_achievements_screen.dart';
import '../modules/education_profile/views/screens/discussion_form/discussion_form_screen.dart';
import '../modules/education_profile/views/screens/discussion_form/selected_sub_discussion_screen.dart';
import '../modules/education_profile/views/screens/goals_and%20_plans/goals_plans_screen.dart';
import '../modules/education_profile/views/screens/self_assessment/self_assessment_screen.dart';
import '../modules/events/bindings/events_binding.dart';
import '../modules/events/views/events_view.dart';
import '../modules/exam_score/bindings/exam_score_binding.dart';
import '../modules/exam_score/views/exam_score_view.dart';
import '../modules/feedbacks/bindings/feedbacks_binding.dart';
import '../modules/feedbacks/views/feedbacks_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/help_center/bindings/help_center_binding.dart';
import '../modules/help_center/views/help_center_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/live_quizz/bindings/live_quizz_binding.dart';
import '../modules/live_quizz/views/live_quizz_view.dart';
import '../modules/live_quizz/views/quiz_sucess_view.dart';
import '../modules/live_quizz/views/start_quizz_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/on_board/bindings/on_board_binding.dart';
import '../modules/on_board/views/get_started_view.dart';
import '../modules/on_board/views/on_board_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/progress/bindings/progress_binding.dart';
import '../modules/progress/views/progress_view.dart';
import '../modules/questions/bindings/questions_binding.dart';
import '../modules/questions/views/questions_view.dart';
import '../modules/quizz/bindings/quizz_binding.dart';
import '../modules/quizz/views/quizz_view.dart';
import '../modules/schedule/bindings/schedule_binding.dart';
import '../modules/schedule/views/schedule_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/student_behavior/bindings/student_behavior_binding.dart';
import '../modules/student_behavior/views/student_behavior_view.dart';
import '../modules/subjects/bindings/subjects_binding.dart';
import '../modules/subjects/views/subjects_view.dart';
import '../modules/verify/bindings/verify_binding.dart';
import '../modules/verify/views/verify_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => const OnBoardView(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => const GetStartedView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY,
      page: () => const VerifyView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: _Paths.PROGRESS,
      page: () => const ProgressView(),
      binding: ProgressBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECTS,
      page: () => const SubjectsView(),
      binding: SubjectsBinding(),
    ),
    GetPage(
      name: _Paths.QUIZZ,
      page: () => const QuizzView(),
      binding: QuizzBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_QUIZZ,
      page: () => const LiveQuizzView(),
      binding: LiveQuizzBinding(),
    ),
    GetPage(
      name: _Paths.START_QUIZZ,
      page: () => const StartQuizzView(),
    ),
    GetPage(
      name: _Paths.QUIZZ_SUCESS,
      page: () => const QuizzSucessView(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => const EventsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD_SUCCESS,
      page: () => const ChangePasswordSuccessView(),
    ),
    GetPage(
        name: _Paths.BOTTOM_NAVBAR,
        page: () => const BottomNavbarView(),
        binding: BottomNavbarBinding()),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_MARKS,
      page: () => const BookMarksView(),
      binding: BookMarksBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACKS,
      page: () => const FeedbacksView(),
      binding: FeedbacksBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CENTER,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: _Paths.EDUCATION_PROFILE,
      page: () => const EducationProfileView(),
      binding: EducationProfileBinding(),
    ),
    GetPage(
      name: _Paths.SELF_ASSESSMENT,
      page: () => const SelfAssessmentScreen(),
    ),
    GetPage(
      name: _Paths.GOALS_AND_PLANS,
      page: () => const GoalsandPlans(),
    ),
    GetPage(
      name: _Paths.PERSONAL_ACHIVEMENT,
      page: () => const PersonalAchievementsScreen(),
    ),
    GetPage(
      name: _Paths.DISCUSSSION_FORM,
      page: () => const DiscussionFormScreen(),
    ),
    GetPage(
      name: _Paths.SELECTED_DISCUSSION,
      page: () => SelectedSubDiscussionScreen(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => const AttendanceView(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT,
      page: () => const AssignmentView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: _Paths.CHAPTERS,
      page: () => const ChaptersView(),
      binding: ChaptersBinding(),
    ),
    GetPage(
      name: _Paths.SELECTED_CHAPTER,
      page: () => const SelectedChapterView(),
    ),
    GetPage(
      name: _Paths.QUESTIONS,
      page: () => const QuestionsView(),
      binding: QuestionsBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT_COMPLETION,
      page: () => const AssignmentCompletionView(),
      binding: AssignmentCompletionBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_COMPLETION,
      page: () => const CourseCompletionView(),
      binding: CourseCompletionBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_BEHAVIOR,
      page: () => const StudentBehaviorView(),
      binding: StudentBehaviorBinding(),
    ),
    GetPage(
      name: _Paths.EXAM_SCORE,
      page: () => const ExamScoreView(),
      binding: ExamScoreBinding(),
    ),
  ];
}
