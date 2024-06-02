import 'package:ecommerce_app/utills/list.dart';
import 'package:ecommerce_app/utills/routes.dart';
import 'package:flutter/material.dart';

Widget myProducts(
    {required TextScaler textScaler,
    required Function() setState,
    required BuildContext context,
    required String category}) {
  double h = MediaQuery.sizeOf(context).height;
  double w = MediaQuery.sizeOf(context).width;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    child: Row(
      children: [
        ...myData.map(
          (e) => (e['category'] == category)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.detail_page,
                        arguments: e,
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: h * 0.25,
                                  width: w * 0.45,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(e['image']),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Text(
                                  e['title'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: textScaler.scale(18),
                                      color: Colors.grey.shade700),
                                ),
                                Text(
                                  e['price'].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: textScaler.scale(22),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    ),
  );
}
