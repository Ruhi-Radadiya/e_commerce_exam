import 'package:ecommerce_app/utills/ads.dart';
import 'package:flutter/material.dart';

import '../utills/category.dart';
import '../utills/category2.dart';
import '../utills/list.dart';
import '../utills/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (!category.contains("All")) {
      category.insert(0, "All");
    }
  }

  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: textScaler.scale(25),
                    ),
                    Text(
                      "New York",
                      style: TextStyle(
                          fontSize: textScaler.scale(17),
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: textScaler.scale(25),
                      color: Colors.grey,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.cart_page);
                      },
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        size: textScaler.scale(25),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Category",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: textScaler.scale(24),
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: textScaler.scale(12),
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...category.map(
                        (e) => myCategory(
                          categories: e,
                          textScaler: textScaler,
                          setState: () {
                            setState(() {});
                          },
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h * 0.05,
                      width: w * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: textScaler.scale(20),
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: textScaler.scale(18),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: w * 0.06,
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(
                        Icons.qr_code,
                        size: textScaler.scale(18),
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hot Sales",
                      style: TextStyle(
                          fontSize: textScaler.scale(20),
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: textScaler.scale(12),
                          fontWeight: FontWeight.w600,
                          color: Colors.orangeAccent),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...adData.map(
                        (e) => adList(
                          context: context,
                          textScaler: textScaler,
                          image: e['image'],
                          text1: e['text1'],
                          text2: e['text2'],
                          text3: e['text3'],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Seller",
                      style: TextStyle(
                          fontSize: textScaler.scale(20),
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: w * 0.3,
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: textScaler.scale(12),
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                if (cat == 'All') ...[
                  Column(
                    children: [
                      ...category.map(
                        (e) => myProducts(
                          textScaler: textScaler,
                          setState: () {
                            setState(() {});
                          },
                          context: context,
                          category: e,
                        ),
                      ),
                    ],
                  )
                ] else ...[
                  myProducts(
                    textScaler: textScaler,
                    setState: () {
                      setState(() {});
                    },
                    context: context,
                    category: cat,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
