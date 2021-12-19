import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/screens/HomeScreen/home_Controller.dart';
import 'package:mata3m/screens/HomeScreen/widget/home_cell.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/widgets/app_bar.dart';
import 'package:mata3m/widgets/loading_widget.dart';
import 'package:mata3m/widgets/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final arrOfLoc=[
    "It is located in the northern part of the country, ",
    "The Aswan Governorate borders Qena to the north, ",
     "It stretches across a section of the Nile River",
    "the northern part of the country in the Nile Delta",
    "It is situated in the center of the country",
    "is part of the Greater Cairo metropolitan area",
    " is an Egyptian governorate lying northeast of Cairo",
    "is located in the northeastern part of the country",
    "is located in the northeastern part of the country",
    "in the middle of the country",
    "It is located in the north of the country,",
    "is in the center of the country",
    "in the northeastern part of the country",
    " lies in the northern part of the country",
    " its separation from the Qena Governorate.",
    "Located in the north-western part of the country",
    " is one of the governorates of Upper Egypt",
    "is located in the northern part of the country in the Nile Delta",
    "is in the southwestern part of the country",
    "is located in the north-eastern part of the country",
    "in Lower Egypt",
    "in the southern part of the country",
    "Located between the Nile and the Red Sea in the southeast ",
    "Located in the northern part of the country",
    "located in the southern part of the country",
    "located in the east of the country",
    "is located in the north-eastern part of the country",
  ];
  final arrOfGov=[
    "Alexandria Governorate",
    "Aswan Governorate",
    "Asyut Governorate",
    "Beheira Governorate",
    "Beni Suef Governorate",
    "Cairo Governorate",
    "Dakahlia Governorate",
    "Damietta Governorate",
    "Faiyum Governorate",
    "Gharbia Governorate",
    "Giza Governorate",
   " Ismailia Governorate",
    "Kafr El Sheikh Governorate",
    "Luxor Governorate",
    "Matruh Governorate",
    "Minya Governorate",
    "Monufia Governorate",
    "New Valley Governorate",
    "North Sinai Governorate",
    "Port Said Governorate",
    "Qalyubia Governorate",
    "Qena Governorate",
    "Red Sea Governorate",
    "Sharqia Governorate",
    "Sohag Governorate",
    "South Sinai Governorate",
    "Suez Governorate",
  ];
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavBar(index: 0,),
      appBar: const AppBarWidget(color: kWhiteColor,hasBackButton: false,title: "Home",),
      backgroundColor: kDarkWhiteColor,
      body: GetBuilder<Home_controller>(
        init: Home_controller(),
        builder: (controller){
        return controller.loading? LoadingWidget():Center(
            child: ListView.builder(
              itemCount: controller.govList.length,
              itemBuilder:
                  (BuildContext context, int index) {
                return  Home_Cell(Title: controller.govList[index].gov!, subTitle: arrOfLoc[index],restraunts: controller.govList[index],);
              },
            ));},
      ) ,
    );
  }
}
