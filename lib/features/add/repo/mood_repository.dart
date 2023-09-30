import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/features/add/model/mood_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addMood(Mood mood, int time) async {
    final newMood = mood.toJson();
    await _db
        .collection("mood")
        .doc(time.toString().substring(0, 12))
        .set(newMood);
    // .doc("hello")
    // .collection(DateTime.now().millisecondsSinceEpoch.toString())
    // .add(newMood);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMoods() async {
    final moods = await _db
        .collection("mood")
        .orderBy("createdAt", descending: true)
        .get();
    return moods;
  }

  Future<void> deleteMood(Mood mood) async {
    final moodRef = _db.collection("mood").doc(mood.id);
    await moodRef.delete();
  }
}

final moodRepo = Provider(
  (ref) => MoodRepository(),
);
