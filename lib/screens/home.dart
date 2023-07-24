import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/models/fetch_note.dart';
import 'package:test_app/models/note_models.dart';
import 'package:test_app/screens/create.dart';
import 'package:test_app/screens/view.dart';
import 'package:test_app/widgets/note_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FetchNote notes = FetchNote();
  List<NoteModels> data = [];
  String query = "";

  @override
  void initState() {
    getNote();

    super.initState();
  }

  Future getNote() async {
    final result = await notes.getNote(query);

    setState(() {
      data = result;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: cMain, centerTitle: true, title: Text('Catatanku')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${data[index].fields!.title}', style: (TextStyle(fontWeight: FontWeight.bold)),
            ),
            onTap: () async {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewNote(data: data[index])));
          },
            );
          },
        ),
      // body: Container(
      //   margin: EdgeInsets.only(bottom: 20),
      //   child: ListTile(
      //     onTap: () {
      //       print("Clicked on note");
      //     },
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //     tileColor: cBackground,
      //     title: Text('${data.fields!.title}',
      //         style: TextStyle(
      //           fontSize: 16,
      //           color: cText,
      //           fontWeight: FontWeight.bold,
      //         )),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: cMain,
          foregroundColor: cBackground,
          splashColor: cGreen,
          elevation: 12,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreateNote()));
          },
          child: const Icon(Icons.add)),
    );
  }
}

  




// Widget searchBar() {
//   return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//           color: cBackground, borderRadius: BorderRadius.circular(20)),
//       child: TextField(
//           decoration: InputDecoration(
//         contentPadding: EdgeInsets.all(0),
//         prefixIcon: Icon(
//           Icons.search,
//           color: cText,
//           size: 20,
//         ),
//         prefixIconConstraints: BoxConstraints(
//           maxHeight: 25,
//           minWidth: 25,
//         ),
//         border: InputBorder.none,
//         hintText: 'Search',
//         hintStyle: TextStyle(color: cText),
//       )));
// }
