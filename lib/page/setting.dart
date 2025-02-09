import 'package:flutter/material.dart';
import 'package:KURONIME_APP/page/home.dart'; // Pastikan sudah mengimpor HomePage

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // State untuk dark mode, mulai dengan dark mode aktif
  bool _isDarkMode = true; // Set default to dark mode
  int _selectedIndex = 1; // Index untuk menampilkan Settings

  // Fungsi untuk mengubah halaman berdasarkan index yang dipilih di bottom navbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      // Pindah ke HomePage jika Home dipilih
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    // Tambahkan logika lainnya jika ada tindakan untuk item lainnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _isDarkMode ? const Color.fromARGB(255, 37, 37, 37) : const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: _isDarkMode ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 37, 37, 37),
          ),
        ),
        backgroundColor: _isDarkMode
            ? const Color.fromARGB(255, 37, 37, 37)
            : const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(
              child: Column(
                children: [
                  // Tambahkan pengaturan untuk tema atau lainnya
           
                  const SizedBox(height: 20),
                  SwitchListTile(
                    secondary: Icon(Icons.nightlight_round,
                        color: _isDarkMode ? Colors.white : Colors.black),
                    title: Text('Dark mode',
                        style: TextStyle(
                            color: _isDarkMode ? Colors.white : Colors.black)),
                    value: _isDarkMode,
                    onChanged: (bool value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
        
            ListTile(
              leading: Icon(Icons.person,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Edit profile',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: _isDarkMode ? Colors.white : Colors.black),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Email',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: _isDarkMode ? Colors.white : Colors.black),
              onTap: () {},
            ),
            SwitchListTile(
              secondary: Icon(Icons.notifications,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Notifications',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              value: true,
              onChanged: (bool value) {
                // Tambahkan logika untuk mengubah state
              },
            ),
            ListTile(
              leading: Icon(Icons.key_sharp,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Buy Premium',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              trailing: Icon(Icons.add,
                  color: _isDarkMode ? Colors.white : Colors.black),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.settings,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('General',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Privacy',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.block,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Block',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Help',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('About',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
