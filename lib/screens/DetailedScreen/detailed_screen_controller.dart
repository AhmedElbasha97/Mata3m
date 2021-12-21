import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mata3m/Services/favorite_services.dart';
import 'package:mata3m/models/location_model.dart';

class DetailedScreenController extends GetxController {
  final favoriteServices fav = new favoriteServices();
  final id;
  var notDetect = false;
  var loaded ;
  DetailedScreenController(this.id);
  Future<void> onInit() async {
    detectAddedToFavorite(id);
    super.onInit();
  }
  addToFavorite(City restrunt){
    print("elmat3am ${restrunt}");
    fav.addRestrauntToFavorite(restrunt);
    detectAddedToFavorite(restrunt.id);
  }

  detectAddedToFavorite(restrauntId) async {
    var detect = await fav.detectRestrauntsAddToFavorite(restrauntId);
    print(detect);
    if( detect != null){
      notDetect = false;
    }else{
      notDetect=true;
    };
    update();
  }

  removeFromId(restrauntId) async {
   await fav.removeRestrauntFromFavorite(restrauntId);
    detectAddedToFavorite(restrauntId);
  }
}