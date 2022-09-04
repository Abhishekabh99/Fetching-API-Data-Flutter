import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mm1/models/model2.dart';
import 'package:mm1/models/models.dart';

class ModelsService {
  static Future<List<Model>> getAll() async {
    List<Model>? models;
    var url = Uri.parse('https://bharatmobility.in/api/models');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List datas = jsonDecode(response.body);
      models = datas.map((p) => Model.fromJson(p)).toList();
    }
    print(models);
    return models!;
  }

  static Future<Model2?> getAll2() async {
    Model2? models2;
    var url = Uri.parse('https://bharatmobility.in/api/models/1');
    var response2 = await http.get(url);
    if (response2.statusCode == 200) {
      var datas2 = jsonDecode(response2.body);
      models2 = Model2.fromJson(datas2);
    }

    return models2;
  }
}
