import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mata3m/Services/auth_services.dart';
import 'package:mata3m/utils/services/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
class introController extends GetxController{
  @override

  final AuthService sinning = AuthService(FirebaseAuth.instance);
  void onInit() {
    checkFirstSeen();
    super.onInit();
  }
  Future checkFirstSeen() async {
    sinning.getCurrentUser().then((user) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool CheckValue = await prefs.containsKey('userid');
      var connectivityResult = await (Connectivity().checkConnectivity());
      print("connection${connectivityResult}");
      print(CheckValue);
      print(CheckValue);
      if (connectivityResult == ConnectivityResult.none) {
        Get.offAndToNamed(AppRoutes.notConnected);
      } else {
        if (CheckValue) {
          Get.offAndToNamed(AppRoutes.homeScreen);
        } else  {
          Get.offAndToNamed(AppRoutes.StartScreen);
        }
      }
    }) ;
  }
}