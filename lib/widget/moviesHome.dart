import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/modelview/viewHome.dart';
import 'package:apptvshow/screen/tvShow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class MoviesHome extends StatefulWidget {
  const MoviesHome({super.key});

  @override
  State<MoviesHome> createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  ViewHome viewHome = Get.put(ViewHome());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewHome>(
      init: ViewHome(),
      builder: (count) {
        return count.movieshome.isEmpty
            ? Text("Loading...",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            : ListView.builder(
            itemCount: count.movieshome.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final chid = count.movieshome[i].channelId;
              final chName = count.movieshome[i].channelName;
              final chImage = //"$UrlApp$upload"
                  "${count.movieshome[i].channelImage}";
              final chUrl = count.movieshome[i].channelUrl;
              final chDesc = count.movieshome[i].channelDescription;
              final chType = count.movieshome[i].channelType;
              final chVideoid = count.movieshome[i].videoId;
              final ctagName = count.movieshome[i].categoryName;
              final chUseragent = count.movieshome[i].userAgent;
              const web = detail;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TvShow(
                            chid: chid,
                            ch_desc: chDesc,
                            ch_image: chImage,
                            ch_name: chName,
                            ch_type: chType,
                            chUrl: chUrl,
                            ch_videoid: chVideoid,
                            ch_useragent: chUseragent,
                            ctag_name: ctagName,
                            web: web)
                        )
                    );
                  },
                  child: SizedBox(
                    width: 130,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: count.movieshome.isEmpty
                                    ? imagesloding

                                    : //"$UrlApp$upload"
                                "${count.movieshome[i].channelImage}",
                                height: 90,
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
                              right: 90,
                              top: 50,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorApp.bgHome),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                    ),
                                  ),
                            ),
                          ]
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}