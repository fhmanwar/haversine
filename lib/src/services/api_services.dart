import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gostore_flutter/src/models/Citys.dart';
import 'package:gostore_flutter/src/models/Stores.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String url = "http://192.168.0.2/gostoreadmin/api.php";

  static Future<List<Stores>> getListStore() async {
    try {
      final response = await http.get('$url?allstore');
      if (response.statusCode == 200) {
        List<Stores> list = parseStore(response.body);
        // print(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Stores> parseStore(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Stores>((json) => Stores.fromJson(json)).toList();
  }

  static Future<List<Citys>> getListCity() async {
    try {
      final response = await http.get('$url?city');
      if (response.statusCode == 200) {
        List<Citys> list = parseCity(response.body);
        // print(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Citys> parseCity(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Citys>((json) => Citys.fromJson(json)).toList();
  }
}
