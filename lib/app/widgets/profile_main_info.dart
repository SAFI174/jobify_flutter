import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobify/app/data/constants.dart';
import 'package:jobify/app/data/models/user/user.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            width: 125.0,
            height: 125.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          imageUrl:
              "$mainUrl${user.profilePhoto == 'null' ? '/assets/img/can-1.png' : '${user.profilePhoto}'}",
          errorWidget: (context, url, error) => const SizedBox(
            width: 150.0,
            height: 150.0,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/png/male.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${user.firstname!} ${user.lastname!}",
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            user.isConfirmedIdPhoto ?? false
                ? SvgPicture.asset('assets/svg/check.svg')
                : const SizedBox()
          ],
        ),
        Text(user.bio ??
            (user.type == 0 ? 'a Freelancer' : 'a Project Manager')),
        const SizedBox(
          height: 5,
        ),
        Chip(
          shape: const LinearBorder(),
          avatar: const Icon(FluentIcons.clock_12_regular),
          label: Text(DateTime.parse(user.lastSeen!).toString().split('.')[0]),
        ),
      ],
    );
  }
}
