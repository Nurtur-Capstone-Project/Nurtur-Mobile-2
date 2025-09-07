import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ForgotPasswordReset extends StatelessWidget {
  const ForgotPasswordReset({Key? key}) : super(key: key);

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
                      const Text('Masukkan kata sandi baru Anda di bawah ini',
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 18),
                      const TextField(
                          obscureText: true,
                          decoration:
                              InputDecoration(hintText: 'Kata Sandi Baru')),
                      const SizedBox(height: 12),
                      const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Konfirmasi Kata Sandi Baru')),
                      const SizedBox(height: 18),
                      ElevatedButton(
                          onPressed: () async {
                            // Show success dialog
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Sukses'),
                                content: const Text(
                                    'Password anda berhasil diubah.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );

                            // Navigate back to login screen
                            if (context.mounted) {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            }
                          },
                          child: const Text('Reset Kata Sandi')),
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
