import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/signin_page_bloc.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInPageBlocProvider);
    final notifier = ref.watch(signInPageBlocProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: key,
              child: Column(children: [
                TextFormField(
                  initialValue: state.email,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  onChanged: (value) {
                    notifier.changeEmail(value);
                  },
                ),
                TextFormField(
                  initialValue: state.password,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  onChanged: (value) {
                    notifier.changePassword(value);
                  },
                ),
              ]),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    notifier.signIn();
                  },
                  child: const Text('Sign In'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    notifier.signUp();
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
            if (state.showError && state.error.isNotEmpty)
              Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
