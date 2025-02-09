import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data anime untuk ditampilkan - Jumat
    final List<Map<String, String>> fridayAnimeList = [
      {
        'title': 'Attack on Titan',
        'date': '24 Januari 2025',
        'image': 'assets/dadan.jpeg',
      },
      {
        'title': 'One Piece',
        'date': '25 Januari 2025',
        'image': 'assets/anim3.jpeg',
      },
      {
        'title': 'Demon Slayer',
        'date': '26 Januari 2025',
        'image': 'assets/anim2.jpeg',
      },
      {
        'title': 'My Hero Academia',
        'date': '27 Januari 2025',
        'image': 'assets/anim1.jpeg',
      },
    ];

    // Data anime untuk ditampilkan - Kamis
    final List<Map<String, String>> thursdayAnimeList = [
    {
        'title': 'Attack on Titan',
        'date': '24 Januari 2025',
        'image': 'assets/dadan.jpeg',
      },
      {
        'title': 'One Piece',
        'date': '25 Januari 2025',
        'image': 'assets/anim3.jpeg',
      },
      {
        'title': 'Demon Slayer',
        'date': '26 Januari 2025',
        'image': 'assets/anim2.jpeg',
      },
      {
        'title': 'My Hero Academia',
        'date': '27 Januari 2025',
        'image': 'assets/anim1.jpeg',
      },
    ];

    // Controller untuk scroll horizontal
    final ScrollController fridayScrollController = ScrollController();
    final ScrollController thursdayScrollController = ScrollController();

    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 37, 37, 37),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Teks judul besar "Anime Populer"
                Padding(
            padding: const EdgeInsets.only(top: 50.0), // Atur jarak dari atas
            child: const Text(
              'Anime Populer',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
          ),              
              const SizedBox(height: 32),

              // Teks untuk jadwal Jumat
              const Text(
                'Hari ini - Jumat, 24 Januari 2025',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 16),

              // Container untuk daftar anime hari Jumat
              _buildAnimeList(fridayAnimeList, fridayScrollController, context),

              const SizedBox(height: 32),

              // Teks untuk jadwal Kamis
              const Text(
                'Kemarin - Kamis, 23 Januari 2025',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 16),

              // Container untuk daftar anime hari Kamis
              _buildAnimeList(thursdayAnimeList, thursdayScrollController, context),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat daftar anime (reusable)
  Widget _buildAnimeList(List<Map<String, String>> animeList, ScrollController scrollController, BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            itemCount: animeList.length,
            itemBuilder: (context, index) {
              final anime = animeList[index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar anime
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        anime['image']!,
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            anime['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            anime['date']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // Tombol panah kiri
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              scrollController.animateTo(
                scrollController.offset - MediaQuery.of(context).size.width * 0.6,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        // Tombol panah kanan
        Positioned(
          right: 0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              scrollController.animateTo(
                scrollController.offset + MediaQuery.of(context).size.width * 0.6,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }
}
