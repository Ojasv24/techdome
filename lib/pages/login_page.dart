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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Todo App',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Icon(
                      Icons.note_alt_outlined,
                      size: 40,
                      color: Colors.purple,
                    )
                  ],
                ),
              ),
              Form(
                key: key,
                child: Column(children: [
                  TextFormField(
                    initialValue: state.email,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.mail,
                      ),
                    ),
                    onChanged: (value) => notifier.changeEmail(value),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: state.password,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.password,
                      ),
                    ),
                    onChanged: (value) => notifier.changePassword(value),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      notifier.signIn();
                    },
                    child: const Text('SIGN IN'),
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
                const SizedBox(
                  height: 50,
                ),
              Text(
                state.error,
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
