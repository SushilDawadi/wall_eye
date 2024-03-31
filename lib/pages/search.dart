import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wall_eye_app/main.dart';
import 'package:wall_eye_app/models/photo_model.dart';
import 'package:wall_eye_app/pages/headline.dart';
import 'package:http/http.dart' as http;
import 'package:wall_eye_app/widgets/widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotoModel> photos = [];
  TextEditingController searchController = TextEditingController();
  bool search = false;
  getSearchWallpaper(String searchQuery) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"),
        headers: {
          "Authorization":
              "ssJqbRE1BMukahPLPrzuuZNpYerHiALcTbvt2bm5TBuup0KLjChECo4r"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //for each photo object an instance of photo model is created
        PhotoModel photosModel = PhotoModel();
        photosModel = PhotoModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {
        search = true;
      }); //so that it can add one after another map in our photos model
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Headline(headline: 'Search'),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(3),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xffececf8),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        getSearchWallpaper(searchController.text);
                      },
                      child: search
                          ? GestureDetector(
                              onTap: () {
                                photos = [];
                                search = false;
                                searchController.clear();
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            )
                          : const Icon(
                              Icons.search_outlined,
                              color: Colors.grey,
                            ),
                    )),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(child: wallpaper(photos, context))
        ],
      ),
    );
  }
}
