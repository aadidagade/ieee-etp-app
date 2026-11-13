
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/user_growth_chart.dart';
import '../widgets/recent_activity.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<String> menuItems = [
    'Dashboard',
    'User Management',
    'Course Management',
    'Collaborator Management',
    'Reports & Analytics',
    'Announcements',
    'Settings',
  ];

  final List<IconData> menuIcons = [
    Icons.dashboard_outlined,
    Icons.people_outline,
    Icons.menu_book_outlined,
    Icons.group_outlined,
    Icons.bar_chart_outlined,
    Icons.notifications_none,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;

          return Row(
            children: [
              // Sidebar Navigation
              NavigationRail(
                extended: isWide,
                minWidth: 75,
                minExtendedWidth: 235,
                backgroundColor: AppColors.white,
                selectedIndex: selectedIndex,

                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                selectedIconTheme: const IconThemeData(
                  color: AppColors.primary,
                ),

                selectedLabelTextStyle: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),

                unselectedLabelTextStyle: const TextStyle(
                  color: AppColors.grey,
                ),

                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: isWide
                      ? const Text(
                    'LearnHub',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  )
                      : const Icon(
                    Icons.school_outlined,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),

                destinations: List.generate(
                  menuItems.length,
                      (index) => NavigationRailDestination(
                    icon: Icon(menuIcons[index]),
                    label: Text(menuItems[index]),
                  ),
                ),
              ),

              const VerticalDivider(
                width: 1,
                thickness: 1,
                color: AppColors.border,
              ),

              // Main Dashboard Area
              Expanded(
                child: Column(
                  children: [
                    // Header
                    Container(
                      height: 75,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      color: AppColors.white,

                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              menuItems[selectedIndex],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.dark,
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.notifications_none,
                            color: AppColors.grey,
                          ),

                          const SizedBox(width: 20),

                          const CircleAvatar(
                            backgroundColor: Color(0xFFE9E9FF),
                            child: Icon(
                              Icons.person_outline,
                              color: AppColors.primary,
                            ),
                          ),

                          const SizedBox(width: 10),

                          if (isWide)
                            const Text(
                              'Admin',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark,
                              ),
                            ),
                        ],
                      ),
                    ),

                    // Dashboard Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(25),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome back, Admin!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.dark,
                              ),
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              'Here is what is happening on your platform.',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 28),

                            // Statistics Cards
                            Wrap(
                              spacing: 18,
                              runSpacing: 18,

                              children: const [
                                StatCard(
                                  title: 'Total Users',
                                  value: '2,450',
                                  icon: Icons.people_outline,
                                  color: AppColors.primary,
                                ),

                                StatCard(
                                  title: 'Total Courses',
                                  value: '128',
                                  icon: Icons.menu_book_outlined,
                                  color: AppColors.green,
                                ),

                                StatCard(
                                  title: 'Collaborators',
                                  value: '45',
                                  icon: Icons.groups_outlined,
                                  color: AppColors.orange,
                                ),

                                StatCard(
                                  title: 'Pending Approvals',
                                  value: '12',
                                  icon: Icons.pending_actions,
                                  color: AppColors.red,
                                ),
                              ],
                            ),

                            const SizedBox(height: 25),

                            // User Growth Chart
                            const UserGrowthChart(),

                            const SizedBox(height: 25),

                            // Recent Platform Activity
                            const RecentActivity(),

                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Reusable Statistics Card

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 27,
          ),

          const SizedBox(height: 18),

          Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.dark,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
