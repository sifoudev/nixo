import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/features/Calendar/presentation/pages/calendar_screen.dart';
import 'package:nixo/features/pomodoro/presentation/pages/pomodoro_screen.dart';
import 'package:nixo/features/settings/presentation/pages/settings_screen.dart';
import 'package:nixo/features/tasks/presentation/pages/tasks_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreentState();
}

class _MainScreentState extends State<MainScreen> {
  final int _currentPage = 0;
  late PersistentTabController _presistentController;

  @override
  void initState() {
    _presistentController = PersistentTabController(initialIndex: _currentPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: AppColors.system,
        body: _buildBottomNavBar());
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.folder_outlined,
            color: AppColors.appBarIConColor.withOpacity(0.7),
          )),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColors.appBarIConColor.withOpacity(0.7),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: AppColors.appBarIConColor.withOpacity(0.7),
              ),
            )
          ],
        )
      ],
      backgroundColor: AppColors.system,
      elevation: 0,
    );
  }

  _buildBottomNavBar() {
    return PersistentTabView(
      context,
      controller: _presistentController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.navbarColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CalendarScreen(),
      const TasksScreen(),
      const PomodoroScreen(),
      const SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Calendar"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Tasks"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Pomodoro"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
    ];
  }
}
