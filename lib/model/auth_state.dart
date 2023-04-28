import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.loading() = Loading;
  factory AuthState.unauthenticated() = Unauthenticated;
  factory AuthState.authenticated(User user) = Authenticated;
}
