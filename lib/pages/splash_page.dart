import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techdome/bloc/auth_bloc.dart';
import 'package:techdome/pages/login_page.dart';
import 'package:techdome/pages/todo_page.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authBlocProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      authenticated: (user) => const TodoPage(),
      unauthenticated: () => const LoginPage(),
    );
  }
}
