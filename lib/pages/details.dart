import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  Map data = {};
  @override

  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    // print(data['project'][2]);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          data['project'][0]
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(data['project'][1]),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Link(
                target: LinkTarget.self,
                uri: Uri.parse(data['project'][2]),
                builder:(context, followLink) => ElevatedButton(
                  onPressed: followLink,
                  child: const Text('Go to Project...'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}