
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {
        'title': 'New user registered',
        'description': 'A new account was created',
        'time': '10 min ago',
        'icon': Icons.person_add_alt_1_outlined,
        'color': AppColors.primary,
      },
      {
        'title': 'Course submitted',
        'description': 'A course is awaiting approval',
        'time': '30 min ago',
        'icon': Icons.menu_book_outlined,
        'color': AppColors.orange,
      },
      {
        'title': 'Collaborator approved',
        'description': 'A collaborator account was approved',
        'time': '1 hour ago',
        'icon': Icons.verified_outlined,
        'color': AppColors.green,
      },
      {
        'title': 'Course published',
        'description': 'A course was published on the platform',
        'time': '2 hours ago',
        'icon': Icons.publish_outlined,
        'color': AppColors.primary,
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.dark,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Latest updates across your platform',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.grey,
            ),
          ),

          const SizedBox(height: 20),

          ...activities.map((activity) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: (activity['color'] as Color)
                          .withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      activity['icon'] as IconData,
                      color: activity['color'] as Color,
                      size: 21,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity['title'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.dark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          activity['description'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    activity['time'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
