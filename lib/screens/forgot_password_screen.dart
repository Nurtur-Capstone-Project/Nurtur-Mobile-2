import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'forgot_password_otp.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
              child: Image.asset('assets/images/image4.png', fit: BoxFit.cover),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Text('Reset Kata Sandi',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primary)),
                      const SizedBox(height: 12),
                      const Text(
                          'Lupa kata sandi? tenang aja, kita bantu reset yaa',
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 18),
                      const TextField(
                          decoration: InputDecoration(
                              hintText: 'Email / Nomor Telepon (+62)')),
                      const SizedBox(height: 18),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const ForgotPasswordOtp()));
                          },
                          child: const Text('Selanjutnya')),
                    ],
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
