import 'package:flutter/material.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/styles_manager.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    this.onTap,
    super.key,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: 14.marginRight,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
            ),
            child: Image.network(
              "https://www.oekotest.de/static_files/images/article/Welches-Haustier-passt-zu-mir_Dora-Zett-Shutterstock_11586_lead.jpg",
              height: 129,
              width: 248.width,
            ),
          ),
          10.verticalSpace,
          Text(
            "Cat GroComing Tips",
            style: bodyRegular(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
