import 'package:flutter/material.dart';

class AddMoodScreen extends StatefulWidget {
  const AddMoodScreen({super.key});
  static const String routeURL = "/write";
  static const String routeName = 'write';

  @override
  State<AddMoodScreen> createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("hello"),
      ),
    );
  }
}
