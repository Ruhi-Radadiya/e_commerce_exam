import 'package:flutter/material.dart';

Widget adList({
  required BuildContext context,
  required TextScaler textScaler,
  required String image,
  required String text1,
  required String text2,
  required String text3,
}) {
  double h = MediaQuery.sizeOf(context).height;
  double w = MediaQuery.sizeOf(context).width;
  return Center(
    child: Container(
      margin: EdgeInsets.only(right: 12),
      height: h * 0.24,
      width: w * 0.91,
      decoration: BoxDecoration(
        color: Colors.orangeAccent.shade100,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          scale: 2,
          alignment: Alignment.bottomRight,
          image: AssetImage(image),
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                text2,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: textScaler.scale(17),
                    fontWeight: FontWeight.w700),
              ),
              Text(
                text3,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: textScaler.scale(17),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                height: h * 0.05,
                width: w * 0.3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Shop now",
                  style: TextStyle(
                      fontSize: textScaler.scale(15),
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

List<Map> adData = [
  {
    'image': "assets/image/OIP-removebg-preview.png",
    'text1': "BUY 1 GET 1!",
    'text2': "Buy 1 Get 1",
    'text3': "Free!",
  },
  {
    'image': "assets/image/OIP-removebg-preview.png",
    'text1': "NEW!",
    'text2': "See Our New",
    'text3': "Collection!",
  },
  {
    'image': "assets/image/OIP-removebg-preview.png",
    'text1': "DISCOUNT!",
    'text2': "Get a Big Offer",
    'text3': "On Your Order!",
  },
];
