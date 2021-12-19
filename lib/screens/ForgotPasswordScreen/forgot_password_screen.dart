
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mata3m/screens/ForgotPasswordScreen/forgot_password_controller.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/utils/translation_key.dart';
import 'package:mata3m/utils/utils.dart';
import 'package:mata3m/widgets/app_bar.dart';
import 'package:mata3m/widgets/custom_elevated_button.dart';
import 'package:mata3m/widgets/input_field_text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: kDarkWhiteColor,
        appBar:  AppBarWidget(hasElevation: false,color: kDarkWhiteColor,),
        body: GetBuilder<ForgotPasswordController>(
            init: ForgotPasswordController(),
            builder: (controller) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Forget Password",
                            style: extend(theme.textTheme.headline2 ?? TextStyle(),TextStyle(color: kOnSaleColor)),
                          ),
                          SizedBox(height: 87.h),
                          const Text(
                              "Please, enter your email address. You will receive a link to create a new password via email."),
                          SizedBox(height: 18.h),
                          CustomInputfield(
                            onchange: controller.onUpdate,
                            labelText: "Email",
                            controller: controller.emailController,
                            validator: controller.validateEmail,
                            validated: controller.emailValidated,
                            icon: (controller.emailValidated)
                                ? (controller.emailState)
                                    ? const Icon(Icons.check_rounded,
                                        color: kSuccessColor)
                                    : const Icon(
                                        Icons.close_outlined,
                                        color: kErrorColor,
                                      )
                                : null,
                          ),
                          SizedBox(height: 53.h),
                          Center(
                            child: CustomElevatedButton(
                              background: kPrimaryColor,
                                width: 343,
                                height: 48,
                                onPressed: () {
                                  controller.forgetPassword(context);
                                },
                                text: "SEND"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
