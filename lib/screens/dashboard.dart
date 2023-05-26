import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kooho_test/screens/bookings.dart';
import 'package:kooho_test/screens/browse_screen.dart';
import 'package:kooho_test/screens/inbox.dart';
import 'package:kooho_test/screens/profile.dart';
import 'package:kooho_test/utils/assets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return IndexedStack(
            index: currentIndex.value,
            children: const [
              BrowseScreen(),
              Bookings(),
              Inbox(),
              Profile(),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: currentIndex),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  final ValueNotifier<int> currentIndex;
  static final bottomItems = [
    {"Browse": Assets.browse},
    {"Bookings": Assets.bookings},
    {"Inbox": Assets.inbox},
    {"Profile": Assets.profile},
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerTheme.color!,
              ),
            ),
          ),
          child: BottomNavigationBar(
            items: bottomItems
                .map(
                  (e) => BottomNavigationBarItem(
                    label: e.keys.first,
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                      child: SvgPicture.asset(
                        e.values.first,
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor,
                      ),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SvgPicture.asset(
                        e.values.first,
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .selectedItemColor,
                      ),
                    ),
                  ),
                )
                .toList(),
            currentIndex: currentIndex.value,
            onTap: (index) => currentIndex.value = index,
          ),
        );
      },
    );
  }
}
