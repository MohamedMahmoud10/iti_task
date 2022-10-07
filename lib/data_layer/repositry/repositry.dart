import 'package:movie_app_db_iti_task/data_layer/api_services/api_servcies.dart';
import 'package:movie_app_db_iti_task/data_layer/models/models.dart';

class Repositry {
  final ApiServices apiServices;

  Repositry(this.apiServices);

  Future fetchData() async {
    final modelsData = await apiServices.fetchData();
    final mapingData =
        modelsData.map<Models>((data) => Models.fromJson(data)).toList();
    return mapingData;
  }
}
