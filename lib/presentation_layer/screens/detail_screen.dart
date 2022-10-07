import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constans/styles/fonst.dart';
import '../../constans/styles/styles.dart';
import '../../data_layer/models/models.dart';

class DetalScreen extends StatelessWidget {
  final Models models;

  const DetalScreen({Key? key, required this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.4,
                  imageUrl:
                      'https://image.tmdb.org/t/p/original${models.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210),
                  child: Center(
                    child: Column(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.play_circle_outline_outlined,
                            size: 75,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          models.originalTitle!.toUpperCase(),
                          style: movieTitle,
                          overflow: TextOverflow.clip,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'overview'.toUpperCase(),
                        style: bodyStyle.copyWith(color: darkHeaderClr),
                      ),
                      Container(
                        height: 40,
                        child: Text(
                          models.overview!,
                          style: bodyStyle.copyWith(
                              fontSize: 16, letterSpacing: 0),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'release date'.toUpperCase(),
                                style: subBodyStyle.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                models.releaseDate!.toUpperCase(),
                                style: subBodyStyle.copyWith(
                                    color: Colors.yellow[800]),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'originalLanguage'.toUpperCase(),
                                style: subBodyStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                models.originalLanguage!.toUpperCase(),
                                style: subBodyStyle.copyWith(
                                    color: Colors.yellow[800]),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'voteAverage'.toUpperCase(),
                                style: subBodyStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_purple500_sharp,
                                    color: yellow,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    models.voteAverage!.toUpperCase(),
                                    style: subBodyStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
