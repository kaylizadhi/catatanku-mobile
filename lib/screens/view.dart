import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/models/note_models.dart';
import 'package:test_app/screens/update.dart';

class ViewNote extends StatelessWidget {
  const ViewNote({Key? key, required this.data}) : super(key: key);
  final NoteModels data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Note Detail")),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListTile(
                  onTap: () {
                    print("Clicked on title");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  tileColor: cBackground,
                  title: Text('${data.fields!.title}',
                      style: TextStyle(
                        fontSize: 16,
                        color: cText,
                        fontWeight: FontWeight.bold,
                      )),
                  trailing: Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: cMain,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: cBackground,
                      iconSize: 18,
                      onPressed: () => {showAlertDialog(context)},
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Text(
                '${data.fields!.text}',
              ),
            ),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: cMain,
            ), onPressed: () async {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UpdateNote()));
          }, child: Text('Update'),),
          ],
        ));
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () => Navigator.pop(context),
    );
    Widget confirmDeleteButton = TextButton(
      child: Text("Delete"),
      onPressed: () async {
        String deleteUrl = 'http://127.0.0.1:8000/notes/delete-post';
        var url = Uri.parse(deleteUrl);
        final response =
            await http.post(url, body: json.encode({"pk": data.pk}));
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Delete Note"),
      content: Text("Are you sure you want to delete '${data.fields!.title}'?"),
      actions: [
        cancelButton,
        confirmDeleteButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
