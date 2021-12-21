


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/Services/auth_services.dart';
import 'package:mata3m/screens/signupScreen/signup_helper.dart';


const wrongCode = 'assets/images/wrong_code.png';

class SignupController extends GetxController {

  final _validatorHelber = SignupHelper.instance;
  final AuthService sinning = new AuthService(FirebaseAuth.instance);
  RxBool _visiblePsd = false.obs;
  RxBool _isEnableSignup = false.obs;
  RxBool _isAcceptTerms = false.obs;


  bool get isAcceptTerms => _isAcceptTerms.value;

  void toggleCheckbox() {
    _isAcceptTerms.value = !_isAcceptTerms.value;
  }
  bool get isEnableSignup => _isEnableSignup.value;
  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  set isEnableSignup(bool value) {
    _isEnableSignup.value = value;
    print('SignupController.isEnableSignup value= $value');
    update();
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController =
      TextEditingController(text: "55d");
  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool nameValidated = false;
  bool passValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool nameState = false;
  bool passState = false;
  bool emailState = false;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
    nameController.clear();
    emailController.clear();
  }

  void onEmailUpdate(String? value) {
    if (value == "") {
      emailValidated = false;
    }
    update();
  }

  void onNameupdate(String? value) {
    if (value == "") {
      nameState = false;
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

  String? validateName(String? name) {
    var validateName = _validatorHelber.validateName(name);
    if (validateName == null && name != "") {
      nameState = true;
      nameValidated = true;
    } else {
      nameValidated = true;
      nameState = false;
    }
    return validateName;
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
        title: "error /n  ",
        titlePadding: EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }
  sinningUP(context){
    if(nameState){
    if(passState){
    if(emailState){
  sinning.signUpWithEmailandPassword(email: emailController.text,password: passwordController.text,context: context,username: nameController.text,confirmpassword: passwordController.text);
  }}}
  }
  @override
  String toString() {
    return 'SignupController{ _firstName: ${nameController.value},_email: ${emailController.value}, _password: ${passwordController.value}}';
  }
}
