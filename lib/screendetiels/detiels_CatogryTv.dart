// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_declarations, file_names

import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/constant.dart';

import 'package:apptvshow/modelview/tvModelDeietils.dart';
import 'package:apptvshow/screen/tvShow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DEteilsCatagry extends StatefulWidget {
  const DEteilsCatagry({super.key, this.cid, this.name});
  final cid;
  final name;

  @override
  State<DEteilsCatagry> createState() => _DEteilsCatagryState();
}

class _DEteilsCatagryState extends State<DEteilsCatagry> {
  TvModerDeitles tvModerDeitles = Get.put(TvModerDeitles());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.name}",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      backgroundColor: ColorApp.bgHome,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: tvModerDeitles.getcatindextv(widget.cid),
              builder: (context, snapshot) => GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5, //  المسافه بينهم
                      mainAxisSpacing: 8, //  المسافه بينهم
                      childAspectRatio: 1,
                      mainAxisExtent: 200 //  المسافه بينهم
                      ),
                  itemCount: tvModerDeitles.catindex.length,
                  itemBuilder: (context, i) {
                    final chid = tvModerDeitles.catindex[i].channelId;
                    final ch_name = tvModerDeitles.catindex[i].channelName;
                    final ch_image = "$UrlApp$upload"
                        "${tvModerDeitles.catindex[i].channelImage}";
                    final chUrl = tvModerDeitles.catindex[i].channelUrl;
                    final ch_desc =
                        tvModerDeitles.catindex[i].channelDescription;
                    final ch_type = tvModerDeitles.catindex[i].channelType;
                    final ch_videoid = tvModerDeitles.catindex[i].videoId;
                    final ctag_name = tvModerDeitles.catindex[i].categoryName;
                    final ch_useragent = tvModerDeitles.catindex[i].userAgent;
                    final web = detail2;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (() {
                          Get.to(TvShow(
                              chid: chid,
                              ch_desc: ch_desc,
                              ch_image: ch_image,
                              ch_name: ch_name,
                              ch_type: ch_type,
                              chUrl: chUrl,
                              ch_videoid: ch_videoid,
                              ch_useragent: ch_useragent,
                              ctag_name: ctag_name,
                              web: web));
                        }),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            // color: Colors.yellowAccent,
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: tvModerDeitles.catindex.isEmpty
                                        ? imagesloding
                                        : "$UrlApp$upload"
                                            "${tvModerDeitles.catindex[i].channelImage}",
                                    height: 150,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          // colorFilter: const ColorFilter.mode(
                                          //     Colors.deepPurple,
                                          //     BlendMode.colorBurn),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        Image.asset("images/tv.png"),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "${tvModerDeitles.catindex[i].channelName}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Cairo'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

