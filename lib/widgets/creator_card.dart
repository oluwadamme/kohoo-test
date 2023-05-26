import 'package:flutter/material.dart';
import 'package:kooho_test/models/creator_model.dart';
import 'package:kooho_test/utils/colors.dart';

class CreatorCard extends StatelessWidget {
  const CreatorCard({
    super.key,
    required this.creatorModel,
  });
  final CreatorModel creatorModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: 153,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(creatorModel.asset),
            ),
            const SizedBox(height: 10),
            Text(
              creatorModel.name,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.whiteFF),
            ),
            const SizedBox(height: 3),
            Text(
              creatorModel.role,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.grey66),
            ),
            const SizedBox(height: 6),
            Text(
              creatorModel.amount,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.amber0D),
            ),
          ],
        ),
      ),
    );
  }
}
