import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";
  static const String routeURL = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "🔥MOOD🔥",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class MoodTile extends StatelessWidget {
  const MoodTile({
    super.key,
    required this.icon,
    required this.text,
    required this.time,
  });
  final String icon;
  final String text;
  final String time;

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
                  time,
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
