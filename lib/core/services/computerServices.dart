import 'dart:convert';

import 'package:engineering_guru/common/utils/utils.dart';
import 'package:engineering_guru/core/models/computer_QAModel.dart';
import 'package:http/http.dart' as http;

class MCQServices {
  Future<List<ComputerMCQModel>> getmcq() async {
    const apiUrl =
        "https://engineering-backend-git-main-aashish-lamsals-projects.vercel.app/computer";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);
      print(response.statusCode);

      httpErrorHAndler(response: response, onSuscess: () {});
    } catch (error) {
      throw Exception(error.toString());
    }
    final response = await http.get(Uri.parse(apiUrl));
    final List data = json.decode(response.body);
    print(data);
    return data.map((e) => ComputerMCQModel.fromJson(e)).toList();
  }
}
