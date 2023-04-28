// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:techdome/model/user.dart' as my;

// part 'users_repostiorty.g.dart';

// @riverpod
// UserRepository userRepositoryProvider(UserRepositoryProviderRef ref) {
//   return UserRepository();
// }

// class UserRepository {
//   Future<my.User> signIn(String email, String password) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return getUser();
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         throw Exception('No user found for that email.');
//         // print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         throw Exception('Wrong password provided for that user.');
//         // print('Wrong password provided for that user.');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//       // print(e);
//     }
//     throw Exception('Error: Unknown');
//   }

//   Future<void> signOut() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   Future<my.User> signUp(String email, String password) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return getUser();
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         throw Exception('The password provided is too weak.');
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         throw Exception('The account already exists for that email.');
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//       print(e);
//     }
//     throw Exception('Error: Unknown');
//   }

//   my.User getUser() {
//     User? user = FirebaseAuth.instance.currentUser;
//     return my.User(
//       id: user!.uid,
//       email: user.email!,
//     );
//   }
// }
