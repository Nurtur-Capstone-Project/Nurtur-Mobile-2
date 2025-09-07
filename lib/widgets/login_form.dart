import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'google_button.dart';
import '../screens/sign_up_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/welcome_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _onSubmit() async {
    // Mock credentials
    const mockEmail = 'test@test.com';
    const mockPassword = 'Password123!';

    if (_emailCtrl.text == mockEmail && _passCtrl.text == mockPassword) {
      // Success
      final prefs = await SharedPreferences.getInstance();
      final hasSeenWelcome = prefs.getBool('hasSeenWelcome') ?? false;

      if (!hasSeenWelcome) {
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const WelcomeScreen()));
        }
      } else {
        // Navigate to home screen (stub)
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login berhasil! Menuju home.')));
        }
      }
    } else {
      // Failure
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: const Text('Email/password anda salah.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailCtrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _passCtrl,
          obscureText: _obscure,
          decoration: InputDecoration(
            hintText: 'Kata Sandi',
            suffixIcon: IconButton(
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _obscure = !_obscure),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const ForgotPasswordScreen()));
              },
              child: const Text('Lupa Kata Sandi?')),
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _onSubmit, child: const Text('Masuk')),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text('Atau')),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        GoogleButton(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Google sign-in stub')))),
        const SizedBox(height: 18),
        Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignUpScreen()));
                },
                child: const Text('Belum memiliki akun? Daftar disini'))),
      ],
    );
  }
}
