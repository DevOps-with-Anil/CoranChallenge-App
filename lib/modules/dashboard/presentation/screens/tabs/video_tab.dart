import 'package:flutter/material.dart';

class VideoTab extends StatelessWidget {
  const VideoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        children: [
          const SizedBox(height: 10),

          /// Title
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       "Videos",
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 12),

          /// Search Bar with Filter
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Filter Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Colors.black87),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                
                // Search Field
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          color: Colors.black12,
                        )
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search videos...",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// Category Chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _chip("All"),
                _chip("Flutter"),
                _chip("UI Design"),
                _chip("Backend"),
                _chip("Firebase"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// Video List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 8,
              itemBuilder: (context, index) {
                return const VideoCard();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),
      child: Row(
        children: [

          /// Thumbnail
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
                child: Image.network(
                  "https://img.youtube.com/vi/1ukSR1GRtMU/0.jpg",
                  width: 130,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.play_arrow,
                        color: Colors.white, size: 30),
                  ),
                ),
              ),

              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  color: Colors.black87,
                  child: const Text(
                    "12:30",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              )
            ],
          ),

          /// Video Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Flutter Complete UI Design Tutorial",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Code Academy",
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "1.2K views • 2 days ago",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}