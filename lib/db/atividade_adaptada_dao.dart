import 'dart:convert';
import 'package:adautisapp/domain/atividade_adaptada.dart';
import 'package:http/http.dart' as http;

class AtividadeAdaptadaDao {
  Future<List<AtividadeAdaptada>> getActivities() async {
    final response = await http.get(
        Uri.parse('http://localhost:8001/api/general/activities'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*'
        });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return List<AtividadeAdaptada>.from(
          json.map((e) => AtividadeAdaptada.fromJson(e)));
    } else {
      throw Exception('Failed to load adapted activities');
    }
  }
}
