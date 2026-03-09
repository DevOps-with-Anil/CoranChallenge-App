import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedTab = 0;

  final List<NotificationItem> _todayNotifications = [
    NotificationItem(
      title: "coran challenge has posted new",
      subtitle: "europe news \"Ukraine's President Zele...\"",
      time: "15m ago",
      isRead: false,
      avatar: "assets/images/app_icon.png",
      hasFollowButton: false,
    ),
    NotificationItem(
      title: "Modelyn Saris is now",
      subtitle: "following you",
      time: "1h ago",
      isRead: false,
      avatar: null,
      hasFollowButton: true,
    ),
    NotificationItem(
      title: "Omar Merditz comment to your",
      subtitle: "news \"Minting Your First NFT: A...\"",
      time: "1h ago",
      isRead: false,
      avatar: null,
      hasFollowButton: false,
    ),
  ];

  final List<NotificationItem> _yesterdayNotifications = [
    NotificationItem(
      title: "Marley Botosh is now",
      subtitle: "following you",
      time: "1 Day ago",
      isRead: true,
      avatar: null,
      hasFollowButton: true,
    ),
    NotificationItem(
      title: "Modelyn Saris likes your news",
      subtitle: "\"Minting Your First NFT: A...\"",
      time: "1 Day ago",
      isRead: true,
      avatar: null,
      hasFollowButton: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          // Header with Search and Filter
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Notification",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Search Bar with Filter Icon
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
                          decoration: InputDecoration(
                            hintText: "Search Notification...",
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
                const SizedBox(height: 12),
                
                // Tabs
                Row(
                  children: [
                    _buildTab("All", 0),
                    const SizedBox(width: 8),
                    _buildTab("Read 10", 1),
                    const SizedBox(width: 8),
                    _buildTab("Unread 20", 2),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Notification List
          Expanded(
            child: _buildNotificationList(),
          ),
        ],
      ),
    );
  }


  Widget _buildTab(String label, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        // Today Section
        const Text(
          "Today, March 3",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),

        ..._todayNotifications.map((notification) {
          return _buildNotificationCard(notification);
        }),

        const SizedBox(height: 20),

        // Yesterday Section
        const Text(
          "Yesterday, March 2",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),

        ..._yesterdayNotifications.map((notification) {
          return _buildNotificationCard(notification);
        }),
      ],
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: notification.isRead ? const Color(0xFFF0F0F0) : const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: notification.avatar != null
                ? AssetImage(notification.avatar!)
                : null,
            child: notification.avatar == null
                ? const Icon(Icons.person, color: Colors.white, size: 28)
                : null,
          ),

          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(text: notification.title),
                      if (notification.subtitle.isNotEmpty)
                        TextSpan(
                          text: " ${notification.subtitle}",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  notification.time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
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

class NotificationItem {
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;
  final String? avatar;
  final bool hasFollowButton;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
    this.avatar,
    required this.hasFollowButton,
  });
}