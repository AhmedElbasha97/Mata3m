import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/models/user.dart';
import 'package:mata3m/utils/services/api_service.dart';
import 'package:mata3m/utils/services/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);
  static ApiService api = ApiService();
  //
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  final ref = FirebaseDatabase.instance.reference().child("Users");

  removeUserIdFromCach() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("userid");
  }

  //Add user id
  addUserIdToCach(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userid', id);
  }



  void showAlert(context, lable, message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(lable),
          content: Text(message),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  signInWithEmailAndPassword(context, email, password) async {
    print(email);
        try {
          UserCredential userCredential = await _auth
              .signInWithEmailAndPassword(email: email, password: password);
          final userid = userCredential.user!.uid;
          addUserIdToCach(userid);
          Get.offAndToNamed(
              AppRoutes.homeScreen
          );
          return "Signd in";
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            showAlert(context, 'No user found for that email',
                "Please Check Your Email");

            return 'No user found for that email.';
          } else if (e.code == 'wrong-password') {
            showAlert(context, 'wrong password', "Please Reenter Your Password");

            return 'Wrong password.';
          }
        }

  }

  void safeUserDataToUserTable(email,userId,password,userName){
    ref.child(userId).set({
      'email':email,
      'Name':userName,
      'password':password
    });
  }

 signUpWithEmailandPassword(
      {context, email, username, confirmpassword, password, type}) async {
            try {
              UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              final userid = userCredential.user!.uid;
              addUserIdToCach(userid);
              safeUserDataToUserTable(email, userid, password, username);
              Get.offAndToNamed(
                  AppRoutes.homeScreen
              );} on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                showAlert(
                    context, 'weak-password', "Please Type Stronger Password");
              } else if (e.code == 'email-already-i n-use') {
                showAlert(context, 'email-already-in-use',
                    "Please Enter Another Email");
              }
            } catch (e) {
              showAlert(context, 'opps', e);
            }

  }

//resetpassword
  // ignore: missing_return
   resetPassword({email, context}) {
      _auth.sendPasswordResetEmail(email: email);
      showAlert(context, "Your Password Has Been Reset",
          "Please Go And Check Your E-Mail");
  }

//Get current User
   getDataOfCurrentUser() async {
     var data = await api.request("/Users/${_auth.currentUser!.uid}.json", "GET");
     if (data != []) {
       Users? user ;
         user=Users.fromJson(data);
       return user;
     }
   }

  Future<User?> thereIsUserForThisDevice() async {
    return await _auth.currentUser;
  }

  //signout
  void signOut() async {
    await _auth.signOut();
    await removeUserIdFromCach();
    Get.offAndToNamed(AppRoutes.StartScreen);
  }
}