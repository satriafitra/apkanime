import 'package:flutter/material.dart';
import 'package:KURONIME_APP/page/navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variabel untuk mengatur animasi opacity
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Animasi muncul gambar dan teks
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Setelah animasi selesai (3 detik), pindah ke NavbarPage
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavbarPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37), // Warna latar belakang abu-abu
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Animasi fade untuk gambar
            AnimatedOpacity(
              opacity: _opacity, // Nilai opacity untuk gambar
              duration: const Duration(seconds: 1), // Durasi animasi fade
              child: Image.asset(
                'assets/Kuro.png', // Ganti dengan path gambar kamu
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 20), // Jarak antara gambar dan teks
            // Animasi fade untuk teks
            AnimatedOpacity(
              opacity: _opacity, // Nilai opacity untuk teks
              duration: const Duration(seconds: 1), // Durasi animasi fade
              child: const Text(
                'Kaitoplay',
                style: TextStyle(
                  fontSize: 30, // Ukuran font
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins', // Font tebal
                  color: Colors.yellow, // Warna teks kuning
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
