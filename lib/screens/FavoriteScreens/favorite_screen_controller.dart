import 'package:get/get.dart';
import 'package:mata3m/Services/favorite_services.dart';
import 'package:mata3m/models/fav_model.dart';

class favoriteScreenController extends GetxController{

  final favoriteServices fav = new favoriteServices();
  var loading = false;
  var noDataToShow = false;
  List<Favorite> favs= [];
  List<String> ids= [];
  @override
  Future<void> onInit() async {
    checkIfUserHaveFavoritesOrNot();
    super.onInit();
  }

  checkIfUserHaveFavoritesOrNot() async {
    var check = await fav.checkIfThereIsFavoritesToTHisUser();
    if(check!=null){
      getDataForFavoriteTable();
    }else{
      loading = false;
      noDataToShow = true;
      update();
    }
  }

  getDataForFavoriteTable() async {
    noDataToShow = false;
    loading = true;
   favs =  await fav.getFavoriteData();
   print(favs);
   ids = fav.getFavoriteIDArray();
   print(ids);
    loading = false;
    update();
  }

}