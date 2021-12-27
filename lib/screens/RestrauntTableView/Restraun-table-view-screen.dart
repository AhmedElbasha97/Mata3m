import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/models/location_model.dart';
import 'package:mata3m/screens/RestrauntTableView/widget/Restraunt_Cell.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/utils/utils.dart';
import 'package:mata3m/widgets/app_bar.dart';
import 'package:mata3m/widgets/tab_bar.dart';

class RestrauntTableViewScreen extends StatefulWidget {
  const RestrauntTableViewScreen({Key? key, required this.restraunts}) : super(key: key);
  final Restraunts restraunts;
  @override
  _RestrauntTableViewScreen createState() => _RestrauntTableViewScreen();
}

class _RestrauntTableViewScreen extends State<RestrauntTableViewScreen> {
  final isGrid = false;
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavBar(index: 0,),
      appBar: const AppBarWidget(color: kWhiteColor,hasBackButton: true,title: "Restraunt",),
      backgroundColor: kDarkWhiteColor,
      body: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(widget.restraunts.image??"",width: double.infinity,height: Get.height*0.29,fit: BoxFit.fill,),

                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: Text(
                        widget.restraunts.gov??"",
                        textAlign: TextAlign.left,
                        style:extend(theme.textTheme.headline3??TextStyle(), const TextStyle(color: kWhiteColor)),
                      ),
                    ), ),
                ],
              ),
              Container(
                height: Get.height*0.5,
                child: ListView.builder(
                  itemCount: widget.restraunts.city!.length,
                  itemBuilder:
                      (BuildContext context, int index) {
                        return RestrauntCell(restraunt: widget.restraunts.city![index], ComingFromFav: false,);
                  },
                ),
              ),
            ],
          )) ,



    );
  }
}
