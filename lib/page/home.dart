import 'package:flutter/material.dart';
import 'package:KURONIME_APP/page/setting.dart'; // Assuming this page exists
import 'package:KURONIME_APP/page/home.edit.dart'; // Assuming this page exists

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _currentImageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> images = [
    'assets/dadan.jpeg',
    'assets/anim3.jpeg',
    'assets/baru1.jpg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to Settings if index is 1
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
    }
  }

  void _changeImage(int direction) {
    setState(() {
      _currentImageIndex = (_currentImageIndex + direction) % images.length;
      if (_currentImageIndex < 0) {
        _currentImageIndex = images.length - 1;
      }
    });
  }

  void _openProfile() {
    _scaffoldKey.currentState?.openDrawer(); // Open the Drawer when profile image is clicked
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(113, 45, 53, 65),
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: _openProfile, // Open profile info when clicked
              child: ClipOval(
                child: Image.asset(
                  'assets/imi.jpeg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kasaaa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  "Level 142",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                print("Notifications tapped");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: PopupMenuButton<String>(
              color: const Color.fromARGB(255, 32, 26, 47),
              icon: const Icon(Icons.menu, color: Colors.white),
              onSelected: (value) {
                if (value == 'Settings') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                } else if (value == 'Favorite') {
                  print("Favorite selected");
                } else if (value == 'Logout') {
                  print("Logout selected");
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Settings',
                  child: ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Favorite',
                  child: ListTile(
                    leading: Icon(Icons.favorite, color: Color.fromARGB(255, 255, 255, 255)),
                    title: Text(
                      'Favorite',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Color.fromARGB(255, 242, 70, 70)),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: ClipRRect(
                    key: ValueKey<int>(_currentImageIndex),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.7,
                      child: Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images[_currentImageIndex]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => _changeImage(-1),
                  ),
                ),
                Positioned(
                  top: 150,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () => _changeImage(1),
                  ),
                ),
              ],
            ),
            // Placeholder for GridCardWidget
            GridCardWidget(),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 32, 26, 47),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Profile header in the drawer
            UserAccountsDrawerHeader(
              accountName: const Text('Kasaaa', style: TextStyle(color: Colors.white)),
              accountEmail: const Text('Level 142', style: TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/imi.jpeg'),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(113, 45, 53, 65),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                print('Logout');
              },
            ),
          ],
        ),
      ),
    );
  }
}
