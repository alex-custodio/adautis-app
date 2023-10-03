import 'dart:convert';

import 'package:adautisapp/domain/profile.dart';
import 'package:http/http.dart' as http;

class PerfilDao {
  Future<List<Perfil>> getProfiles() async {
    final response = await http
        .get(Uri.parse('http://localhost:8001/api/general/profiles'), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*'
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return List<Perfil>.from(json.map((e) => Perfil.fromJson(e)));
    } else {
      throw Exception('Failed to load profiles');
    }
  }
}
