import 'dart:convert';
import 'package:http/http.dart';

class AgifyService{

  const AgifyService();
  static const String endpoint = 'https://api.agify.io';

  Future<int> getAge(String name) async{
    Response response = await get(Uri.parse(endpoint).replace(queryParameters: {
      "name": name,
    }));
    if (response.statusCode == 200){
      return jsonDecode(response.body)['age'];
    }
    throw Exception('Error getting the age');
  }

}