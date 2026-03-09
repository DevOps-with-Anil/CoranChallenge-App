import 'package:flutter/material.dart';

class FeaturedChallengeTab extends StatelessWidget {
  const FeaturedChallengeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          
          // Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Featured Challenges",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Challenge Cards
          _buildChallengeCard(
            context,
            title: "Surah Rahman Recitation Challenge",
            description: "Record your recitation and participate in the global competition.",
            participants: 182,
            timeLeft: "8 Days Left",
            progress: 0.65,
          ),
          
          _buildChallengeCard(
            context,
            title: "Tajweed Excellence Award",
            description: "Demonstrate your mastery of Tajweed rules in this special challenge.",
            participants: 245,
            timeLeft: "12 Days Left",
            progress: 0.45,
          ),
          
          _buildChallengeCard(
            context,
            title: "Quran Memorization Sprint",
            description: "Memorize and recite selected verses within the time limit.",
            participants: 156,
            timeLeft: "5 Days Left",
            progress: 0.80,
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(
    BuildContext context, {
    required String title,
    required String description,
    required int participants,
    required String timeLeft,
    required double progress,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Progress",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.people, size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "$participants",
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),
              const Icon(Icons.timer, size: 18, color: Colors.red),
              const SizedBox(width: 4),
              Text(
                timeLeft,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: const Text(
                "Participate Now",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
