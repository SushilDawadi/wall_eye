// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List wallpaperImage = [
    'lib/images/wallpaper1.jpg',
    'lib/images/wallpaper2.jpg',
    'lib/images/wallpaper3.jpg'
    //for indicator active
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'lib/images/boy.jpg',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 80.0),
                Text(
                  "WallEye",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            //to show images
            CarouselSlider.builder(
              itemCount: wallpaperImage.length,
              itemBuilder: (context, index, realIndex) {
                final res = wallpaperImage[index];
                return buildImage(res, index);
              },
              options: CarouselOptions(
                autoPlay: true,
                height: MediaQuery.of(context).size.height / 1.5,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      activeIndex = index;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //for indicator
            Center(child: buildIndicator()),
          ],
        ),
      ),
    );
  }

  //widget to show page indicator
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: wallpaperImage.length,
        effect: SlideEffect(
          dotHeight: 15,
          dotWidth: 15,
          activeDotColor: Colors.blue,
        ),
      );

  //widget to show images
  Widget buildImage(String urlImage, int index) => SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}
