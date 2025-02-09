import 'package:flutter/material.dart';

class NontonPage extends StatefulWidget {
  const NontonPage({super.key});

  @override
  _NontonPageState createState() => _NontonPageState();
}

class _NontonPageState extends State<NontonPage> {
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, dynamic>> _comments = [
    {
      "username": "User1",
      "comment": "This episode was amazing! Can't wait for the next one.",
      "likes": 20,
      "dislikes": 5,
      "liked": false,
      "disliked": false
    },
    {
      "username": "User2",
      "comment": "Great animation and plot twists!",
      "likes": 15,
      "dislikes": 2,
      "liked": false,
      "disliked": false
    },
    {
      "username": "User3",
      "comment": "Loved it! The pacing was perfect.",
      "likes": 30,
      "dislikes": 1,
      "liked": false,
      "disliked": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Background
                Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 240,
                        width: double.infinity,
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_filled,
                            color: Colors.white,
                            size: 64,
                          ),
                        ),
                      ),
                      Container(
                        height: 4,
                        width: double.infinity,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
                // Anime Details
                Container(
                  color: const Color(0xFF303030),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Attack On Titan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          SizedBox(width: 4),
                          Text(
                            "8.5/10",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildButton("Season 3", const Color.fromARGB(255, 23, 22, 44), const Color.fromARGB(255, 255, 215, 18), false),
                          const SizedBox(width: 8),
                          _buildDownloadButton(),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Scrollable Episode Buttons
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF404040),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              20,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: _buildEpisodeButton("${index + 1}"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Section for Comments
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Input for new comment
                      _buildCommentInput(),
                      const SizedBox(height: 36),  // Jarak antara input dan komentar-komentar
                      _buildCommentSection(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Section for Recommended Anime
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rekomendasi Anime",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 33),
                      Row(
                        children: [
                          Container(
                            width: 160,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: AssetImage('assets/anim3.jpeg'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Demon Slayer",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 100),
                                const Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow, size: 20),
                                    SizedBox(width: 4),
                                    Text(
                                      "8.5/10",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                _buildButton("PUTAR", const Color.fromARGB(255, 35, 35, 35), const Color.fromARGB(255, 255, 255, 255), true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentSection() {
    return Column(
      children: _comments.map((comment) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildCommentCard(
            comment["username"],
            comment["comment"],
            comment["likes"],
            comment["dislikes"],
            comment["liked"],
            comment["disliked"],
            (bool isLiked) {
              setState(() {
                if (isLiked) {
                  // Handle like
                  if (comment["liked"]) {
                    // If it's already liked, remove like
                    comment["likes"]--;
                    comment["liked"] = false;
                  } else {
                    // If it's not liked, add like and remove dislike if exists
                    comment["likes"]++;
                    if (comment["disliked"]) {
                      comment["dislikes"]--;
                      comment["disliked"] = false;
                    }
                    comment["liked"] = true;
                  }
                } else {
                  // Handle dislike
                  if (comment["disliked"]) {
                    // If it's already disliked, remove dislike
                    comment["dislikes"]--;
                    comment["disliked"] = false;
                  } else {
                    // If it's not disliked, add dislike and remove like if exists
                    comment["dislikes"]++;
                    if (comment["liked"]) {
                      comment["likes"]--;
                      comment["liked"] = false;
                    }
                    comment["disliked"] = true;
                  }
                }
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCommentCard(
      String username, String comment, int likes, int dislikes, bool liked, bool disliked, Function(bool) toggleLikeDislike) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align the profile image and text to the top
      children: [
        // Profile Picture (Circular)
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/profile_placeholder.png'), // Ganti dengan path gambar Anda
        ),
        const SizedBox(width: 10),
        // Comment content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                comment,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      toggleLikeDislike(true);  // Toggle Like
                    },
                    icon: Icon(
                      Icons.thumb_up,
                      color: liked ? Colors.yellow : Colors.white,
                    ),
                  ),
                  Text(
                    "$likes",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      toggleLikeDislike(false);  // Toggle Dislike
                    },
                    icon: Icon(
                      Icons.thumb_down,
                      color: disliked ? Colors.red : Colors.white,
                    ),
                  ),
                  Text(
                    "$dislikes",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommentInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "2.9K Comments",  // Teks jumlah komentar
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),  // Jarak antara teks "2.9K Comments" dan input
        Row(
          children: [
            // Profile Picture (Circular)
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_placeholder.png'), // Ganti dengan path gambar Anda
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _commentController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 31, 30, 30),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  setState(() {
                    _comments.insert(0, {  // Menambahkan komentar baru di awal
                      "username": "You",
                      "comment": _commentController.text,
                      "likes": 0,
                      "dislikes": 0,
                      "liked": false,
                      "disliked": false
                    });
                    _commentController.clear();
                  });
                }
              },
              icon: const Icon(Icons.send, color: Colors.yellow),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, bool hasBorder) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: hasBorder ? Border.all(color: Colors.yellow, width: 2) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.play_arrow,
            color: textColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC107),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.download,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            "Download",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodeButton(String text) {
    return Container(
      width: 85,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF505050),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}


