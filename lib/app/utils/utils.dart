
import 'package:get/get.dart';

class Utils{
  static showMySnackbar({String title = "Notification", required String desc}) {
    Get.snackbar(
      title,
      desc,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      isDismissible: true,
    );
  } 

  
   
}