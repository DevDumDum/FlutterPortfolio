import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    // print(data['project'][5]);
    final List<String> imgList = data['project'][5];
    // Video load
    final vidController = YoutubePlayerController.fromVideoId(
      videoId: data['project'][4],
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    // Carousel image widget
    final List<Widget> imageSliders = imgList.map((item) => Container(
      margin: const EdgeInsets.all(2.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ],
          )),
    )).toList();

    return Scaffold(
      backgroundColor: data['theme'][0]['mainBgColor'],
      appBar: AppBar(
        backgroundColor: data['theme'][0]['appbarColor'],
        title: const Text('Project Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                margin: const EdgeInsets.only(left:20, top: 5),
                child: Text(
                  data['project'][0],
                  style: TextStyle(
                    color: Colors.amber[200],
                    letterSpacing: 1.8,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              // Image Carousel
              Container(
                padding: const EdgeInsets.fromLTRB(10,20,10,0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeFactor: 0.4,
                  ),
                  items: imageSliders,
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(25, 0, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    FractionalTranslation(
                      translation: const Offset(0.0, 0.8),
                      child: Align(
                        alignment: const FractionalOffset(0.5, 0.0),
                        child: Divider(
                          indent : 110,
                          endIndent : 10,
                          thickness: 1.5,
                          height: 30.0,
                          color: data['theme'][0]['fontColor'][800],
                        ),
                      ),
                    ),
      
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.amber[200],
                        fontSize: 17,
                        letterSpacing: 1.8,
                      ),
                    ),
      
                    const SizedBox(height: 10,),

                    Text(
                      data['project'][1],
                      style: TextStyle(
                        color: data['theme'][0]['fontColor'],
                      ),
                    ),

                    const SizedBox(height: 20,),

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
                            children: [
                              Text(
                                "Tools used:",
                                style: TextStyle(
                                  color: Colors.amber[200],
                                ),
                              ),

                              const SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  for(int icons in data['project'][3])
                                    Container(
                                      margin: const EdgeInsets.only(right: 10, bottom: 5),
                                      child: SvgPicture.network("https://api.iconify.design/${data['iconSkills'][icons]}",height: 40,),
                                    )
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ),

                    //========== Display Video if exist
                    Container(
                      child: <Widget>(){
                        if(data['project'][4] != ''){
                          return 
                          
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FractionalTranslation(
                                translation: const Offset(0.0, 0.8),
                                child: Align(
                                  alignment: const FractionalOffset(0.5, 0.0),
                                  child: Divider(
                                    indent : 60,
                                    endIndent : 10,
                                    thickness: 1.5,
                                    height: 30.0,
                                    color: data['theme'][0]['fontColor'][800],
                                  ),
                                ),
                              ),
                
                              Text(
                                "DEMO",
                                style: TextStyle(
                                  color: Colors.amber[200],
                                  fontSize: 17,
                                  letterSpacing: 1.8,
                                ),
                              ),
                
                              const SizedBox(height: 10,),

                              Container( margin: const EdgeInsets.all(10),child: YoutubePlayer(controller: vidController,aspectRatio: 16 / 9,)),
                            ],
                          );
                        }
                      }()
                    ),
              
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 30),
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
            ],
          ),
        ),
      ),
    );
  }
}