import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techdome/model/exceptions.dart';
import 'package:techdome/model/user.dart' as my;

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}

class AuthRepository {
  Future<my.User?> getCurrentUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return my.User(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
      );
    }
    return null;
  }

  Future<void> signIn(String email, String password) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          throw WrongUsernameOrPassword();
        }
      }
    }
  }

  Future<void> signUp(String email, String password) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'weak-password') {
          throw WeakPassword();
        } else if (e.code == 'email-already-in-use') {
          print("FIRST EXPECTIONS");
          throw EmailAlreadyExistsException();
        }
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
