
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/Services/auth_services.dart';
import 'package:mata3m/screens/signupScreen/signup_helper.dart';
import 'package:mata3m/utils/translation_key.dart';
const wrongCode = 'assets/images/wrong_code.png';

class LoginController extends GetxController {
  final _validatorHelber = SignupHelper.instance;
  final AuthService sinning = new AuthService(FirebaseAuth.instance);

  RxBool _visiblePsd = false.obs;

  //fixme make it false

  RxBool _isEnableLogin = false.obs;

  bool get isEnableLogin => _isEnableLogin.value;
  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  set isEnableLogin(bool value) {
    _isEnableLogin.value = value;
    print('LoginController.isEnableSignup value= $value');
    update();
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool passValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool nameState = false;
  bool passState = false;
  bool emailState = false;

  // InqueryModel? _inqueryModel;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
    // phoneController.clear();
    emailController.clear();
  }


  void onUpdate(String? value) {
    if (value == "") {
      emailValidated = false;
    }
    update();
  }

  String? validateEmail(String? email) {
    final validateEmail = _validatorHelber.validateEmail(email);
    if (email == "") {
      emailState = false;
      emailValidated = false;
    } else if (validateEmail == null) {
      emailState = true;
      emailValidated = true;
    } else {
      emailValidated = true;
      emailState = false;
    }
    return validateEmail;
  }

  String? validatePassword(String? password) {
    final validatePassword = _validatorHelber.validatePassword(password);
    if (validatePassword == null) {
      passState = true;
    }
    passValidated = true;
    return validatePassword;
  }

  Future<void> sendPressed() async {
    formValidated = formKey.currentState!.validate();
    if (formValidated) {
      formKey.currentState?.save();
      // await sendInquiry();
    }
  }

  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n $tryAgain.tr ",
        titlePadding: EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }
  sinningin(context){

      if(passState){
        if(emailState){
          sinning.signInEmail(context,emailController.text,passwordController.text);
          }}
  }
  @override
  String toString() {
    return 'LoginController{ _email: ${emailController.value}, _password: ${passwordController.value}}';
  }
}
