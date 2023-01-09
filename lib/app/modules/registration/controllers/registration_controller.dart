// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:podcast_ba/app/data/db/db_helper.dart';
import 'package:podcast_ba/app/data/models/user.dart';
import 'package:podcast_ba/app/modules/login/views/login_view.dart';
import 'package:podcast_ba/app/modules/registration/views/registration_view.dart';

class RegistrationController extends GetxController {
  int id = 1;
  final ifname = ''.obs;
  final ilname = ''.obs;
  final iemail = ''.obs;
  final ipassword = ''.obs;
  final ipasswordConfirm = ''.obs;
  var dbHelper;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dbHelper = DbHelper();
  }

  signUp() async {
    String firstname = ifname.value;
    String lastname = ilname.value;
    String email = iemail.value;
    String passwd = ipassword.value;
    String cpasswd = ipasswordConfirm.value;

    if (passwd != cpasswd || firstname.isEmpty || lastname.isEmpty || email.isEmpty || passwd.isEmpty || cpasswd.isEmpty) {
      Get.snackbar("Ops", "Fill every field and check passwords");
      //alertDialog(context, 'Password Mismatch');
    } else {
      User uModel = User(
          id: id,
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: passwd);
      await dbHelper.saveData(uModel).then((userData) {
        //alertDialog(context, "Successfully Saved");
        Get.snackbar("congrats", "Succesfull registration");
        Get.to(LoginView(), transition: Transition.leftToRight);
        id++;
      }).catchError((error) {
        print(error);
        //alertDialog(context, "Error: Data Save Fail");
        Get.snackbar("Ops", "something went wrong");
      });
    }
  }
}
