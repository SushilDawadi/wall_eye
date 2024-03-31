import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wall_eye_app/pages/each_categories.dart';
import 'package:wall_eye_app/pages/headline.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Headline(headline: "Categories"),
            SizedBox(height: 20.0),
            EachCategory(imageUrl: 'lib/images/food.jpg', categoryText: "Food"),
            SizedBox(height: 20.0),
            EachCategory(
                imageUrl: 'lib/images/wildlife.jpg', categoryText: "Wildlife"),
            SizedBox(height: 20.0),
            EachCategory(imageUrl: 'lib/images/car.jpg', categoryText: "Car"),
            SizedBox(height: 20.0),
            EachCategory(
                imageUrl: 'lib/images/wallpaper1.jpg', categoryText: "Nature"),
          ],
        ),
      ),
    );
  }
}
