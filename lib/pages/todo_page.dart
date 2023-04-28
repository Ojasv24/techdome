import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techdome/bloc/auth_bloc.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(authBlocProvider.notifier);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => notifier.signOut(),
          child: Text('Singout'),
        ),
      ),
    );
  }
}
