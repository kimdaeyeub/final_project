import 'dart:async';

import 'package:final_project/features/add/model/mood_model.dart';
import 'package:final_project/features/add/repo/mood_repository.dart';
import 'package:final_project/features/home/view_model/get_mood_view_model.dart';
import 'package:final_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteMoodViewModel extends AsyncNotifier<void> {
  late final MoodRepository _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(moodRepo);
  }

  Future<void> deleteMood(Mood mood, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repo.deleteMood(mood);
    });
    if (!state.hasError) {
      ref.read(getMoodProvider.notifier).refresh();
    } else {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final deleteMoodProvider = AsyncNotifierProvider<DeleteMoodViewModel, void>(
  () => DeleteMoodViewModel(),
);
