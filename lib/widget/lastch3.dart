// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/constant.dart';
import 'package:apptvshow/screen/tvShow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../modelview/viewHome3.dart';

// ignore: must_be_immutable
class LastCh3 extends StatelessWidget {
  ViewHome3 viewHome = Get.put(ViewHome3());

  LastCh3({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewHome3>(
        init: ViewHome3(),
        builder: (count) {
          return count.lastch.isEmpty
          ? Text("Loading...",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14,
            ),
          )
          : ListView.builder(
              itemCount: count.lastch.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                final chid = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].channelId;
                final ch_name = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].channelName;
                final ch_image = count.lastch.isEmpty
                    ? imagesloding
                    :  "${viewHome.lastch[i].channelImage}";
                final chUrl = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].channelUrl;
                final ch_desc = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].channelDescription;
                final ch_type = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].channelType;
                final ch_videoid = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].videoId;
                final ctag_name = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].categoryName;
                final ch_useragent = count.lastch.isEmpty
                    ? imagesloding
                    : count.lastch[i].userAgent;
                // ignore: prefer_const_declarations
                final web = detail2;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        TvShow(
                          chid: chid,
                          ch_desc: ch_desc,
                          ch_image: ch_image,
                          ch_name: ch_name,
                          ch_type: ch_type,
                          chUrl: chUrl,
                          ch_videoid: ch_videoid,
                          ch_useragent: ch_useragent,
                          ctag_name: ctag_name,
                          web: web,
                        ),
                      );
                    },
                    child: Container(
                      // color: Colors.yellow,
                      width: 130,

                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: count.lastch.isEmpty
                                      ? imagesloding
                                      : //"$UrlApp$upload"
                                          "${count.lastch[i].channelImage}",
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
