
import 'package:get/get.dart';
import 'package:mata3m/screens/FavoriteScreens/favorite-screen.dart';
import 'package:mata3m/screens/HomeScreen/home_screen.dart';
import 'package:mata3m/screens/ProfileScreen/profile-screen.dart';
import 'package:mata3m/screens/StartScreen/StartScreen.dart';
import 'package:mata3m/screens/intro/introScreen.dart';
import 'package:mata3m/widgets/offlineBage.dart';



mixin AppRoutes {
  static String initialRoute = "/intro";
  static String notConnected = "/widgets";
  static String homeScreen = "/HomeScreen";
  static String StartScreen = "/StartScreen";
  static String favScreen = "/FavoriteScreens";
  static String profScreen = "/ProfileScreen";


  static List<GetPage> routes = [
    // GetPage(name: initialRoute, page: () => PersonalInformationScreen()),
    GetPage(name: initialRoute, page: () => Intro()),
    GetPage(name: notConnected, page: () => Blank404()),
    GetPage(name: StartScreen, page: () => startScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: favScreen, page: () => FavoriteScreen()),
    GetPage(name: profScreen, page: () => ProfileScreen()),


  ];
}
