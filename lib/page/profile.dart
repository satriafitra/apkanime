import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:KURONIME_APP/page/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;

  // Fungsi untuk memilih sumber gambar
  Future<void> _showImageSourceOptions() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.orange),
                title: const Text(
                  "Ambil dari Kamera",
                  style: 
                  TextStyle(color: Colors.white, fontFamily: "Poppins"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.orange),
                title: const Text(
                  "Ambil dari Galeri",
                  style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Fungsi untuk mengambil gambar dari kamera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Fungsi untuk mengambil gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 27, 26, 28),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(70)),
            ),
            child: Column(
              children: [
                 SizedBox(height: 20),
                // Profile Info
                Row(
                  children: [
                    GestureDetector(
                      onTap: _showImageSourceOptions,
                      child: CircleAvatar(
                        radius: 36,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage('assets/imi.jpeg') as ImageProvider,
                        child: const Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.edit,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kasaaa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "0821-2766-47778",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          "herduthaza@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Card Number
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 148, 6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "4503-9980-0538-4143",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Menu List
          Expanded(
            child: ListView(
              children: [
                buildMenuItem(
                  icon: Icons.description,
                  text: "Statement",
                  onTap: () {},
                ),
                buildMenuItem(
                  icon: Icons.person,
                  text: "Information Update",
                  onTap: () {},
                ),
                buildMenuItem(
                  icon: Icons.lock,
                  text: "Privacy & Security",
                  onTap: () {},
                ),
                buildMenuItem(
                  icon: Icons.history,
                  text: "Transaction History",
                  onTap: () {},
                ),
                buildMenuItem(
                  icon: Icons.settings,
                  text: "Settings",
                  onTap: () {},
                ),
                buildMenuItem(
                  icon: Icons.support_agent,
                  text: "Support",
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 120),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              ),
              onPressed: () {
                // Arahkan ke halaman Login ketika tombol logout ditekan
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 243, 208, 12)),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
