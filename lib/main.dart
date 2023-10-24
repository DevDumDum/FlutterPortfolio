import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/details.dart';
import 'package:myapp/pages/loading.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '.',
    routes: {
      '.':(context) => const Loading(),
      './home': (context) => const Home(),
      './location': (context) =>  const Project(),
    },
  ));
}