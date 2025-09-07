import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'sign_up_verification.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height * 0.46,
              child: Image.asset('assets/images/image2.png', fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: size.height * 0.62,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppTheme.cardRadius)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        const Text('Daftar dengan email',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primary)),
                        const SizedBox(height: 14),
                        const TextField(
                            decoration:
                                InputDecoration(hintText: 'Nama Lengkap')),
                        const SizedBox(height: 12),
                        const TextField(
                            decoration: InputDecoration(
                                hintText: '+62 - Nomor Telepon')),
                        const SizedBox(height: 12),
                        const TextField(
                            decoration: InputDecoration(hintText: 'Email')),
                        const SizedBox(height: 12),
                        const TextField(
                            obscureText: true,
                            decoration:
                                InputDecoration(hintText: 'Kata Sandi')),
                        const SizedBox(height: 6),
                        const Text(
                            'Minimal 8 karakter yang terdiri dari huruf kecil, huruf kapital, angka dan simbol',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 12),
                        const TextField(
                            decoration: InputDecoration(
                                hintText: 'Konfirmasi Kata Sandi')),
                        const SizedBox(height: 18),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SignUpVerification()));
                            },
                            child: const Text('Daftar')),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
