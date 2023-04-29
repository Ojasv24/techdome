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
              Row(
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
              const SizedBox(
                height: 50,
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
                    child: Row(
                      children: const [
                        Text('SIGN IN'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.login)
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      notifier.signUp();
                    },
                    child: Row(
                      children: const [
                        Text('SIGN UP'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.app_registration_rounded)
                      ],
                    ),
                  ),
                ],
              ),
              if (state.showError && state.error.isNotEmpty) ...{
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          state.error,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}
