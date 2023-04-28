import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:techdome/model/todo.dart';

class TodoReposotory {
  String get uid {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  CollectionReference get collection {
    return FirebaseFirestore.instance.collection(uid);
  }

  Future<void> create(String text) async {
    // add todoModel to firestore user
    final doc = collection.doc();
    final todo = Todo(id: doc.id, description: text, completed: false);
    await doc.set(todo.toJson());

  Future<void> update(TodoModel todoModel) async {
    // update todoModel to firestore user
    await collection.doc(todoModel.id).update({
      'text': todoModel.text,
      'isCompleted': todoModel.isCompleted,
    });
  }

  Future<void> delete(TodoModel todoModel) async {
    // delete todoModel to firestore user
    await FirebaseFirestore.instance
        .collection('users')
        .doc('user')
        .collection('todo')
        .doc(todoModel.id)
        .delete();
  }

  Stream listenTodoList() {
    // listen todoModel to firestore user
    return FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}
