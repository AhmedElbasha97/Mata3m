
import 'package:mata3m/models/location_model.dart';
import 'package:mata3m/utils/services/api_service.dart';

class RestrauntService {
  static ApiService api = ApiService();
  static Future<List<Restraunts>?> getRestrauntsData() async {
    var data = await api.request("/governments.json", "GET");
    if (data != null) {
      List<Restraunts> citys = [];
      print(data);
      data.forEach((element) {
        citys.add(Restraunts.fromJson(element));
      });
      return citys;
    }

  }
}