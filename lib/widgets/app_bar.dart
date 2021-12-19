import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/screens/FavoriteScreens/favorite-screen.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/utils/styles.dart';
import 'package:mata3m/utils/utils.dart';
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final title, hasBackButton, hasElevation, color,comeFromFavorite;
  final List<Widget>? actions;

  const AppBarWidget({
    Key? key,
    this.title,
    this.hasBackButton = true,
    this.hasElevation = true,
    this.actions,
    this.color = Colors.white, this.comeFromFavorite=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: hasElevation ? 1 : 0,
      centerTitle: true,
      backgroundColor: color==Colors.white?kWhiteColor:color,
      actions: actions,
      leading: hasBackButton
          ? IconButton(
              onPressed: () {
                comeFromFavorite?Get.to(FavoriteScreen()):Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kBlackColor,
              ),
            )
          : Container(),
      title: Text(
        title ?? "",
        style: extend(
            Styles.kTextStyleHeadline3, TextStyle(color: kBlackColor)),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
