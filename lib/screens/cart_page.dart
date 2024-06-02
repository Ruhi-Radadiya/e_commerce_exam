import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../utills/list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
              fontSize: textScaler.scale(18), fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.grey.shade400,
        centerTitle: true,
      ),
      body: (cartList.isNotEmpty)
          ? Stack(
              children: [
                Column(children: [
                  ...cartList.map(
                    (e) => Slidable(
                      endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              // delete logic
                              cartList.remove(e);
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(12),
                            backgroundColor: const Color(0xfff5d7d9),
                            foregroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                          SizedBox(
                            width: h * 0.01,
                          ),
                        ],
                      ),
                      child: Container(
                        height: h * 0.2,
                        width: w,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Row(children: [
                          Container(
                            height: h * 0.19,
                            width: w * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(e['image']),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['title'],
                                      style: TextStyle(
                                          fontSize: textScaler.scale(18),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(children: [
                                      Text(
                                        e['price'],
                                        style: TextStyle(
                                          fontSize: textScaler.scale(20),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                  ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                ]),
              ],
            )
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: textScaler.scale(38),
                    color: Colors.red,
                  ),
                  Text(
                    "YOUR CART IS EMPTY!",
                    style: TextStyle(
                      fontSize: textScaler.scale(20),
                    ),
                  ),
                ],
              ),
            ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
