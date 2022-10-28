import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/character_model.dart';

// https://rickandmortyapi.com/api/character

class RickyApiService {
/*
  Future<List<Articles>?> getTipoGet() async {
    Response response = await get('https://rickandmortyapi.com/api/character');
    Map data = jsonDecode(response.body);
    print(data);
  }
*/

  CharacterModel characterModel = CharacterModel();

  void getRickyCharacters() {
    var url = Uri.parse("https://rickandmortyapi.com/api/character");
    //print(url);
    http.get(url).then((response) {
      print("=== RESPUESTA DEL BODY =========================================");
      print(response.body);
      final List<dynamic> bodyDecoded = convert.jsonDecode(response.body);

      print(
          "=== DECODIFICANDO DEL BODY =========================================");
      print(bodyDecoded);
      final personajes = bodyDecoded.map((element) {
        try {
          return CharacterModel.fromJson(element);
        } catch (e) {
          return CharacterModel();
        }
      });
/*
      print("INSTANCIA");
      //print(paises);
      final List<Personajes> listPaises = personajes.toList();

      print("TO LIST");
      print(listPaises);

      for (var i = 0; i < listPaises.length; i++) {
        if (listPaises[i].name != null) {
          print(
              "Pais: ${listPaises[i].name} | Habitantes: ${listPaises[i].population}");
        }
      }
*/
    }).catchError((err) {
      print(err);
    });
  }
}
