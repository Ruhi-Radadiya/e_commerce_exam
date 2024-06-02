import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';

import '../utills/list.dart';
import '../utills/routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> pdc =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.home_page);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Detail Page",
                        style: TextStyle(
                            fontSize: textScaler.scale(20),
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Expanded(
                    child: Image.network(
                      pdc['image'],
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: h * 0.45,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, -4),
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Title : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: textScaler.scale(20),
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              pdc['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: textScaler.scale(22),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(
                          "Description : ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: textScaler.scale(20),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(
                          pdc['description'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: textScaler.scale(12),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Ink(
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              if (!cartList.contains(pdc)) {
                                cartList.add(pdc);
                              }
                            },
                            child: Container(
                              height: h * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              padding: EdgeInsets.only(left: 16, right: 16),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    size: textScaler.scale(20),
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      fontSize: textScaler.scale(17),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Price : ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: textScaler.scale(18),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    pdc['price'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: textScaler.scale(21),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
