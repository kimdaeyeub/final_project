import 'dart:async';
import 'package:final_project/features/add/model/mood_model.dart';
import 'package:final_project/features/add/repo/mood_repository.dart';
import 'package:final_project/features/auth/repo/auth_repository.dart';
import 'package:final_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddMoodViewModel extends AsyncNotifier<void> {
  late final MoodRepository _repo;
  @override
  FutureOr<void> build() {
    _repo = ref.read(moodRepo);
  }

  Future<void> addMood(String text, String icon, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userUid = ref.read(authRepo).user!.uid;
      final newMood = Mood(
        text: text,
        icon: icon,
        creatorUid: userUid,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _repo.addMood(newMood, userUid);
    });

    if (!state.hasError) {
      context.go("/home");
    } else {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final addMoodProvider = AsyncNotifierProvider<AddMoodViewModel, void>(
  () => AddMoodViewModel(),
);
