import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

int pageStatus = 0;
bool scrollStatus = true;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> facts = [
    "🌱 I’m currently learning flutter",
    "🔭 I’m currently working on a mini mobile game",
    "⚡ Fun fact: I also love cycling 👀",
  ];

  List<String> iconSkills = [
    'html.svg','css.svg','javascript.svg','mysql-dark.svg','php-dark.svg',
    'c.svg','cpp.svg','python-dark.svg','react-dark.svg','flutter-dark.svg',
    'git.svg','arduino.svg','raspberrypi-dark.svg',
  ];

  List<String> usingCurrent = [
    'flutter-dark.svg','github-dark.svg',
  ];

  bool project1 = false;

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 25,
            ),
            const FractionalTranslation(
              translation: Offset(0.0, 0.3),
              child: Align(
                alignment: FractionalOffset(0.5, 0.0),
                child: Text(
                  " AKU",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  )
                ),
              ),
            ),
          ]
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          physics: scrollStatus?  const AlwaysScrollableScrollPhysics(): const NeverScrollableScrollPhysics(), //Disable or Enable body scroll
          primary: true,
          scrollDirection: Axis.vertical,

          // Header or Image profile and banner section ===========================

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 70.0),
                color: const Color.fromRGBO(50,50,50,.5),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      const Image(
                        image: NetworkImage("https://w.wallhaven.cc/full/p2/wallhaven-p2gp33.jpg"), //This image is not mine. This image is used for sample banner purposes only
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      FractionalTranslation(
                        translation: const Offset(0.0, 0.5),
                        child: Align(
                          alignment: const FractionalOffset(0.5, 0.0),
                          child: SizedBox(
                            height: 180,
                            width: 180,
                            child: Material(
                              borderRadius: BorderRadius.circular(90),
                              elevation: 5,
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("assets/images/pf.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),

              //Body Content Section ===========================

              Container(
                padding: const EdgeInsets.fromLTRB(25, 5, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Divider(
                        indent : 10,
                        endIndent : 10,
                        thickness: 1.5,
                        height: 30.0,
                        color: Colors.grey[800],
                      ),

                      //Introduction Section ===========================

                      const Text(
                        "NAME",
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 1.8,
                        ),
                      ),
              
                      Text(
                        "Mark Allen Cabutaje",
                        style: TextStyle(
                          color: Colors.amber[200],
                          letterSpacing: 1.8,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      
                      const SizedBox(height: 10,),
                      
                      RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                          children: [
                            WidgetSpan(child: SizedBox(width: 40.0)),
                            TextSpan(
                              text: "An aspiring software developer with a Degree in Bachelor of Science in Computer Science at the Technological University of the Philippines Manila.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ]
                        ),
                      ),

                      // Extra Facts section ===========================

                      Card(
                        margin: const EdgeInsets.only(top: 10),
                        color: const Color.fromRGBO(0,0,0,0),
                        shadowColor: const Color.fromRGBO(0,0,0,0),
                        child: Material(
                          color: const Color.fromRGBO(30,30,30,1),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: facts.map((myFact) =>
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Text(myFact, style: const TextStyle(fontSize: 12, color: Colors.grey,))
                                )
                              ).toList(),
                            ),
                          ),
                        ),
                      ),

                      // Skills section ===========================

                      FractionalTranslation(
                        translation: const Offset(0.0, 0.8),
                        child: Align(
                          alignment: const FractionalOffset(0.5, 0.0),
                          child: Divider(
                            indent : 70,
                            endIndent : 10,
                            thickness: 1.5,
                            height: 30.0,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
        
                      const Text(
                        "SKILLS",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          letterSpacing: 1.8,
                        ),
                      ),
        
                      const SizedBox(height: 10,),
        
                      Text(
                        "Languages and tools I've worked with:",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.amber[100],
                        ),
                      ),
        
                      const SizedBox(height: 10,),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: 
                        <Widget>[
                            for(int x = 0; x < iconSkills.length;)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    for(int i = 0; i < 5 && x < iconSkills.length; i++, x++)
                                    Container(
                                      margin: const EdgeInsets.only(right: 10, bottom: 5),
                                      child: SvgPicture.network("https://api.iconify.design/skill-icons:${iconSkills[x]}",height: 40,),
                                    ),
                                  ]
                                )
                        ],
                      ),
        
                      const SizedBox(height: 30,),

                      Text(
                        "Currently Using",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.amber[100],
                        ),
                      ),
        
                      const SizedBox(height: 10,),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          for(String item in usingCurrent )
                            Container(
                              margin: const EdgeInsets.only(right: 10, bottom: 5),
                              child: SvgPicture.network("https://api.iconify.design/skill-icons/$item",height: 40,)
                            ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      // Featured projects section ===========================

                      FractionalTranslation(
                        translation: const Offset(0.0, 0.8),
                        child: Align(
                          alignment: const FractionalOffset(0.5, 0.0),
                          child: Divider(
                            indent : 170,
                            endIndent : 10,
                            thickness: 1.5,
                            height: 30.0,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),

                      const Text(
                        "Featured Projects",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          letterSpacing: 1.8,
                        ),
                      ),
        
                      const SizedBox(height: 10,),

                      Card(
                        color: const Color.fromRGBO(0,0,0,0),
                        shadowColor: const Color.fromRGBO(0,0,0,0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  ),
                                  color: Color.fromRGBO(30,30,30,1),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Hide-Seek",
                                  style: TextStyle(
                                    color: Colors.amber[200],
                                    letterSpacing: 1.8,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                              ) ,
                              ),

                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    if(project1 == false)
                                      project1 = true;
                                    else
                                      project1 = false;
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromRGBO(30,30,30,1),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Image(image: AssetImage("assets/images/h&s.jpg"))
                                ),
                              ),
                              
                              Visibility(
                                visible: project1,
                                child: FractionalTranslation(
                                  translation: const Offset(0.0, -1),
                                  child: Align(
                                    alignment: const FractionalOffset(0.5, 0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(right: 10, bottom: 5),
                                          child: SvgPicture.network("https://api.iconify.design/skill-icons:${iconSkills[5]}",height: 40,),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              )
                            ]
                          ),
                        ),
                      )

                    ],
                  )
              ),
            ]
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: () {
          setState(() {
            if(pageStatus != 1){
              pageStatus = 1;
              scrollStatus = false;
            } else {
              scrollStatus = true;
              pageStatus = 0;
            }
            debugPrint("current $pageStatus");
          });
        },
        tooltip: 'Just Click It!',
        backgroundColor: const Color.fromRGBO(20,20,20,0.5),
        child: const Icon(Icons.mail, size: 40),
      ),
    );
  }
}

