import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/note.dart';
import 'service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // late String data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Note> notes = [];

  void updateNotes() {
    Service.get('notes').then((response) {
      final data = response.body;
      return data;
    }).then((data) {
      final jsonData = jsonDecode(data) as List<dynamic>;
      setState(() {
        notes.clear();
        for (var element in jsonData) {
          notes.add(Note.fromJson(element as Map<String, dynamic>));
        }
      });
    });
  }

  @override
  void initState() {
    updateNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(notes[index].title),
              subtitle: Text(notes[index].content),
            );
          },
          itemCount: notes.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => updateNotes(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
