import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobify/app/data/services/user_cache_service.dart';
import 'package:jobify/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _scaffoldKey,
      drawer: const Drawer(
        width: 290,
        elevation: 0,
      ),
      appBar: PreferredSize(
        preferredSize: const Size(0, 65),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SearchBar(
              hintText: 'Search projects...',
              hintStyle: MaterialStatePropertyAll(
                  theme.textTheme.labelLarge!.copyWith(color: theme.hintColor)),
              trailing: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PROFILE_DATA);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 5, left: 5, top: 5),
                    child: CircleAvatar(
                        // backgroundImage: NetworkImage(
                        //     'http://mostafa1132-001-site1.atempurl.com/uploads/Users/2023/10/07/-135153559.jpg'),
                        ),
                  ),
                ),
              ],
              leading: DrawerButton(
                  style: IconButton.styleFrom(
                      highlightColor: theme.colorScheme.surfaceVariant)),
              backgroundColor:
                  MaterialStatePropertyAll(theme.colorScheme.surfaceVariant),
              elevation: const MaterialStatePropertyAll(0),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
