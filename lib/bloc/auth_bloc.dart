// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techdome/model/auth_state.dart';
import 'package:techdome/model/exceptions.dart';
// import 'package:techdome/res/users/users_repostiorty.dart';

import 'package:techdome/repository/auth_repository.dart';

part 'auth_bloc.g.dart';

@riverpod
class AuthBloc extends _$AuthBloc {
  @override
  AuthState build() {
    init();
    return AuthState.loading();
  }

  Future<void> init() async {
    state = AuthState.loading();
    final user = await ref.watch(authRepositoryProvider).getCurrentUser();
    if (user != null) {
      state = AuthState.authenticated(user);
    } else {
      state = AuthState.unauthenticated();
    }
  }

  Future<void> signIn(String email, String password) async {
    await ref.watch(authRepositoryProvider).signIn(email, password);
    final user = await ref.watch(authRepositoryProvider).getCurrentUser();
    state = AuthState.authenticated(user!);
  }

  Future<void> signUp(String email, String password) async {
    await ref.watch(authRepositoryProvider).signUp(email, password);
    final user = await ref.watch(authRepositoryProvider).getCurrentUser();
    state = AuthState.authenticated(user!);
  }

  Future<void> signOut() async {
    await ref.watch(authRepositoryProvider).signOut();
    state = AuthState.unauthenticated();
  }
}
