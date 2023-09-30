import 'package:final_project/features/add/model/mood_model.dart';
import 'package:final_project/features/add/repo/mood_repository.dart';
import 'package:final_project/features/auth/repo/auth_repository.dart';
import 'package:final_project/features/home/view/widget/mood_tile.dart';
import 'package:final_project/features/home/view_model/delete_mood_view_model.dart';
import 'package:final_project/features/home/view_model/get_mood_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";
  static const String routeURL = '/home';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _deleteMood(Mood mood) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text("Delete note"),
        message: const Text("Are you sure you want to do this?"),
        cancelButton: CupertinoActionSheetAction(
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          // CupertinoActionSheetAction(
          //   onPressed: () {
          //     print("cancel");
          //   },
          //   child: const Text(
          //     "Cancel",
          //   ),
          // ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              print("delete");
              ref.read(deleteMoodProvider.notifier).deleteMood(mood, context);
              context.pop();
            },
            child: const Text(
              "Delete",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => ref.read(authRepo).logOut(),
          child: const Text(
            "🔥MOOD🔥",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ref.watch(getMoodProvider).when(
            error: (error, stackTrace) => Center(
              child: Text(
                error.toString(),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (data) {
              if (data.isEmpty) {
                return const Center(
                  child: Text(
                    "무드를 지금 바로 추가해보세요.",
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onLongPress: () => _deleteMood(data[index]),
                          child: MoodTile(
                            icon: data[index].icon,
                            text: data[index].text,
                            time: data[index].createdAt,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
    );
  }
}
