import 'package:flutter/material.dart';

class ChallengeTab extends StatefulWidget {
  const ChallengeTab({super.key});

  @override
  State<ChallengeTab> createState() => _ChallengeTabState();
}

class _ChallengeTabState extends State<ChallengeTab> {

  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Recitation",
    "Memorization",
    "Quiz",
    "Community"
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        const ChallengeSearchBar(),

        const SizedBox(height: 8),

        ChallengeCategories(
          categories: categories,
          selected: selectedCategory,
          onSelect: (value){
            setState(() {
              selectedCategory = value;
            });
          },
        ),

        const SizedBox(height: 10),

        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
            },

            child: ListView(
              padding: const EdgeInsets.all(16),

              children: [

                const TrendingChallengeBanner(),

                const SizedBox(height: 20),

                ...List.generate(
                  4,
                  (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ChallengeCard(),
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChallengeSearchBar extends StatelessWidget {
  const ChallengeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(16,16,16,8),

      child: TextField(
        decoration: InputDecoration(

          hintText: "Search challenge",

          prefixIcon: const Icon(Icons.search),

          filled: true,
          fillColor: Colors.grey.shade100,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class ChallengeCategories extends StatelessWidget {

  final List<String> categories;
  final String selected;
  final Function(String) onSelect;

  const ChallengeCategories({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 40,

      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,

        itemBuilder: (_, index) {

          final category = categories[index];
          final isSelected = category == selected;

          return GestureDetector(
            onTap: () => onSelect(category),

            child: Container(
              margin: const EdgeInsets.only(right: 10),

              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.deepOrange
                    : Colors.grey.shade200,

                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                category,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TrendingChallengeBanner extends StatelessWidget {
  const TrendingChallengeBanner({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 160,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),

        image: const DecorationImage(
          image: AssetImage("assets/dummy/challenges-thumbnail.jpg"),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          gradient: const LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black87
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: const Align(
          alignment: Alignment.bottomLeft,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                "🔥 Trending Challenge",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 4),

              Text(
                "Surah Rahman Recitation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 10,
          )
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Quran Memorization Challenge",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Memorize Surah Mulk and submit your recitation.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            const Text("Challenge Progress"),

            const SizedBox(height: 6),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),

              child: LinearProgressIndicator(
                value: 0.6,
                minHeight: 8,
                backgroundColor: Colors.grey.shade200,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: const [

                Icon(Icons.people, size: 18, color: Colors.grey),

                SizedBox(width: 6),

                Text("120 participants"),

                Spacer(),

                Icon(Icons.timer, size: 18, color: Colors.red),

                SizedBox(width: 6),

                CountdownTimer(),
              ],
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () {},

                child: const Text(
                  "Participate",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {

  int seconds = 120;

  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));

      if(seconds == 0) return false;

      setState(() {
        seconds--;
      });

      return true;
    });
  }

  @override
  Widget build(BuildContext context) {

    int min = seconds ~/ 60;
    int sec = seconds % 60;

    return Text("$min:${sec.toString().padLeft(2,'0')}");
  }
}