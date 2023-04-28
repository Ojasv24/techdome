import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techdome/model/todo.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository();
}

class TodoRepository {
  String get uid {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  CollectionReference get collection {
    return FirebaseFirestore.instance.collection(uid);
  }

  Future<void> add(String text) async {
    final doc = collection.doc();
    final todo = Todo(id: doc.id, description: text, completed: false);
    await doc.set(todo.toJson());
  }

  Future<void> update(Todo todo) async {
    await collection.doc(todo.id).update(todo.toJson());
  }

  Future<void> delete(Todo todo) async {
    await collection.doc(todo.id).delete();
  }

  Stream listenTodoList() {
    // listen todoModel to firestore user
    return collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Todo.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
