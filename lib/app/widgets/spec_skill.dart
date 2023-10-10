import 'package:flutter/material.dart';
import 'package:jobify/app/data/models/user/freelancer.dart';

class SpecSkillWidget extends StatelessWidget {
  const SpecSkillWidget({Key? key, required this.user}) : super(key: key);

  final Freelancer user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildChips(List<String?>? items, String title) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                if (items == null || items.isEmpty)
                  Text('No $title found')
                else
                  ...items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Chip(
                        padding: const EdgeInsets.all(1),
                        label: Text(item!),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    return Column(
      children: [
        buildChips(
            user.specSkills?.map((spec) => spec.specializationName).toList(),
            'Specializations'),
        buildChips(
            user.specSkills?.map((spec) => spec.skillName).toList(), 'Skills'),
      ],
    );
  }
}
