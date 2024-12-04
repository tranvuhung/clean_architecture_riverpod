import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_riverpod/features/authentication/presentation/providers/auth_providers.dart';
import 'package:clean_architecture_riverpod/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:clean_architecture_riverpod/features/authentication/presentation/widgets/auth_field.dart';

class LoginScreen extends ConsumerWidget {
  static const routeName = '/loginScreen';

  LoginScreen({super.key});

  final TextEditingController usernameController =
      TextEditingController(text: 'username');
  final TextEditingController passwordController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);

    ref.listen(
      authStateNotifierProvider.select((value) => value),
      (previous, next) {
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.message.toString())));
        } else if (next is Success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login success')));
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('TDD with Riverpod'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AuthField(
              hintText: 'Username',
              controller: usernameController,
            ),
            AuthField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            authState.maybeMap(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => loginButton(ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // validate email and password
        ref.read(authStateNotifierProvider.notifier).login(
              username: usernameController.text,
              password: passwordController.text,
            );
      },
      child: const Text('Login'),
    );
  }
}
