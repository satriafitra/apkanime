import 'package:flutter/material.dart';
import 'package:KURONIME_APP/page/home.edit.dart';
import 'package:KURONIME_APP/page/nonton.dart';

class PageAnime extends StatelessWidget {
  const PageAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: Stack(
        children: [
          // Gambar latar belakang dengan Positioned untuk menutupi bagian atas dan bawah
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            height: 290, // Menyesuaikan tinggi gambar latar belakang
            child: Opacity(
              opacity: 0.9, // Mengatur opacity (0.0 hingga 1.0, di mana 1.0 sepenuhnya tidak transparan)
              child: Image.asset(
                'assets/anim1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Gradient hitam lembut di atas gambar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 160, // Tinggi gradient di bagian atas
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4), // Warna hitam dengan opacity 0.4
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Tombol kembali di bagian atas
          Positioned(
            top: 40,  // Menambahkan jarak antara atas dan tombol kembali (sesuaikan nilai ini)
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Menavigasi kembali saat diketuk
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          
          // Padding untuk memastikan konten terlihat dan ditempatkan di atas gambar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menambahkan ruang dari atas
                const SizedBox(height: 80), // Sesuaikan ruang ini dengan desain
                
                // Membuat Container dengan opacity di belakang gambar dan teks "Attack on Titan"
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6), // Opacity hitam
                    borderRadius: BorderRadius.circular(12), // Membuat sudut membulat
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/anim1.jpeg',
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Attack on Titan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat', // Menggunakan font Montserrat
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Season 2',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontFamily: 'Poppins', // Menggunakan font Montserrat
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Genre: Action, Drama',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontFamily: 'Poppins', // Menggunakan font Montserrat
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '14 Episode',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontFamily: 'Montserrat', // Menggunakan font Montserrat
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {} ,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 248, 153, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                              child: const Text(
                                'Tonton Sekarang',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 46, 7, 7), // Teks tombol berwarna putih
                                  fontFamily: 'Montserrat', // Menggunakan font Montserrat
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Ruang sebelum teks "Sinopsis"
                const SizedBox(height: 24),

                // Teks Sinopsis dengan warna kuning dan font Montserrat
                const Text(
                  'Sinopsis',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.yellow, // Warna kuning
                    fontFamily: 'Montserrat', // Menggunakan font Montserrat
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Ruang sebelum teks deskripsi
                const SizedBox(height: 16),

                // Deskripsi cerita anime yang lebih singkat
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Eren, Mikasa, dan Armin berjuang untuk bertahan hidup melawan Titan yang menghancurkan tembok besar manusia. Mereka mengungkapkan misteri di balik makhluk raksasa ini dan menyelidiki rahasia besar yang tersembunyi di dunia mereka.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins', // Menggunakan font Montserrat
                        ),
                        textAlign: TextAlign.justify, // Meratakan teks
                      ),
                    ),
                  ],
                ),
                
                // Ruang sebelum daftar episode
                const SizedBox(height: 24),

                // ListView untuk episode dengan desain khusus
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MouseRegion(
                          onEnter: (_) {
                            // Efek saat mouse masuk
                          },
                          onExit: (_) {
                            // Efek saat mouse keluar
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 47, 54),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/episode${index + 1}.jpeg',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                'Episode ${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat', // Menggunakan font Montserrat
                                ),
                              ),
                              subtitle: const Text(
                                'Subtitle Episode',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat', // Menggunakan font Montserrat
                                ),
                              ),
                              trailing: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                                size: 32,
                              ),
                              onTap: () {
                                // Menavigasi ke halaman NontonPage saat episode diklik
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const NontonPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
