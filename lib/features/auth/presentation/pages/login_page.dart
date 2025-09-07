import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome to Nurtur'),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Sign in (mock)',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Signed in (mock)')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
