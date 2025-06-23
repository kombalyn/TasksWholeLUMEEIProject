import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/constant.dart';


import 'package:apptvshow/modelview/model_suggested.dart';

import 'package:apptvshow/sqldb/db.dart';
import 'package:apptvshow/sqldb/dbModelView.dart';

import 'package:apptvshow/videoplayer/playerYoutube.dart';
import 'package:apptvshow/widget/lumeeiAppbar.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


bool lisner = false;
bool start = false;
bool setapp = false;
bool player = false;
bool root = false;

class TvShow extends StatefulWidget {
  const TvShow(
      {super.key,
      this.chid,
      this.ch_name,
      this.ch_image,
      this.chUrl,
      this.ch_desc,
      this.ch_type,
      this.ch_videoid,
      this.ctag_name,
      this.web,
      this.ch_useragent,
      this.series,
      this.catid});

  final chid;
  final catid;
  final ch_name;
  final ch_image;
  final chUrl;
  final ch_desc;
  final ch_type;
  final ch_videoid;
  final web;
  final ctag_name;
  final ch_useragent;
  final series;

  @override
  State<TvShow> createState() => _TvShowState();
}

class _TvShowState extends State<TvShow> {
  SqlDb sqlDb = SqlDb();
  ModelSuggested modelSuggested = Get.put(ModelSuggested());
  DBModelView dbModelView = Get.put(DBModelView());
  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LumeeiAppbar(),
        backgroundColor: ColorApp.bgHome,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: widget.ch_image,
                        height: 250,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Image.asset("images/tv.png"),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubePlayer(
                              videoUrl: widget.ch_videoid,
                            )));
                          },
                          child: const Icon(
                            Icons.play_circle_outline_sharp,
                            color: Colors.white70,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.ch_name,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                  widget.ctag_name,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text("12 282 megtekintés",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:ColorApp.bgHome,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.white,
                                  )
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:
                                  [
                                    Text("Like",
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                  ]
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:ColorApp.bgHome,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.white,
                                  )
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:
                                  [
                                    Text("Mentés",
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.bookmark,
                                      color: Colors.white,
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:ColorApp.bgHome,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.white,
                                  )
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:
                                  [
                                    Text("Megosztás",
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),),
                                    const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            widget.ch_desc,
                            maxLines: 20,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  height: 1.5,
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                        ),
                      ),
                    ),
                    widget.series != true
                        ?  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Következő lecke",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          )
                      ),
                    )
                        : const Text(""),
                    widget.series != true
                        ? suggested(modelSuggested: modelSuggested, widget: widget)
                        : suggested2(modelSuggested: modelSuggested, widget: widget)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class suggested extends StatelessWidget {
  const suggested({
    super.key,
    required this.modelSuggested,
    required this.widget,
  });

  final ModelSuggested modelSuggested;
  final TvShow widget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: modelSuggested.suggestedApp(widget.web, widget.chid),
      builder: (context, snapshot) => SizedBox(
        height: 270,
        width: double.infinity,
        child: ListView.builder(
            itemCount: modelSuggested.movieshome.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final chUrl = modelSuggested.movieshome[i].channelUrl;
              final userAgent1 = modelSuggested.movieshome[i].userAgent;
              final chtype = modelSuggested.movieshome[i].channelType;
              final videoId = modelSuggested.movieshome[i].videoId;

              return InkWell(
                  onTap: () {
                    Get.to(YouTubePlayer(
                      videoUrl: videoId,
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      // color: Colors.yellow,
                      width: 150,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CachedNetworkImage(
                                  imageUrl: modelSuggested.movieshome.isEmpty
                                      ? imagesloding
                                      : //"$UrlApp$upload"
                                          "${modelSuggested.movieshome[i].channelImage}",
                                  height: 200,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                        // colorFilter:
                                        //     ColorFilter.mode(Colors.red, BlendMode.darken),
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                    child: Image.asset("images/tv.png"),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Colors.red),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      modelSuggested.movieshome.isEmpty
                                          ? "a"
                                          : "${modelSuggested.movieshome[i].categoryName}",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.yellowAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 5,
                                child: Image.asset(
                                  "images/go3.png",
                                  height: 30,
                                  width: 30,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                modelSuggested.movieshome.isEmpty
                                    ? "a"
                                    : "${modelSuggested.movieshome[i].channelName}",
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              );
            }),
      ),
    );
  }
}

class suggested2 extends StatelessWidget {
  const suggested2({
    super.key,
    required this.modelSuggested,
    required this.widget,
  });

  final ModelSuggested modelSuggested;
  final TvShow widget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: modelSuggested.suggestedApp(widget.web, widget.chid),
      builder: (context, snapshot) => SizedBox(
        height: 270,
        width: double.infinity,
        child: ListView.builder(
            itemCount: modelSuggested.movieshome.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final chUrl = modelSuggested.movieshome[i].channelUrl;
              final userAgent1 = modelSuggested.movieshome[i].userAgent;
              final chtype = modelSuggested.movieshome[i].channelType;
              final videoId = modelSuggested.movieshome[i].videoId;

              return InkWell(
                  onTap: () {
                      Get.to(YouTubePlayer(
                        videoUrl: videoId,
                      ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      // color: Colors.yellow,
                      width: 150,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CachedNetworkImage(
                                  imageUrl: modelSuggested.movieshome.isEmpty
                                      ? imagesloding
                                      : //"$UrlApp$upload"
                                          "${modelSuggested.movieshome[i].channelImage}",
                                  height: 200,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                        // colorFilter:
                                        //     ColorFilter.mode(Colors.red, BlendMode.darken),
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                    child: Image.asset("images/tv.png"),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Colors.red),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      modelSuggested.movieshome.isEmpty
                                          ? "a"
                                          : "${modelSuggested.movieshome[i].categoryName}",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.yellowAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 5,
                                child: Image.asset(
                                  "images/go3.png",
                                  height: 30,
                                  width: 30,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                modelSuggested.movieshome.isEmpty
                                    ? ""
                                    : "${modelSuggested.movieshome[i].channelName}",
                                maxLines: 1,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              );
            }),
      ),
    );
  }
}
