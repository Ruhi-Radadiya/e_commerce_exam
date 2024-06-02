import 'package:flutter/material.dart';

String cat = "All";
Widget myCategory({
  required TextScaler textScaler,
  required String categories,
  required Function() setState,
  required BuildContext context,
}) {
  double h = MediaQuery.sizeOf(context).height;
  double w = MediaQuery.sizeOf(context).width;
  return GestureDetector(
    onTap: () {
      cat = categories;
      setState();
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: w * 0.1,
            backgroundColor: Colors.orangeAccent.shade200,
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            categories,
            style: TextStyle(
              fontSize: textScaler.scale(15),
              color: (cat == categories) ? Colors.black : Colors.grey.shade400,
              fontWeight:
              (cat == categories) ? FontWeight.w900 : FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}
