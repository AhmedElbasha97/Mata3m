import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/models/location_model.dart';
import 'package:mata3m/screens/RestrauntTableView/Restraun-table-view-screen.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/utils/utils.dart';

class Home_Cell extends StatelessWidget {
  const Home_Cell({Key? key, required this.Title, required this.subTitle, required this.restraunts}) : super(key: key);
  final String Title;
  final String subTitle;
  final Restraunts restraunts;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: (){

        Get.to(RestrauntTableViewScreen(restraunts: restraunts,));

      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0,0.0),
            height: 65,
            width: double.infinity,
            decoration:  BoxDecoration(
              border:  Border(
                bottom: BorderSide(width: 1.0, color: kGrayColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 10,),
                    Text(Title,style: theme.textTheme.subtitle1,),
                    const SizedBox(height: 10,),
                    Text(subTitle,style: extend(theme.textTheme.caption ?? const TextStyle(), TextStyle(color: kGrayColor))),
                  ],
                ),
                Icon(Icons.arrow_forward_ios,color: kGrayColor,size: 15.0,)
              ],
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
