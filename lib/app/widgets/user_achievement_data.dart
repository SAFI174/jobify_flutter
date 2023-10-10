import 'package:flutter/material.dart';

class UserAchievement extends StatelessWidget {
  const UserAchievement({super.key, required this.user});
  final dynamic user;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return user.type == 0
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              achievementWidget(
                theme: theme,
                achievementName: 'Done Project',
                achievementData: user.doneProjects,
                color: Colors.green,
              ),
              const SizedBox(height: 40, child: VerticalDivider()),
              achievementWidget(
                theme: theme,
                achievementName: 'Accepted Request',
                achievementData: user.acceptedRequests,
                color: Colors.blue,
              ),
              const SizedBox(height: 40, child: VerticalDivider()),
              achievementWidget(
                theme: theme,
                achievementName: 'Requests',
                achievementData: user.underReviewRequests,
                color: Colors.red,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              achievementWidget(
                theme: theme,
                achievementName: 'Done Project',
                achievementData: user.projectCompleted,
                color: Colors.green.shade600,
              ),
              const SizedBox(height: 40, child: VerticalDivider()),
              achievementWidget(
                theme: theme,
                achievementName: 'Highest Paid',
                achievementData: user.highestPaid,
                color: Colors.blue.shade600,
              ),
              const SizedBox(height: 40, child: VerticalDivider()),
              achievementWidget(
                theme: theme,
                achievementName: 'Project Count',
                achievementData: user.projectCount,
                color: Colors.red.shade600,
              ),
            ],
          );
  }

  Widget achievementWidget(
      {required ThemeData theme,
      required String achievementName,
      required achievementData,
      required Color color}) {
    return Column(
      children: [
        Text(
          achievementData.toString(),
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        Text(
          achievementName,
          style: theme.textTheme.labelSmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
