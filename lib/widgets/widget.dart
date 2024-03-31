import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wall_eye_app/models/photo_model.dart';

Widget wallpaper(List<PhotoModel> listPhotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(6.0),
    child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      childAspectRatio: 0.6,
      children: listPhotos.map((PhotoModel photosModel) {
        return GridTile(
            child: Hero(
          tag: photosModel.src!.portrait!,
          child: Container(
            child: CachedNetworkImage(
              imageUrl: photosModel.src!.portrait!,
              fit: BoxFit.cover,
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
