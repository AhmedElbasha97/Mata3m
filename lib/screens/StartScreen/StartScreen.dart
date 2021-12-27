import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/screens/loginScreen/login_screen.dart';
import 'package:mata3m/screens/signupScreen/signup_screen.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/widgets/button.dart';
class startScreen extends StatefulWidget {
  const startScreen({Key? key}) : super(key: key);
  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/homeLogo.png",height: 500, width: 200,),
        SizedBox(height: 20,),
        RoundedCornerButton(borderRadius: 25.0,title: "Sign In",hasBorder: true,height: 48,width: 200,backgroundColor: kWhiteColor,onPressed: (){Get.to(LoginScreen());},textColor: kPrimaryColor,),
        SizedBox(height: 20,),
        RoundedCornerButton(borderRadius: 25.0,title: "Sign Up",hasBorder: true,height: 48,width: 200,backgroundColor: kPrimaryColor,onPressed: (){Get.to(SignupScreen());},textColor: kWhiteColor,),
  ],
      ),
    ),
    );
  }
}
