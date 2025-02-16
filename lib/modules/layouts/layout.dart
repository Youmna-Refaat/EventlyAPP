import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import '../../core/routes/screens_route_names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import 'favourite/favourite_tab.dart';
import 'home/home_tab.dart';
import 'map/map_tab.dart';
import 'profile/profile_tab.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectedIndex = 0;
  List<Widget> layouts = [
    const HomeScreen(),
    const MapScreen(),
    const SizedBox(),
    const FavouritesScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goToNamed(routeName: ScreensRouteNames.createEventRoute);
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(
            side: BorderSide(
          color: AppColors.white,
          width: 3,
        )),
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white,
          currentIndex: selectedIndex,
          backgroundColor: AppColors.primaryColor,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_outlined,
                color: AppColors.white,
              ),
              activeIcon: const Icon(Icons.home),
              label: local.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.white,
              ),
              activeIcon: const Icon(Icons.location_on),
              label: local.map,
            ),
            const BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite_border_rounded,
                color: AppColors.white,
              ),
              activeIcon: const Icon(Icons.favorite),
              label: local.favorites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_outline_rounded,
                color: AppColors.white,
              ),
              activeIcon: const Icon(Icons.person),
              label: local.profile,
            ),
          ]),
      body: layouts[selectedIndex],
    );
  }

  _onItemTapped(int index) {
    selectedIndex = index;
    setState(() {});
  }
}
