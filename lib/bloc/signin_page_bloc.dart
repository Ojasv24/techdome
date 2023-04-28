// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techdome/bloc/auth_bloc.dart';
import 'package:techdome/model/exceptions.dart';
import 'package:techdome/model/sign_in_page_state.dart';

part 'signin_page_bloc.g.dart';

@riverpod
class SignInPageBloc extends _$SignInPageBloc {
  @override
  SignInPageState build() {
    return const SignInPageState();
  }

  void changeEmail(String email) {
    state = state.copyWith(email: email);
    validateEmailPassword();
  }

  void changePassword(String password) {
    state = state.copyWith(password: password);
    validateEmailPassword();
  }

  bool validateEmailPassword() {
    if (state.email.isEmpty) {
      state = state.copyWith(error: 'Email is empty');
      return false;
    }
    if (state.password.isEmpty) {
      state = state.copyWith(error: 'Password is empty');
      return false;
    }
    state = state.copyWith(error: '');
    return true;
  }

  Future<void> signIn() async {
    if (!validateEmailPassword()) {
      return;
    }
    state = state.copyWith(loading: true, showError: true);
    try {
      await ref
          .watch(authBlocProvider.notifier)
          .signIn(state.email, state.password);
      state = state.copyWith(loading: false);
    } catch (e) {
      if (e is EmailAlreadyExistsException) {
        state = state.copyWith(error: 'Email already exists', loading: false);
      }
    }
  }

  Future<void> signUp() async {
    if (!validateEmailPassword()) {
      return;
    }
    state = state.copyWith(loading: true, showError: true);
    try {
      await ref
          .watch(authBlocProvider.notifier)
          .signUp(state.email, state.password);
      state = state.copyWith(loading: false);
    } catch (e) {
      if (e is EmailAlreadyExistsException) {
        print('ojasv');
        state = state.copyWith(error: 'Email already exists', loading: false);
      }
    }
  }
}
