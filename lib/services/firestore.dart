import 'dart:async';
import 'package:apptvshow/auth.dart';
import 'package:apptvshow/users/models.dart' as usermodell;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../quizz/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<SubjectAndGrade>> getSubjectAndGrade() async {
    var ref = _db.collection("quizzes");
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var subjects = data.map((d) => SubjectAndGrade.fromJson(d));
    return subjects.toList();
  }

  Future<usermodell.User> getUser() async {
    String? user = Auth().currentUser?.uid;
    var ref = _db.collection('users').doc(user);

    final docSnapshot = await ref.get();
    if (docSnapshot.exists) {
      final data = docSnapshot.data()!;
      return usermodell.User.fromJson(data);
    } else {
      final newUser = usermodell.User(
        uid: user ?? "", name: "", lumeeiCoins: 0,);
      await ref.set(newUser.toJson());
      return newUser;
    }
  }

  Future<void> setLumeeiCoins(int newCoins) async {
    if (newCoins != 0) {
      String? user = Auth().currentUser?.uid;
      var ref = _db.collection('users').doc(user);

      final docSnapshot = await ref.get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;

        final currentCoins = data['lumeeiCoins'];
        final updatedCoins = (currentCoins as num) + newCoins;
        await ref.update({'lumeeiCoins': updatedCoins});
      } else {
        if (newCoins > 0) {
          final newUser = usermodell.User(
            uid: user ?? "", name: "", lumeeiCoins: newCoins,);
          await ref.set(newUser.toJson());
        }
      }
    }
  }
}
