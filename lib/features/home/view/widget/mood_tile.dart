import 'package:flutter/material.dart';

class MoodTile extends StatelessWidget {
  const MoodTile({
    super.key,
    required this.icon,
    required this.text,
    required this.time,
  });
  final String icon;
  final String text;
  final int time;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff74BDA9),
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            top: BorderSide(
              width: 2,
              color: Colors.black,
            ),
            left: BorderSide(
              width: 2,
              color: Colors.black,
            ),
            right: BorderSide(
              width: 2,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: 4,
              color: Colors.black,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Mood :",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      icon,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    )
                  ],
                ),
                Text(
                  DateTime.fromMillisecondsSinceEpoch(time)
                      .toString()
                      .substring(0, 16),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
