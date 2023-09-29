import 'package:final_project/features/add/model/mood_model.dart';
import 'package:final_project/features/add/view_model/add_mood_view_model.dart';
import 'package:final_project/features/common/widgets/pink_button.dart';
import 'package:final_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddMoodScreen extends ConsumerStatefulWidget {
  const AddMoodScreen({super.key});
  static const String routeURL = "/write";
  static const String routeName = 'write';

  @override
  ConsumerState<AddMoodScreen> createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends ConsumerState<AddMoodScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _iconList = [
    "😁",
    "😍",
    "😚",
    "🥳",
    "😭",
    "🤬",
    "🫠",
    "🤮",
  ];

  int _selectedIcon = 0;

  void _chooseIcon(int value) {
    setState(() {
      _selectedIcon = value;
    });
  }

  void _onSubmit() {
    if (_textEditingController.text != "") {
      ref.read(addMoodProvider.notifier).addMood(
          _textEditingController.text, _iconList[_selectedIcon], context);
      _textEditingController.clear();
      context.go("/home");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "텍스트를 입력해주세요",
          ),
        ),
      );
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "How do you feel?",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _textEditingController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write it down here!",
                // filled: true,
                // fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "What's your mood?",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < _iconList.length; i++)
                  GestureDetector(
                    onTap: () => _chooseIcon(i),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: i == _selectedIcon
                            ? Colors.green.shade200
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(
                          top: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          left: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Text(
                        _iconList[i],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: _onSubmit,
              child: const PinkButton(
                child: Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
