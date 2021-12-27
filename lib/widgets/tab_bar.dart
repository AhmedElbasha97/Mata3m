import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata3m/utils/colors.dart';
import 'package:mata3m/utils/services/app_routes.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, required this.index})
      : super(key: key);
 final index;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10),),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
        ],
      ),
      child: ClipRRect(

        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhiteColor,
          unselectedItemColor: kBlackColor,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:widget.index == 0 ?Image.asset("assets/icons/selectedLoc.png",height: 40,width: 40):
              Image.asset("assets/icons/unselectedloc.png",height: 40,width: 40),
              label: 'Locations',
            ),
            BottomNavigationBarItem(
              icon:widget.index == 1 ?Image.asset("assets/icons/Selectedfav.png",height: 40,width: 40):
              Image.asset("assets/icons/UnSelectedfav.png",height: 40,width: 40),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon:widget.index == 2 ?Image.asset("assets/icons/Selectedprofile.png",height: 40,width: 40):
              Image.asset("assets/icons/UnSelectedprofile.png",height: 40,width: 40,),
              label: 'Profile',
            ),

          ],
          currentIndex: widget.index,
          selectedItemColor: kPrimaryColor,
          onTap: _onItemTapped,

        ),
      ),
    );
  }


  void _onItemTapped(int selectedIndex) {
    switch(selectedIndex){
      case 0:
        {
          Get.offAndToNamed(
              AppRoutes.homeScreen
          );
        }
        break;
      case 1:
        {
          Get.offAndToNamed(
              AppRoutes.favScreen
          );
        }
        break;
      case 2:
        {
          Get.offAndToNamed(
              AppRoutes.profScreen
          );

        }
        break;
    }
  }
}
