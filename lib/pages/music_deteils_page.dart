import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:spoty/colors.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MusicDteilsPage extends StatefulWidget {
  final String title;
  final String desription;
  final Color color;
  final String img;
  final String songUrl;

  const MusicDteilsPage(
      {super.key,
      required this.title,
      required this.desription,
      required this.color,
      required this.img,
      required this.songUrl});

  @override
  State<MusicDteilsPage> createState() => _MusicDteilsPageState();
}

class _MusicDteilsPageState extends State<MusicDteilsPage> {
  double _cunrrentSliderValue = 20;
  // audio player here
  // AudioPlayer? advancedPlayer;
  // AudioCache? audioCache;

  // bool isplayer = true;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   intPlayer();
  // }

  // intPlayer() {
  //   advancedPlayer = new AudioPlayer();
  //   audioCache = new AudioCache(
  //     prefix: 'advancedPlayer',
  //   );
  // }

  // playsound(localpath) async {
  //   await audioCache!.clear(localpath);
  // }

  // stoSound() {}

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: widget.color,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: Offset(-10, 40))
                  ], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: size.width - 80,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.folder_open,
                  color: Colors.white,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        widget.desription,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Slider(
              activeColor: primary,
              min: 0,
              max: 200,
              value: _cunrrentSliderValue,
              onChanged: (value) {
                setState(() {
                  _cunrrentSliderValue = value;
                });
              }),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1:50",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
                Text(
                  "4:32",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shuffle,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_outlined,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    )),
                IconButton(
                    iconSize: 50,
                    onPressed: () {},
                    icon: Container(
                      decoration:
                          BoxDecoration(color: primary, shape: BoxShape.circle),
                      child: Icon(
                        Icons.stop,
                        color: Colors.white,
                      ),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.repeat,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.repeat,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.tv,
                color: primary,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "Chromecast is ready",
                  style: TextStyle(color: primary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
