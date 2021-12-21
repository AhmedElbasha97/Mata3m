import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mata3m/models/location_model.dart';
import 'package:mata3m/screens/RestrauntTableView/widget/Restraunt_Cell.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/utils/utils.dart';
import 'package:mata3m/widgets/app_bar.dart';
import 'package:mata3m/widgets/loading_widget.dart';
import 'package:mata3m/widgets/tab_bar.dart';
import 'favorite_screen_controller.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  final favoriteScreenController cont =favoriteScreenController();

  @override
  final isGrid = false;

  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return GetBuilder<favoriteScreenController>(
        init: favoriteScreenController(),

        builder: (controller) {
      return Scaffold(

        bottomNavigationBar: BottomNavBar(index: 1,),
        appBar: const AppBarWidget(
          color: kWhiteColor, hasBackButton: false, title: "Favorite",),
        backgroundColor: kDarkWhiteColor,
        body: controller.loaded? LoadingWidget():controller.noDataToShow?Center(
            child: Container(

              height: Get.height * 0.3,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                      child: Text("there's no Data to show",
                        textAlign: TextAlign.center,
                        style: extend(
                            theme.textTheme.headline3 ??
                                TextStyle(),
                            TextStyle(
                                color: kPrimaryColor)),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                    ),
                    Image.asset(
                      "assets/icons/Component 7 – 1@3x.png",
                      height: 290, width: Get.width * 0.4,),
                  ]),)):Center(
            child: ListView.builder(
              itemCount: controller.favs.length,
              itemBuilder:
                  (BuildContext context, int index) {
                return RestrauntCell(restraunt: City(id: controller.ids[index], phoneNumber: controller.favs[index].tel, rate: controller.favs[index].rate, name: controller.favs[index].name, location: controller.favs[index].locations, description: controller.favs[index].description,menu: controller.favs[index].menu,images: controller.favs[index].images), ComingFromFav: true,);
              },
            )),


      );
    });
  }
}
