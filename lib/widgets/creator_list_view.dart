import 'package:flutter/material.dart';
import 'package:kooho_test/models/creator_model.dart';
import 'package:kooho_test/utils/colors.dart';
import 'package:kooho_test/widgets/creator_card.dart';

class CreatorListView extends StatelessWidget {
  const CreatorListView({
    super.key,
    required this.title,
    required this.creator,
    this.last = false,
  });
  final String title;
  final List<CreatorModel> creator;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey4D,
                    ),
              ),
              const Spacer(),
              Text(
                "See all",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.amber0D,
                    ),
              ),
              const SizedBox(width: 20)
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: 266,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: creator
                    .map(
                      (e) => CreatorCard(creatorModel: e),
                    )
                    .toList(),
              ),
            ),
          ),
          if (!last)
            const Padding(
              padding: EdgeInsets.only(right: 20.0, bottom: 20),
              child: Divider(),
            ),
        ],
      ),
    );
  }
}
