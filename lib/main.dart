import 'package:flutter/material.dart';


class UserTheme {
  Color bgColor =  const Color.fromARGB(255, 22, 24, 22);
  Color fontColor = const Color.fromRGBO(230,230,230,1);
  FontWeight fontWeight = FontWeight.w500;
  double fontSize = 18.0;
  double letterSpacing = 1.5;
  String fontFamily = 'IndieFlower';
}

int pageStatus = 0;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {
    // UserTheme uTheme = UserTheme();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 60.0),
                color: const Color.fromRGBO(50,50,50,.5),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      const Expanded(
                        child: Image(
                          image: NetworkImage("https://w.wallhaven.cc/full/p2/wallhaven-p2gp33.jpg"),
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: FractionalTranslation(
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
                      ),
                    ],
                  )
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 5, 30, 0),
                // child: Center(
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
                      const Text(
                        "NAME",
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 1.8,
                        ),
                      ),
      
                      Text(
                        "Mark Allen",
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


                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Material(
                          color: const Color.fromRGBO(30,30,30,1),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "🌱 I’m currently learning flutter",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                                
                                SizedBox(height: 2,),
                                                
                                Text(
                                  "🔭 I’m currently working on a mini mobile game",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                                
                                SizedBox(height: 2,),
                                                
                                Text(
                                  "⚡ Fun fact: I also love cycling 👀",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ElevatedButton.icon(
                      //   onPressed: (){debugPrint("INFO Pressed");},
                      //   icon: const Icon(Icons.info),
                      //   label: const Text('info')
                      // ),
                    ],
                  )
                // ),
              ),
            ),
          ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: () {
          debugPrint("PRESSED $pageStatus");
          pageStatus = 1;
          debugPrint("current $pageStatus");
        },
        tooltip: 'Just Click It!',
        backgroundColor: const Color.fromRGBO(20,20,20,0.5),
        child: const Icon(Icons.mail, size: 40),
      ),
    );
  }
}