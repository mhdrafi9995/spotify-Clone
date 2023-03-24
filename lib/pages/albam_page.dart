import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spoty/colors.dart';
import 'package:spoty/pages/jsongs/songs.dart';
import 'package:spoty/pages/music_deteils_page.dart';

// import 'package:flutter/src/widgets/framework.dart';

class AlbamPage extends StatefulWidget {
  final dynamic song;
  const AlbamPage({super.key, this.song});

  @override
  State<AlbamPage> createState() => _AlbamPageState();
}

class _AlbamPageState extends State<AlbamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getbodynext(),
    );
  }

  Widget getbodynext() {
    List songAlbam = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          widget.song['img'],
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.song['title'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Text(
                          "Subcribe",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                // physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(songs.length - 5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            print(songs[index]);
                            Navigator.push(
                              context,
                              PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  child: MusicDteilsPage(
                                    title: songs[index]['title'],
                                    desription: songs[index]["description"],
                                    color: songs[index]["color"],
                                    img: songs[index]["img"],
                                    songUrl: songs[index]["song_url"],
                                  ),
                                  type: PageTransitionType.scale),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(songs[index]["img"]),
                                        fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                songs[index]['title'],
                                style: TextStyle(
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 180,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        songs[index]['song_count'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        songs[index]['date'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(songAlbam.length, (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: MusicDteilsPage(
                                title: widget.song[index]['title'],
                                desription: widget.song[index]["Desription"],
                                color: widget.song[index]["color"],
                                img: widget.song[index]["img"],
                                songUrl: widget.song[index]["song_url"],
                              ),
                              type: PageTransitionType.scale),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 280,
                            // height: 50,
                            child: Text(
                              '${index + 1} ' + songAlbam[index]['title'],
                              style: TextStyle(color: white),
                            ),
                            decoration: BoxDecoration(
                                // color: primary,
                                ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                // color: white,

                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // '${index + 1} ' +
                                  songAlbam[index]['duration'],
                                  style: TextStyle(color: grey, fontSize: 14),
                                ),
                                Container(
                                  width: 15,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.8)),
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
