import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flip_card/flip_card.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}


class _ContactState extends State<Contact> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool pageStatus = true;
  Map data = {};
  
  void animatedPic() async{
    while(pageStatus){
      await Future.delayed(const Duration(seconds: 1), (){
        cardKey.currentState?.toggleCard();
      });
    }
  }

  @override
  void initState(){
    super.initState();
    animatedPic();
  }
  
  @override
  void dispose() {
    pageStatus = false;
    debugPrint("Back To Home Screen");
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: data['theme'][0]['mainBgColor'],
      appBar: AppBar(
        backgroundColor: data['theme'][0]['appbarColor'],
        title: const Text('Contact'),
        centerTitle: true,
        elevation: 2,
        shadowColor: Color.fromRGBO(30,30,30,1),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
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
                    back: const Icon(Icons.mail, size: 80, color: Colors.white,),
                  ),
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    Text(
                      "Cellphone Number:",
                      style: TextStyle(
                        color: data['theme'][0]['fontColor'],
                        letterSpacing: 1,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 2,),

                Row(
                  children: [
                    Text(
                      "0916-XXX-XX94",
                      style: TextStyle(
                        color: Colors.amber[200],
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      "Email address:",
                      style: TextStyle(
                        color: data['theme'][0]['fontColor'],
                        letterSpacing: 1,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2,),
                Row(
                  children: [
                    Text(
                      "markxxxxxxxxxxxxx00@gmail.com",
                      style: TextStyle(
                        color: Colors.amber[200],
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Card(
                  margin: const EdgeInsets.only(top: 10),
                  color: const Color.fromRGBO(0,0,0,0),
                  shadowColor: const Color.fromRGBO(0,0,0,0),
                  child: Material(
                    color: const Color.fromRGBO(30,30,30,1),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15,5,15,5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Other Socials:",
                                style: TextStyle(
                                  color: data['theme'][0]['fontColor'],
                                  letterSpacing: 1,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Link(
                                target: LinkTarget.self,
                                uri: Uri.parse('https://github.com/MakuAren'),
                                builder:(context, followLink) => TextButton(
                                  onPressed: followLink,
                                  child: SvgPicture.network('https://api.iconify.design/openmoji/github.svg', height: 55,),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Link(
                                target: LinkTarget.self,
                                uri: Uri.parse('https://www.linkedin.com/'),
                                builder:(context, followLink) => TextButton(
                                  onPressed: followLink,
                                  child: SvgPicture.network('https://api.iconify.design/skill-icons/linkedin.svg', height: 45,),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Link(
                                target: LinkTarget.self,
                                uri: Uri.parse('https://youtube.com/@dumdumcoding?si=iGBIE8iVFkq0I1bb'),
                                builder:(context, followLink) => TextButton(
                                  onPressed: followLink,
                                  child: SvgPicture.network('https://api.iconify.design/openmoji/youtube.svg', height: 65,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        )
      )
    );
  }
}