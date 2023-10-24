import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool loadStatus = true;
  bool dataStatus = false;
  late Response response;
  late Map data;
  //late String imageBanner;

  List<String> facts = [
    "🌱 I’m currently learning flutter",
    "🔭 I’m currently working on a mini mobile game",
    "⚡ Fun fact: I also love cycling 👀",
  ];

  List<String> iconSkills = [
    'skill-icons:html.svg','skill-icons:css.svg','skill-icons:javascript.svg','skill-icons:mysql-dark.svg','skill-icons:php-dark.svg',
    'skill-icons:c.svg','skill-icons:cpp.svg','skill-icons:python-dark.svg','skill-icons:react-dark.svg','skill-icons:flutter-dark.svg',
    'skill-icons:git.svg','skill-icons:arduino.svg','skill-icons:raspberrypi-dark.svg','vscode-icons/file-type-vue.svg',
  ];

  List<String> usingCurrent = [
    'flutter-dark.svg','github-dark.svg',
  ];

  List projects = [
    ['Hide-Seek','The ‘Hide and Seek’ is a survival horror game. It focuses on the survival of the character throughout the game. Its also objective is attempting to scare the player using scary ambience and graphics. In addition, this game is controlled by a single-player, which means that the game is designed to be played by a one person at a time','https://github.com/MakuAren/Hide-Seek',[5]],
    ['MemoryGame','A simple card flipping game where players search for the correct paired card by flipping one at a time. Players compete for the time and numbers of moves in completing the game.','https://github.com/MakuAren/MemoryGame',[13,1,2]]
  ];

  void getData() async {
    // Future.delayed(const Duration(seconds: 2), (){
    //   debugPrint("HELLLOOOOOOOO");
    // });
    response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    data = jsonDecode(response.body);
    dataStatus = true;

    while(loadStatus){
      await Future.delayed(const Duration(seconds: 2), (){
        cardKey.currentState?.toggleCard();
      });

      if(dataStatus){
        loadStatus = false;
        debugPrint("Done");
      }
    }

    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/home', 
      arguments: {
        'facts': facts,
        'iconSkills': iconSkills,
        'usingCurrent':usingCurrent,
        'projects': projects
    });
  }
  
  @override
  
  void initState(){
    super.initState();
    getData();
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20,20,20,0.5),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: FlipCard(
          key: cardKey,
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.FRONT,
          front: const Image(
              image: AssetImage('assets/images/logo.png'),
              height: 70,
            ),
          back: const Image(
            image: AssetImage('assets/images/logo.png'),
            height: 70,
          ),
        ),
      ),
    );
  }
}