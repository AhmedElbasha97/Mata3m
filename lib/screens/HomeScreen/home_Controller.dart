import 'package:get/get.dart';
import 'package:mata3m/Services/restraunt_services.dart';
import 'package:mata3m/models/location_model.dart';

class Home_controller extends GetxController{
  var loading = false;
  List<Restraunts> govList = <Restraunts>[];
  @override
  void onInit() {
    fetchGovernments();
    super.onInit();
  }
  void fetchGovernments() async {
    loading = true;
    var govs = await RestrauntService.getRestrauntsData();
    govList = govs ?? [];
    loading = false;
    update();


  }

}