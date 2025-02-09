import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:KURONIME_APP/page/home.dart';  // Pastikan Anda telah membuat file home.dart
import 'package:KURONIME_APP/page/navbar.dart';  // Pastikan Anda telah membuat file home.dart
import 'package:KURONIME_APP/page/profile.dart';  // Pastikan Anda telah membuat file home.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk TextField email dan password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // Menyimpan status apakah password terlihat atau tidak
  bool _isPasswordVisible = false;

  // Fungsi untuk memeriksa login
  void _login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == "kakang" && password == "123") {
      // Ganti halaman dengan animasi transisi custom
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const NavbarPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);  // Dari kanan
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    } else {
      _showDialog('Error', 'Email atau password salah');
    }
  }

  // Fungsi untuk menampilkan dialog pemberitahuan
  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',  // Menggunakan font Montserrat
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontFamily: 'Poppins',  // Menggunakan font Poppins
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color.fromARGB(255, 236, 164, 55), // Warna oranye
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Stack to overlap the animation and the "Welcome Back" text
              Stack(
                alignment: Alignment.center,
                children: [
                  // Lottie Animation
                  Hero(
                    tag: 'logo',  // Tag unik untuk mencocokkan dengan Hero widget di halaman tujuan
                    child: Lottie.asset(
                      'assets/animation.json',  // Pastikan untuk menempatkan file animasi Lottie di folder 'assets'
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned text "Welcome Back!" directly on top of the Lottie animation
                  const Positioned(
                    bottom: 5,
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your email address and password to access your account.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,  // Menambahkan controller untuk email
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,  // Menambahkan controller untuk password
                obscureText: !_isPasswordVisible,  // Toggling apakah password disembunyikan atau tidak
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility, 
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;  // Toggle visibilitas password
                      });
                    },
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _login,  // Menghubungkan tombol dengan fungsi login
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 236, 164, 55),
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 27,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image for Facebook Logo without stroke
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Facebook white background
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/fb.png',  // Ganti dengan path gambar logo Facebook Anda
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 20), // Spacing between icons
                  // Image for Google Logo without stroke
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Google white background
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/icon_goggle.png',  // Pastikan pathnya benar
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 20), // Spacing between icons
                  // Icon Phone without stroke
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 21, 20, 24), // Phone black background
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.phone, color: Color.fromARGB(255, 255, 255, 255)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Create an account',
                          style: TextStyle(
                            color: Colors.orange, // Warna teks oranye
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.yellow, // Garis bawah
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
