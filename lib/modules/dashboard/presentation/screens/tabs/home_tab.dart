import 'package:flutter/material.dart';
import 'dart:async';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeContent();
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _flashBanner(),
          const SizedBox(height: 6),
          _heroSection(),
          const SizedBox(height: 6),
          _adBanner(),
          _latestNews(),
          _challengeSection(),
          _adBanner(),
          _featuredVideos(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// FLASH BANNER
  Widget _flashBanner() {
    return Container(
      width: double.infinity,
      color: Colors.deepOrange,
      padding: const EdgeInsets.all(10),
      child: const Text(
        "🔥 Youth Tajweed Excellence Award - 8 Days Left",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  /// HERO SECTION
  Widget _heroSection() {
    return Stack(
      children: [
        Image.asset(
          "assets/dummy/challenges-thumbnail.jpg",
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 220,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(26, 0, 0, 0),
                Colors.black87,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        const Positioned(
          left: 16,
          right: 16,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Learn Quran with Expert Teachers",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Join live classes and improve your Quran recitation skills with certified teachers.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// ADS
  Widget _adBanner() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: AdsCarousel(
        images: ["assets/dummy/leaderboard-ad-2.jpg"],
        height: 50,
      ),
    );
  }

  /// SECTION HEADER
  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          const Text(
            "See all",
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  /// LATEST NEWS
  Widget _latestNews() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader("Latest News"),
          const SizedBox(height: 14),
          SizedBox(
            height: 230,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => _newsCard(),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 3,
            ),
          )
        ],
      ),
    );
  }

  /// NEWS CARD
  Widget _newsCard() {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.asset(
              "assets/dummy/challenges-thumbnail.jpg",
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
            child: Text(
              "New Quran Memorization Techniques",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Learn simple and effective techniques used by scholars to memorize the Quran faster.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Text(
              "2 hours ago",
              style: TextStyle(
                fontSize: 12,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// CHALLENGE SECTION
  Widget _challengeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader("Ongoing Challenges"),
          const SizedBox(height: 14),
          SizedBox(
            height: 240,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => const _HomeChallengeCard(),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }

  /// FEATURED VIDEOS
  Widget _featuredVideos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader("Featured Videos"),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(child: _VideoCard()),
                SizedBox(width: 10),
                Expanded(child: _VideoCard()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// CHALLENGE CARD
class _HomeChallengeCard extends StatelessWidget {
  const _HomeChallengeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Surah Rahman Recitation Challenge",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Record your recitation and participate in the global competition.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          const Text(
            "Progress",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.65,
              minHeight: 6,
              backgroundColor: Colors.grey.shade200,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.people, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text("182"),
              Spacer(),
              Icon(Icons.timer, size: 16, color: Colors.red),
              SizedBox(width: 4),
              _HomeCountdownTimer(),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 34,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text("Participate"),
            ),
          )
        ],
      ),
    );
  }
}

/// COUNTDOWN TIMER
class _HomeCountdownTimer extends StatefulWidget {
  const _HomeCountdownTimer();

  @override
  State<_HomeCountdownTimer> createState() => _HomeCountdownTimerState();
}

class _HomeCountdownTimerState extends State<_HomeCountdownTimer> {
  int seconds = 3600;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (seconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;

    return Text(
      "$min:${sec.toString().padLeft(2, '0')}",
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

/// VIDEO CARD
class _VideoCard extends StatelessWidget {
  const _VideoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/dummy/news-thumbnail.jpg",
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 36,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 4),
            child: Text(
              "Recitation Lesson",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Improve your Quran recitation with expert teachers and tajweed guidance.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(
              "05:35 mins",
              style: TextStyle(
                fontSize: 12,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ADS CAROUSEL
class AdsCarousel extends StatefulWidget {
  final List<String> images;
  final double height;

  const AdsCarousel({super.key, required this.images, this.height = 50});

  @override
  State<AdsCarousel> createState() => _AdsCarouselState();
}

class _AdsCarouselState extends State<AdsCarousel> {
  late final PageController _controller;
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = PageController();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;

      _index = (_index + 1) % widget.images.length;

      _controller.animateToPage(
        _index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.images.length,
        itemBuilder: (_, i) {
          return Image.asset(widget.images[i], fit: BoxFit.cover);
        },
      ),
    );
  }
}