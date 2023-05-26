import 'package:flutter/material.dart';
import 'package:kooho_test/utils/colors.dart';
import 'package:kooho_test/widgets/chip_selector.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabBar,
    required this.currentTab,
  });

  final List<String> tabBar;
  final ValueNotifier<String> currentTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: tabBar
          .map(
            (e) => ValueListenableBuilder(
              valueListenable: currentTab,
              builder: (context, value, child) => ChipSelector(
                text: e,
                ontap: () {
                  currentTab.value = e;
                },
                bgColor: currentTab.value == e
                    ? AppColors.amber0D
                    : AppColors.black33,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: currentTab.value == e
                          ? AppColors.black1A
                          : AppColors.grey66,
                    ),
                veriticalPadding: 10,
                border: const Border(),
              ),
            ),
          )
          .toList(),
    );
  }
}
