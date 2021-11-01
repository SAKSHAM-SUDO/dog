import 'dart:convert';
import 'package:flutter/material.dart';
import 'image_list.dart';
import 'image_model.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page',),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    late ImageModel images ;

    @override
  void initState() {
     fetchImage();
  }

  void fetchImage() async{
  final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    final imageModel = ImageModel.fromJson(jsonDecode(response.body));
    setState(() {
      images = (imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: () {fetchImage();},
        tooltip: 'Next',
        child: const Icon(Icons.add_task_sharp),
      ),
    );
  }
}

