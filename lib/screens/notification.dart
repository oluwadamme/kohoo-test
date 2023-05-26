import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kooho_test/utils/assets.dart';
import 'package:kooho_test/utils/colors.dart';
import 'package:kooho_test/widgets/chip_selector.dart';
import 'package:kooho_test/widgets/custom_tab_bar.dart';
import 'package:kooho_test/widgets/nofity_list_tile.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  final tabBar = ['All', "Activity", "Updates"];
  ValueNotifier<String> currentTab = ValueNotifier<String>('All');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              Assets.backButton,
              width: 40,
              height: 40,
            ),
          ),
        ),
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.whiteFF),
        ),
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(tabBar: tabBar, currentTab: currentTab),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Text(
                    "Today",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey4D,
                        ),
                  ),
                  const SizedBox(height: 15),
                  NofityListTile(
                    titles: [
                      NottyObj("Your video from", false),
                      NottyObj("Bimbo Ayomye", true),
                      NottyObj("is ready!!!", false),
                    ],
                    subtitle: Padding(
                      padding: const EdgeInsets.only(right: 175.0),
                      child: ChipSelector(
                        text: "Watch video",
                        ontap: () {},
                        bgColor: AppColors.black33,
                        veriticalPadding: 10,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.amber0D,
                            ),
                      ),
                    ),
                  ),
                  NofityListTile(
                    titles: [
                      NottyObj("Bimbo Ayomye", true),
                      NottyObj(
                        "has accepted your booking request. Sit back and wait for your video.",
                        false,
                      ),
                    ],
                    subtitle: Container(),
                  ),
                  NofityListTile(
                    titles: [
                      NottyObj("Bimbo Ayomye", true),
                      NottyObj(
                        "rejected your booking request because",
                        false,
                      ),
                      NottyObj(
                        "“The instruction provided is not clear enough for them to accept the booking request.”",
                        true,
                      ),
                    ],
                    subtitle: Container(),
                  ),
                  NofityListTile(
                    titles: [
                      NottyObj("Bimbo Ayomye", true),
                      NottyObj("sent you a message. Check your inbox", false),
                    ],
                    subtitle: Padding(
                      padding: const EdgeInsets.only(right: 175.0),
                      child: ChipSelector(
                        text: "Open inbox",
                        ontap: () {},
                        bgColor: AppColors.black33,
                        veriticalPadding: 10,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.amber0D,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Yesterday",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey4D,
                        ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: SvgPicture.asset(
                        Assets.icon,
                        width: 32,
                        height: 32,
                      ),
                    ),
                    minVerticalPadding: 0,
                    title: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.black33,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Your payment of ₦32,500 has been refunded to your bank account.',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.amber0D,
                            ),
                      ),
                    ),
                    subtitle: Text(
                      "Apr 20, 2022 | 04:05 AM",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.grey66,
                            fontSize: 10,
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NottyObj {
  final String text;
  final bool colored;

  NottyObj(this.text, this.colored);
}
