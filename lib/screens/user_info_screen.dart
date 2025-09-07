import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart'; // Placeholder for home screen

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? _selectedAgeGroup;
  String? _selectedRole;
  int _selectedMood = -1;

  final List<String> _moods = ['Sedih', 'Bete', 'Biasa', 'Senang', 'Keren'];
  final List<String> _moodEmojis = ['😢', '😠', '😐', '😊', '😍'];

  void _onNextPressed() async {
    // In a real app, you would save this user data.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenWelcome', true);

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) => const LoginScreen()), // Should be HomeScreen
        (route) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Setup complete! Navigating to home.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Kembali'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Satu langkah lagi yuk!',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF8A4D9A),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lengkapi informasi berikut',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: _selectedAgeGroup,
              hint: const Text('Kelompok Umur'),
              onChanged: (value) {
                setState(() {
                  _selectedAgeGroup = value;
                });
              },
              items: const [
                DropdownMenuItem(value: '18-25', child: Text('18-25 Tahun')),
                DropdownMenuItem(value: '26-35', child: Text('26-35 Tahun')),
                DropdownMenuItem(value: '36+', child: Text('36+ Tahun')),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              hint: const Text('Saya Seorang...'),
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
              items: const [
                DropdownMenuItem(value: 'mother', child: Text('Ibu')),
                DropdownMenuItem(value: 'father', child: Text('Ayah')),
                DropdownMenuItem(value: 'guardian', child: Text('Wali')),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Bagaimana Perasaanmu Saat ini?',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMood = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _selectedMood == index
                          ? const Color(0xFF8A4D9A).withOpacity(0.1)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _selectedMood == index
                            ? const Color(0xFF8A4D9A)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(_moodEmojis[index],
                            style: const TextStyle(fontSize: 28)),
                        const SizedBox(height: 4),
                        Text(_moods[index]),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _onNextPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8A4D9A),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Selanjutnya',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
