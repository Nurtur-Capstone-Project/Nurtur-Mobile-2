import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'forgot_password_reset.dart';

class ForgotPasswordOtp extends StatefulWidget {
  final String destination;
  const ForgotPasswordOtp({Key? key, this.destination = '+628xxxxxxxx'})
      : super(key: key);

  @override
  State<ForgotPasswordOtp> createState() => _ForgotPasswordOtpState();
}

class _ForgotPasswordOtpState extends State<ForgotPasswordOtp> {
  final TextEditingController _codeCtrl = TextEditingController();
  Timer? _timer;
  int _secondsLeft = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft == 0) {
        t.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _codeCtrl.dispose();
    super.dispose();
  }

  void _onSubmit() {
    // stub: validate code
    if ((_codeCtrl.text).length == 6) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('OTP verified (mock)')));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const ForgotPasswordReset()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter 6-digit code')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text('Verifikasi OTP',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary)),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  'Masukkan 6 digit Kode OTP yang kami kirimkan ke ${widget.destination}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 18),
            // OTP boxes (display only, controller behind scenes)
            GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (i) {
                    final digit =
                        (i < _codeCtrl.text.length) ? _codeCtrl.text[i] : '';
                    return Container(
                      width: 48,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(digit, style: const TextStyle(fontSize: 24)),
                    );
                  }),
                ),
              ),
            ),
            // hidden textfield
            Offstage(
              offstage: true,
              child: TextField(
                controller: _codeCtrl,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 18),
            TextButton(
              onPressed: _secondsLeft == 0
                  ? () {
                      _startTimer(); /* resend logic stub */
                    }
                  : null,
              child: Text(
                  'Tidak menerima kode? Kirim ulang (${_formatTime(_secondsLeft)})',
                  style: TextStyle(
                      color:
                          _secondsLeft == 0 ? AppTheme.primary : Colors.grey)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: _onSubmit,
                child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text('Verifikasi')),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48)),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _formatTime(int s) {
    final sec = s % 60;
    return sec.toString().padLeft(2, '0');
  }
}
