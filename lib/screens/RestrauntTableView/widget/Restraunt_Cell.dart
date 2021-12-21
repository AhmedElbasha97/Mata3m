import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mata3m/models/location_model.dart';
import 'package:mata3m/screens/DetailedScreen/detailled-screen.dart';

class RestrauntCell extends StatelessWidget {
  const RestrauntCell({Key? key, required this.restraunt, required this.ComingFromFav}) : super(key: key);
  final bool ComingFromFav;
 final City restraunt;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: (){ ComingFromFav?Get.off(DetailedScreen(Restraunt: restraunt, comeFromFavorite: ComingFromFav,)):Get.to(DetailedScreen(Restraunt: restraunt, comeFromFavorite: ComingFromFav,));},
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 7.0, horizontal: 16),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: Get.width*0.95,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.all(
                  Radius.circular(8) //                 <--- border radius here]8
              ),
            ),
            child: Flex(
                direction: Axis.horizontal,
                children: [
                  restraunt.images![0]==" "?
                        Image.asset("assets/icons/Component 7 – 1@3x.png",height: 290,width: Get.width*0.4,)
                   :ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        restraunt.images![0].removeAllWhitespace,
                        fit: BoxFit.fill,
                        width: 104,
                        height: 104,
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                        restraunt.name,
                        style: theme.textTheme.subtitle1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        restraunt.phoneNumber,
                        style: theme.textTheme.caption,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingBarIndicator(
                            rating: double.parse(restraunt.rate),
                            physics: const BouncingScrollPhysics(),
                            unratedColor: Colors.grey,
                            itemBuilder: (context, index) => Icon(
                              index < double.parse(restraunt.rate)? Icons.star : Icons.star_border,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            restraunt.rate,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.caption,
                          ),
                        ],
                      ),
                          const SizedBox(
                            height: 8,
                          ),

                        ],
                      ),
                    ),
                  ),
                ]),
          ),

        ]),
      ),
    );
  }
}
