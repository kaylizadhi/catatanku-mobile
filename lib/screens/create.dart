import 'package:flutter/material.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/constants/urls.dart';
import 'package:http/http.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  String? title = "";
  String? text = "";
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
        backgroundColor: cMain,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a title";
                }
                return null;
              },
              controller: controller,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              controller: controller,
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
              onPressed: () {
                // POST URL
                Navigator.pop(context);
              },
              child: Text("Create")),
        ],
      ),
    );
  }
}
