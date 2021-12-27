import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mata3m/models/fav_model.dart';
import 'package:mata3m/models/location_model.dart';
import 'package:mata3m/utils/services/api_service.dart';
import 'package:mata3m/utils/services/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favoriteServices{
  final ref = FirebaseDatabase.instance.reference().child("Favorite");
  static ApiService api = ApiService();
  List<String> ids=[];

  getUserIdFromCach() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = await prefs.getString('userid');
    return stringValue;
  }

   checkIfThereIsFavoritesToTHisUser() async {
     var connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.none) {
       Get.offAllNamed(AppRoutes.initialRoute);
     }
     final user = await getUserIdFromCach();
     var data = await ref.child(user).once();
     return data.value;
   }

  Future<void> addRestrauntToFavorite(City restraunt) async {
    final user = await getUserIdFromCach();
    ref.child(user).child(restraunt.id).set({
      'Name':restraunt.name,
      'Rate':restraunt.rate,
      'tel':restraunt.phoneNumber,
      'images':restraunt.images,
      'menu':restraunt.menu,
      'locations':restraunt.location,
      'description':restraunt.description
    });
  }

  removeRestrauntFromFavorite(restrauntId) async {
    final user = await getUserIdFromCach();
    ref.child(user).child(restrauntId).remove();
  }

  detectRestrauntsAddToFavorite(restrauntId) async {
    final user = await getUserIdFromCach();
    var data = await ref.child(user).child(restrauntId).once();
   return data.value;
  }

   getFavoriteIDArray(){
    return ids;
   }

   setFavoriteIdsInArray(String IDs){
    ids.add(IDs);
   }

   getFavoriteData() async {
     var userId = await getUserIdFromCach();
     var data = await api.request("/Favorite/${userId}.json", "GET");
     if (data != []) {
       List<Favorite> favs = [];
       data.keys.forEach((element) {
         setFavoriteIdsInArray(element);
       });
       data.values.forEach((element) {
         favs.add(Favorite.fromJson(element));
       });
       return favs;
     }
   }
   }
