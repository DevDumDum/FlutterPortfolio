import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

int pageStatus = 0;
bool scrollStatus = true;

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Home(),
//   ));
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List projectItems = [0.0];

  Map data = {};

  @override

  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: data['theme'][0]['mainBgColor'],//const Color.fromRGBO(18, 18, 18, 1)
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
        backgroundColor: data['theme'][0]['appbarColor'],
        elevation: 2,
        shadowColor: Color.fromRGBO(30,30,30,1),
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

                      Text(
                        "NAME",
                        style: TextStyle(
                          color: data['theme'][0]['fontColor'],
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
                        text: TextSpan(
                          children: [
                            const WidgetSpan(child: SizedBox(width: 40.0)),
                            TextSpan(
                              text: "An aspiring software developer with a Degree in Bachelor of Science in Computer Science at the Technological University of the Philippines Manila.",
                              style: TextStyle(
                                fontSize: 12,
                                color: data['theme'][0]['fontColor'],
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
                              children: <Widget> [
                                for(String myFact in data['facts'])
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Text(myFact, style: TextStyle(fontSize: 12, color: data['theme'][0]['fontColor'],))
                                ),
                              ]
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
                            color: data['theme'][0]['fontColor'][800],
                          ),
                        ),
                      ),
        
                      Text(
                        "SKILLS",
                        style: TextStyle(
                          color: data['theme'][0]['fontColor'],
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
                            for(int x = 0; x < data['iconSkills'].length-1;)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    for(int i = 0; i < 5 && x < data['iconSkills'].length-1; i++, x++)
                                    Container(
                                      margin: const EdgeInsets.only(right: 10, bottom: 5),
                                      child: SvgPicture.network("https://api.iconify.design/${data['iconSkills'][x]}",height: 40,),
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
                          for(String item in data['usingCurrent'] )
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
                            color: data['theme'][0]['fontColor'][800],
                          ),
                        ),
                      ),

                      Text(
                        "Featured Projects",
                        style: TextStyle(
                          color: data['theme'][0]['fontColor'],
                          fontSize: 17,
                          letterSpacing: 1.8,
                        ),
                      ),
        
                      const SizedBox(height: 10,),

                      

                      Column(
                        children: <Widget>[
                          for(int x = 0; x < data['projects'].length; x++, projectItems.add(0.0))
                          Card(
                            color: const Color.fromRGBO(0,0,0,0),
                            shadowColor: const Color.fromRGBO(0,0,0,0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
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
                                      data['projects'][x][0],
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
                                      setState((){ 
                                        for(int pIndex = 0; pIndex < projectItems.length; pIndex++){
                                          if(pIndex != x){
                                            projectItems[pIndex] = 0.0;
                                          }
                                        }
                                        projectItems[x] = projectItems[x] == 0 ? 1.0 : 0.0;
                                      });
                                    },
                                    child: SizedBox(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 230,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10),
                                              ),
                                              color: Color.fromRGBO(30,30,30,1),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                AnimatedOpacity(
                                                  opacity: projectItems[x] == 1.0 ? 0.3 : 1,
                                                  duration: const Duration(milliseconds: 200),
                                                  child: Image(image: AssetImage("assets/images/project${x+1}.jpg"),height: 210, fit: BoxFit.cover,)
                                                ),
                                              ],
                                            ),
                                          ),
                                          
                                          AnimatedOpacity(
                                            opacity: projectItems[x],
                                            duration: const Duration(milliseconds: 200),
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              height: 210,
                                              color: const Color.fromRGBO(15,15,15,.9),
                                              margin: const EdgeInsets.all(10),
                                              padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  // Text(
                                                  //   data['projects'][x][1],
                                                  //   style: const TextStyle(
                                                  //     fontSize: 13,
                                                  //     fontWeight: FontWeight.w500
                                                  //   ),
                                                  // ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: 
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Tools Used:",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              color: data['theme'][0]['fontColor'],
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                    
                                             
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        for(int icons in data['projects'][x][3])
                                                          Container(
                                                            margin: const EdgeInsets.only(right: 10, bottom: 5),
                                                            child: SvgPicture.network("https://api.iconify.design/${data['iconSkills'][icons]}",height: 40,),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                    
                                                  const Expanded(
                                                    flex: 1,
                                                    child: SizedBox(height: 50,)
                                                  ),
                                    
                                                  Expanded(
                                                    flex: 2,
                                                    child: Visibility(
                                                      visible: projectItems[x] == 1.0 ? true: false,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: (){
                                                              if(projectItems[x] == 1.0){
                                                                Navigator.pushNamed(context, './details', arguments: {
                                                                  'index': x,
                                                                  'project': data['projects'][x],
                                                                  'theme': data['theme'],
                                                                  'iconSkills': data['iconSkills']
                                                                });
                                                              }
                                                            }, 
                                                            child: const Text("View details...")
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          ),
                        ],
                      ),
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
          // setState(() {
          //   if(pageStatus != 1){
          //     pageStatus = 1;
          //     scrollStatus = false;
          //   } else {
          //     scrollStatus = true;
          //     pageStatus = 0;
          //   }
          //   debugPrint("current $pageStatus");
          // });
          Navigator.pushNamed(context, './contact', arguments: {
            'theme': data['theme'],
          });
        },
        tooltip: 'Just Click It!',
        backgroundColor: const Color.fromRGBO(10,10,10,1),
        child: const Icon(Icons.mail, size: 40),
      ),
    );
  }
}

