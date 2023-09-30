import 'dart:async';

import 'package:final_project/features/add/model/mood_model.dart';
import 'package:final_project/features/add/repo/mood_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetMoodViewModel extends AsyncNotifier<List<Mood>> {
  late final MoodRepository _repo;
  List<Mood> _list = [];

  @override
  FutureOr<List<Mood>> build() async {
    _repo = ref.read(moodRepo);
    _list = await getMood();
    return _list;
  }

  Future<List<Mood>> getMood() async {
    final result = await _repo.getMoods();
    final moods = result.docs.map(
      (doc) => Mood.fromJson(
        doc.data(),
      ),
    );
    return moods.toList();
  }

  Future<void> refresh() async {
    final moods = await getMood();
    _list = moods;
    state = AsyncValue.data(_list);
  }
}

final getMoodProvider = AsyncNotifierProvider<GetMoodViewModel, List<Mood>>(
  () => GetMoodViewModel(),
);
