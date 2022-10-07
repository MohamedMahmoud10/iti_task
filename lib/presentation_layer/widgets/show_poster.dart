import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_db_iti_task/data_layer/models/models.dart';

import '../../constans/strings/strings.dart';

class ShowPoster extends StatelessWidget {
  final Models models;

  const ShowPoster({Key? key, required this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, detailScreen, arguments: models),
        child: GridTile(
          child: Hero(
            tag: models.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/original${models.posterPath}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
