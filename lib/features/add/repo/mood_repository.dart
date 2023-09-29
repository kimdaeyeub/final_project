import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/features/add/model/mood_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addMood(Mood mood, String uid) async {
    final newMood = mood.toJson();
    await _db
        .collection("mood")
        // .doc("hello")
        // .collection(DateTime.now().millisecondsSinceEpoch.toString())
        .add(newMood);
  }
}

final moodRepo = Provider(
  (ref) => MoodRepository(),
);
