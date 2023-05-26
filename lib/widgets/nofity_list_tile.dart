import 'package:flutter/material.dart';
import 'package:kooho_test/screens/notification.dart';
import 'package:kooho_test/utils/assets.dart';
import 'package:kooho_test/utils/colors.dart';

class NofityListTile extends StatelessWidget {
  const NofityListTile({
    super.key,
    this.subtitle,
    required this.titles,
  });
  final Widget? subtitle;
  final List<NottyObj> titles;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const ProfilePic(),
          isThreeLine: true,
          minVerticalPadding: 15,
          subtitle: subtitle,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.greyAA,
                      ),
                  children: [
                    ...titles
                        .map(
                          (e) => TextSpan(
                            text: "${e.text} ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: e.colored == true
                                      ? AppColors.whiteFF
                                      : AppColors.greyB3,
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Apr 20, 2022 | 04:05 AM",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.grey66,
                      fontSize: 10,
                    ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: Image.asset(
        Assets.pic,
        width: 32,
        height: 32,
      ),
    );
  }
}
