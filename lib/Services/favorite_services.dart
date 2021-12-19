import 'package:firebase_database/firebase_database.dart';
import 'package:mata3m/models/fav_model.dart';
import 'package:mata3m/models/location_model.dart';
import 'package:mata3m/utils/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favoriteServices{
  final ref = FirebaseDatabase.instance.reference().child("Favorite");
  static ApiService api = ApiService();
  List<String> ids=[];
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = await prefs.getString('userid');
    return stringValue;
  }
   checkIfThereIsFavoritesToTHisUser() async {
     final user = await getStringValuesSF();
     var data = await ref.child(user).once();
     return data.value;
   }
  Future<void> addToFavorite(City restraunt) async {
    final user = await getStringValuesSF();
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

  removeFromFavorite(restrauntId) async {
    final user = await getStringValuesSF();
    ref.child(user).child(restrauntId).remove();
  }

  detectRestrauntsAddToFavorite(restrauntId) async {
    final user = await getStringValuesSF();
    var data = await ref.child(user).child(restrauntId).once();
   return data.value;
  }
   getFavoriteID(){
    return ids;
   }

   setFavoriteID(String IDs){
    ids.add(IDs);
   }

   getFavoriteData() async {
     var userId = await getStringValuesSF();
     var data = await api.request("/Favorite/${userId}.json", "GET");

     if (data != []) {
       List<Favorite> favs = [];
       var i = 0;
       print(data.keys);
       data.keys.forEach((element) {
         print("${i}${element}");
         setFavoriteID(element);
       });
       data.values.forEach((element) {
         print("${i}${element}");
         favs.add(Favorite.fromJson(element));
         i++;
       });
       return favs;
     }
   }
   }
