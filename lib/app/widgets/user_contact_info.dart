import 'package:flutter/material.dart';
import 'package:jobify/app/data/models/user/user.dart';

class UserContactInfo extends StatelessWidget {
  const UserContactInfo({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact info',
          style:
              theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(
              shape: const LinearBorder(),
              avatar: Icon(
                Icons.phone_outlined,
                color: theme.colorScheme.onBackground,
              ),
              label: Text(user.phoneNumber!),
            ),
            Chip(
              shape: const LinearBorder(),
              avatar: Icon(
                Icons.alternate_email,
                color: theme.colorScheme.onBackground,
              ),
              label: Text(user.email!),
            ),
            Chip(
              shape: const LinearBorder(),
              avatar: Icon(
                Icons.location_pin,
                color: theme.colorScheme.onBackground,
              ),
              label: Text(user.country ?? 'Not set'),
            ),
            Chip(
              shape: const LinearBorder(),
              avatar: Icon(
                Icons.language_outlined,
                color: theme.colorScheme.onBackground,
              ),
              label: Text(user.language ?? 'Not set'),
            ),
            Chip(
              shape: const LinearBorder(),
              avatar: Icon(
                Icons.male,
                color: theme.colorScheme.onBackground,
              ),
              label: const Text('Male'),
            ),
          ],
        ),
      ],
    );
  }
}
