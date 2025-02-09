import 'package:flutter/material.dart';
import 'package:KURONIME_APP/page/home.dart';
import 'package:KURONIME_APP/page/jadwal.dart';
import 'package:KURONIME_APP/page/profile.dart';
import 'package:KURONIME_APP/page/search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavbarPage(),
    );
  }
}

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const JadwalPage(),
    ProfilePage(),
  ];

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Halaman konten
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            physics: const ClampingScrollPhysics(),
            children: _pages,
          ),
          // Navbar melayang di atas
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 29, 25, 41),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: Colors.yellow,
                unselectedItemColor: Colors.white,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: _selectedIndex == 0
                          ? const EdgeInsets.all(8.0)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0
                            ? Colors.yellow.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.home_filled,
                        size: _selectedIndex == 0 ? 30 : 24,
                      ),
                    ),
                    label: _selectedIndex == 0 ? 'Home' : '',
                    tooltip: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: _selectedIndex == 1
                          ? const EdgeInsets.all(8.0)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1
                            ? Colors.yellow.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        size: _selectedIndex == 1 ? 30 : 24,
                      ),
                    ),
                    label: _selectedIndex == 1 ? 'Search' : '',
                    tooltip: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: _selectedIndex == 2
                          ? const EdgeInsets.all(8.0)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: _selectedIndex == 2
                            ? Colors.yellow.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.schedule,
                        size: _selectedIndex == 2 ? 30 : 24,
                      ),
                    ),
                    label: _selectedIndex == 2 ? 'Jadwal' : '',
                    tooltip: 'Jadwal',
                  ),
                  BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: _selectedIndex == 3
                          ? const EdgeInsets.all(8.0)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: _selectedIndex == 3
                            ? Colors.yellow.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.person_2,
                        size: _selectedIndex == 3 ? 30 : 24,
                      ),
                    ),
                    label: _selectedIndex == 3 ? 'Akun' : '',
                    tooltip: 'Akun',
                  ),
                ],
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'Poppins', // Font yang digunakan
                  fontSize: 12,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Poppins', // Font yang digunakan
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy HomePage widget
class HomePagee extends StatelessWidget {
  const HomePagee({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Dummy SettingsPage widget
class SettingsPagee extends StatelessWidget {
  const SettingsPagee({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Dummy ProfilePage widget
class ProfilePagee extends StatelessWidget {
  const ProfilePagee({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Dummy SchedulePage widget
class JadwalPagee extends StatelessWidget {
  const JadwalPagee({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Schedule Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
