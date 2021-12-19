import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mata3m/Services/auth_services.dart';
import 'package:mata3m/models/user.dart';

class profileController extends GetxController{
  late Users user ;
  var loaded = false;
  final AuthService sinning = new AuthService(FirebaseAuth.instance);
  @override
  void onInit() {
    setUpDate();
    super.onInit();
  }
  setUpDate() async {
    loaded = true;
   user = await sinning.getDataOfCurrentUser();
   loaded  = false;
   update();
  }
  SigningOut(){
    sinning.signOut();
  }
}