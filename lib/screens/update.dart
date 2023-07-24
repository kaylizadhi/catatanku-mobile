import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_app/constants/colors.dart';
import 'package:http/http.dart';

class UpdateNote extends StatefulWidget {
  const UpdateNote({Key? key}) : super(key: key);

  @override
  _UpdateNoteState createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  String? title;
  String? text;
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Note"),
        backgroundColor: cMain,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextFormField(
              // initialValue: title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a title";
                }
                return null;
              },
              controller: titleController,
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
                hintText: "Enter a title",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextFormField(
              // initialValue: text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              controller: textController,
              maxLines: 20,
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Body",
                hintText: 'Write something...',
                alignLabelWithHint: true,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: cMain,
            ),
              onPressed: () async {
                String updateUrl = "http://127.0.0.1:8000/notes/put";
                var url = Uri.parse(updateUrl);
                final response = await http.put(url,
                  body: json.encode({
                    'title': title, 'text': text,
                  }));
                setState(() {
                });
                Navigator.pop(context);
              },
              child: Text("Update")),
        ],
      ),
    );
  }
}
