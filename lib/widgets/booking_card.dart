import 'package:flutter/material.dart';
import 'package:kooho_test/utils/colors.dart';
import 'package:kooho_test/widgets/chip_selector.dart';
import 'package:kooho_test/widgets/nofity_list_tile.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackE1,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.black33),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfilePic(),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Bimbo Ademoye",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.whiteFF,
                          fontSize: 14,
                        ),
                  ),
                  Text(
                    'Actress',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.grey66,
                          fontSize: 12,
                        ),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 90,
                height: 30,
                child: ChipSelector(
                  text: "Completed",
                  ontap: () {},
                  bgColor: AppColors.green53,
                  veriticalPadding: 3,
                  horizontalPadding: 8,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteFF,
                      ),
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            title: Text(
              "Occassion",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.grey66,
                    fontSize: 12,
                  ),
            ),
            subtitle: Text(
              "Birthday",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.amber0D,
                    fontSize: 14,
                  ),
            ),
            trailing: Text(
              "4 days ago",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.grey66,
                    fontSize: 12,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
