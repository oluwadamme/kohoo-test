import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kooho_test/data/creators.dart';
import 'package:kooho_test/utils/assets.dart';
import 'package:kooho_test/utils/colors.dart';
import 'package:kooho_test/utils/routers.dart';
import 'package:kooho_test/widgets/chip_selector.dart';
import 'package:kooho_test/widgets/creator_list_view.dart';
import 'package:kooho_test/widgets/custom_text_form.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final roleList = [
    'Actors',
    "Athletes",
    "Comedians",
    "Content Creators",
    "Artistes",
    "Others"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Browse"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => context.pushNamed(AppRoutes.notification),
              child: SvgPicture.asset(
                Assets.notificationCircle,
                width: 24,
                height: 24,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextForm(
                controller: TextEditingController(),
                validator: (p0) {},
                prefix: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    Assets.search,
                    width: 20,
                    height: 20,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.grey4D,
                    ),
                hint: "Search",
                borderColor: AppColors.black33,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: roleList
                      .map(
                        (e) => ChipSelector(
                          text: e,
                          ontap: () {},
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: AppColors.black33,
              thickness: 1.2,
            ),
            const SizedBox(height: 15),
            CreatorListView(
              creator: featured,
              title: "Featured",
            ),
            CreatorListView(
              creator: trending,
              title: "Trending",
            ),
            CreatorListView(
              creator: noteworthy,
              title: "New & Noteworthy",
            ),
            CreatorListView(
              creator: actors,
              title: "Actors",
            ),
            CreatorListView(
              creator: musician,
              title: "Musicians",
              last: true,
            ),
          ],
        ),
      ),
    );
  }
}
