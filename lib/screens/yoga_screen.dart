import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'motivation.dart';

class YogaScreen extends StatefulWidget {
  static const route = "/YogaScreen";
  YogaScreenState createState() => YogaScreenState();
}

class YogaScreenState extends State<YogaScreen> {
  YogaScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yoga Videos"),
          backgroundColor: Colors.green,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 300.0),
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.west,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Motivation.route);
            },
          ),
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('yogavideos').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map(
                (doc) {
                  var url1 = doc['url'];

                  YoutubePlayerController _controller1 =
                      YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(url1),
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                      disableDragSeek: false,
                      loop: false,
                      isLive: false,
                      forceHD: false,
                    ),
                  );
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 5,
                            ),
                          ),
                          YoutubePlayer(
                            controller: _controller1,
                            liveUIColor: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          },
        ));
  }
}
