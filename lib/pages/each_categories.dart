import 'package:flutter/material.dart';

class EachCategory extends StatelessWidget {
  final String imageUrl;
  final String categoryText;
  const EachCategory(
      {super.key, required this.imageUrl, required this.categoryText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20.0)),
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              categoryText,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
