import 'dart:convert';
import 'package:http/http.dart' as http;
import 'note_models.dart';

class FetchNote {
  var data = [];
  List<NoteModels> result = [];

  String fetchUrl = '127.0.0.1:8000/notes/json';

  Future<List<NoteModels>> getNote(String query) async {
    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        result = data.map((e) => NoteModels.fromJson(e)).toList();
      } else {
        print("API error");
      }
    } on Exception catch (e) {
      print("Error: $e");
    }
    return result;
  }
}
