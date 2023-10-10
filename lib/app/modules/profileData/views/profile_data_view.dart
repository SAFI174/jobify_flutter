import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobify/app/data/enums/user_type.dart';
import 'package:jobify/app/data/models/user/freelancer.dart';
import 'package:jobify/app/widgets/profile_main_info.dart';
import 'package:jobify/app/widgets/spec_skill.dart';
import 'package:jobify/app/widgets/user_achievement_data.dart';
import 'package:jobify/app/widgets/user_contact_info.dart';
import 'package:jobify/app/widgets/work_experiences_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/profile_data_controller.dart';

class ProfileDataView extends GetView<ProfileDataController> {
  const ProfileDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Obx(
          () {
            return Text(
              controller.userType.value == UserType.freelancer
                  ? 'Freelancer Profile'
                  : 'Project Manager Profile',
              style: const TextStyle(fontSize: 18),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          PopupMenuButton(
            surfaceTintColor: theme.colorScheme.surfaceVariant,

            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
            itemBuilder: (context) {
              return const [
                PopupMenuItem<int>(
                  padding: EdgeInsets.zero,
                  value: 0,
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.edit),
                    title: Text('Edit Account'),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  padding: EdgeInsets.zero,
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.add),
                    title: Text("Add Work Experiance"),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  padding: EdgeInsets.zero,
                  child: ListTile(
                    dense: true,
                    leading: Icon(Icons.perm_identity),
                    title: Text("Confirm ID Photo"),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
              } else if (value == 1) {
              } else if (value == 2) {}
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () {
          return controller.refreshUserData();
        },
        child: Obx(
          () {
            return controller.isDataLoaded.value
                ? SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Center(
                      child: SizedBox(
                        width: 90.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            ProfileInfo(user: controller.user.value),
                            const SizedBox(
                              height: 20,
                            ),
                            UserAchievement(user: controller.user.value),
                            const SizedBox(
                              height: 10,
                            ),
                            controller.user.value.type == 0
                                ? const Divider(height: 30)
                                : const SizedBox(),
                            controller.user.value.type == 0
                                ? SpecSkillWidget(
                                    user: controller.user.value as Freelancer)
                                : const SizedBox(),
                            controller.user.value.type == 0
                                ? const Divider(height: 30)
                                : const SizedBox(),
                            controller.user.value.type == 0
                                ? WorkExperiencesList(
                                    theme: theme,
                                    freelancer:
                                        controller.user.value as Freelancer,
                                  )
                                : const SizedBox(),
                            const Divider(
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child:
                                  UserContactInfo(user: controller.user.value),
                            ),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                  elevation: 5, minimumSize: Size(90.w, 50)),
                              onPressed: () {},
                              child: const Text(
                                "Logout",
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
