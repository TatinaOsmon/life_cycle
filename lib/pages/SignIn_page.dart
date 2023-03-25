import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:life_cycle/home_pageLife.dart';
import 'package:life_cycle/service/user_state.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final _nameCtl = TextEditingController();
  final _lastNameCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignInPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: _nameCtl,
            ),
            TextFormField(
              controller: _lastNameCtl,
            ),
            ElevatedButton(
              onPressed: () async {
                final isTrue = await service.signIn(
                  name: _nameCtl.text,
                  password: _lastNameCtl.text,
                );
                if (isTrue) {
                  // ignore: use_build_context_synchronously
                  await Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                } else {
                  log('login je password tuura emes');
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ), // Add closing parenthesis here
    );
  }
}
