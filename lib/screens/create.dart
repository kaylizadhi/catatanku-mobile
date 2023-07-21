import 'package:flutter/material.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/constants/urls.dart';
import 'package:http/http.dart';

class CreateNote extends StatefulWidget {
  final Client client;
  const CreateNote({Key? key, required this.client}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: cMain,
            ),
              onPressed: () {
                widget.client.post(createUrl);
                Navigator.pop(context);
              },
              child: Text("Create")),
        ],
      ),
    );
  }
}
