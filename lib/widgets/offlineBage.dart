import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/utils/services/app_routes.dart';

class Blank404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/404 Error Page not Found with people connecting a plug (2).gif'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: kDarkPrimaryColor),
              ),
            ),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  'Refresh',
                  style: TextStyle(fontSize: 18.0,color: Colors.white),
                ),
                onPressed: () {
                  Get.offAndToNamed(AppRoutes.initialRoute);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 3.0,
                  primary: kPrimaryColor,
                  onPrimary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}