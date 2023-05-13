import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/screens/DetailedScreen/detailed_screen_controller.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/widgets/button.dart';

import '../../../utils/utils.dart';


class DoneDialogue extends StatelessWidget {

  const DoneDialogue({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height*0.4,
              width: Get.width*0.8,
              child: Image.asset("assets/images/Honesty-rafiki.png",fit: BoxFit.fitWidth,),
            ), const SizedBox(height: 10),
             Text("Order has been send successfully",
              style:   extend(theme.textTheme.headline5 ??
                 TextStyle(), const TextStyle(color: kBlackColor,)),textAlign: TextAlign.center,),
            const SizedBox(height: 10),
            RoundedCornerButton(borderRadius: 25.0,
              title: "done",

              hasBorder: true,
              height: 48,
              width: Get.width * 0.95,
              backgroundColor: kPrimaryColor,
              onPressed: () async {
                Get.back();
              },
              textColor: kWhiteColor,)

          ],
        ),
      ),
    );
  }
}
