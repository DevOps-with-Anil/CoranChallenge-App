import 'dart:async';
import 'package:flutter/material.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {

  final TextEditingController searchController = TextEditingController();

  String selectedCategory = "All";

  PageController trendingController = PageController();
  int trendingIndex = 0;

  Timer? sliderTimer;

  final List<String> categories = [
    "All",
    "Quran",
    "Education",
    "Events",
    "Technology",
    "Community"
  ];

  final List<Map<String, dynamic>> trendingNews = [
    {
      "title": "Global Quran Challenge 2026 Announced",
      "image": "assets/dummy/news-thumbnail.jpg"
    },
    {
      "title": "New Tajweed Learning Platform Launched",
      "image": "assets/dummy/news-thumbnail.jpg"
    },
    {
      "title": "AI Quran Tutor App Trending Worldwide",
      "image": "assets/dummy/news-thumbnail.jpg"
    },
  ];

  final List<Map<String, dynamic>> news = [

    {
      "title": "Youth Quran Competition Announced",
      "desc": "International Quran recitation competition announced for youth.",
      "category": "Events",
      "time": "2 hours ago",
      "image": "assets/dummy/news-thumbnail.jpg"
    },

    {
      "title": "Modern Tajweed Techniques",
      "desc": "Scholars introduce new techniques to improve recitation.",
      "category": "Education",
      "time": "5 hours ago",
      "image": "assets/dummy/news-thumbnail.jpg"
    },

    {
      "title": "AI Helping Quran Students",
      "desc": "New apps are using AI to teach tajweed effectively.",
      "category": "Technology",
      "time": "1 day ago",
      "image": "assets/dummy/news-thumbnail.jpg"
    },

    {
      "title": "Community Quran Program",
      "desc": "Local mosques start Quran memorization programs.",
      "category": "Community",
      "time": "3 hours ago",
      "image": "assets/dummy/news-thumbnail.jpg"
    },
  ];

  List<Map<String, dynamic>> filteredNews = [];

  @override
  void initState() {
    super.initState();
    filteredNews = news;

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {

      if (trendingIndex < trendingNews.length - 1) {
        trendingIndex++;
      } else {
        trendingIndex = 0;
      }

      trendingController.animateToPage(
        trendingIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    sliderTimer?.cancel();
    trendingController.dispose();
    super.dispose();
  }

  /// SEARCH + FILTER
  void filterNews() {

    final query = searchController.text.toLowerCase();

    setState(() {

      filteredNews = news.where((item) {

        final matchesCategory =
            selectedCategory == "All" ||
            item["category"] == selectedCategory;

        final matchesSearch =
            item["title"].toLowerCase().contains(query) ||
            item["desc"].toLowerCase().contains(query);

        return matchesCategory && matchesSearch;

      }).toList();
    });
  }

  /// PULL TO REFRESH
  Future<void> refreshNews() async {

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      filteredNews = news;
      searchController.clear();
      selectedCategory = "All";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.grey.shade100,
      child: Column(
        children: [

          _searchBar(),

          _trendingSlider(),

          _categories(),

          Expanded(
            child: RefreshIndicator(
              onRefresh: refreshNews,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: filteredNews.length,
                itemBuilder: (_, i) {

                  final item = filteredNews[i];

                  return NewsCard(
                    title: item["title"],
                    desc: item["desc"],
                    image: item["image"],
                    time: item["time"],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  /// SEARCH BAR
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "News",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
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
                    controller: searchController,
                    onChanged: (_) => filterNews(),
                    decoration: InputDecoration(
                      hintText: "Search news...",
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
        ],
      ),
    );
  }

  /// TRENDING SLIDER
  Widget _trendingSlider() {

    return SizedBox(
      height: 170,
      child: PageView.builder(
        controller: trendingController,
        itemCount: trendingNews.length,
        itemBuilder: (_, i) {

          final item = trendingNews[i];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 10,
                  offset: const Offset(0,4),
                )
              ],
            ),
            child: Stack(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item["image"],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.6),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Text(
                    item["title"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  /// CATEGORY FILTER
  Widget _categories() {

    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (_, index) {

          final category = categories[index];
          final selected = selectedCategory == category;

          return GestureDetector(
            onTap: () {

              setState(() {
                selectedCategory = category;
              });

              filterNews();
            },

            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              decoration: BoxDecoration(
                color: selected
                    ? Colors.deepOrange
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                category,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {

  final String title;
  final String desc;
  final String image;
  final String time;

  const NewsCard({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/news-detail',
          arguments: {
            'title': title,
            'image': image,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 8,
              offset: const Offset(0,3),
            )
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 90,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}