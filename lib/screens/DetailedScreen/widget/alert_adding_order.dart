import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/screens/DetailedScreen/detailed_screen_controller.dart';
import 'package:mata3m/screens/DetailedScreen/widget/done_alert.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/widgets/button.dart';


class CustomDateDialogue extends StatelessWidget {
  final id;
  const CustomDateDialogue({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: GetBuilder(
        init:  DetailedScreenController(id),
        builder: (DetailedScreenController controller) => Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.33,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                    maxLines: 4,
                    textAlign: TextAlign.left,
                    decoration:   InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      fillColor: kPrimaryColor,
                      hintText: "order detail...",
                      errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(4)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder:  const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: kPrimaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder:  const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: kPrimaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    )),
              ),
              SizedBox(height: 10),
              RoundedCornerButton(borderRadius: 25.0,
                title: "place an order",

                hasBorder: true,
                height: 48,
                width: Get.width * 0.95,
                backgroundColor: kPrimaryColor,
                onPressed: () async {
                Get.back();
                showDialog(context: context,
                  builder: (context) =>
                      DoneDialogue(),
                );
                },
                textColor: kWhiteColor,)

            ],
          ),
        ),
      ),
    );
  }
}
