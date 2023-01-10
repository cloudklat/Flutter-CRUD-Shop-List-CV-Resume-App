import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterv1/cubits/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                context.go(
                  context.namedLocation('home'),
                );
              },
              icon: const Icon(Icons.home_rounded),
              label: const Text('Go To Home'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                context.read<LoginCubit>().login();
              },
              icon: const Icon(Icons.key_rounded),
              label: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
