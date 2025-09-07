import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SignUpVerification extends StatelessWidget {
  const SignUpVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),
            const Center(
                child: Text('Verifikasi Akun Anda',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primary))),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  'Tautan aktivasi akun telah dikirim ke alamat email yang kamu berikan',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 18),
            Expanded(child: Image.asset('assets/images/image3.png')),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Sukses'),
                      content: const Text('Akun berhasil dibuat.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Kembali ke Halaman Login'),
                        ),
                      ],
                    ),
                  );

                  if (context.mounted) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                },
                child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text('Kembali ke halaman login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
