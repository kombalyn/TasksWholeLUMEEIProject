// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_declarations, file_names

import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/constant.dart';
import 'package:apptvshow/modelview/movies_ModelDeitels.dart';
import 'package:apptvshow/screen/tvShow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DEteilsCatagry2 extends StatefulWidget {
  const DEteilsCatagry2({super.key, this.cid, this.name});
  final cid;
  final name;

  @override
  State<DEteilsCatagry2> createState() => _DEteilsCatagryState();
}

class _DEteilsCatagryState extends State<DEteilsCatagry2> {
  MoviesModelCat moviesModelCat = Get.put(MoviesModelCat());

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
              future: moviesModelCat.getcatindextv(widget.cid),
              builder: (context, snapshot) => GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                      mainAxisExtent: 200
                      ),
                  itemCount: moviesModelCat.catindex2.length,
                  itemBuilder: (context, i) {
                    final chid = moviesModelCat.catindex2[i].channelId;
                    final ch_name = moviesModelCat.catindex2[i].channelName;
                    final ch_image = "$UrlApp$upload"
                        "${moviesModelCat.catindex2[i].channelImage}";
                    final chUrl = moviesModelCat.catindex2[i].channelUrl;
                    final ch_desc =
                        moviesModelCat.catindex2[i].channelDescription;
                    final ch_type = moviesModelCat.catindex2[i].channelType;
                    final ch_videoid = moviesModelCat.catindex2[i].videoId;
                    final ctag_name = moviesModelCat.catindex2[i].categoryName;
                    final ch_useragent = moviesModelCat.catindex2[i].userAgent;
                    final web = detail;

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
                                    imageUrl: moviesModelCat.catindex2.isEmpty
                                        ? imagesloding
                                        : "$UrlApp$upload"
                                            "${moviesModelCat.catindex2[i].channelImage}",
                                    height: 150,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
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
                                "${moviesModelCat.catindex2[i].channelName}",
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

