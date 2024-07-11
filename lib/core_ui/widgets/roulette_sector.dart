import 'package:flutter/cupertino.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../theme/app_images.dart';
import 'app_image.dart';

class RouletteSector extends StatelessWidget {
  final String number;
  final Color? color;

  const RouletteSector({
    required this.number,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: color ?? AppColors.of(context).basicBlue,
        borderRadius: BorderRadius.circular(78),
      ),
      child: Column(
        children: <Widget>[
          Text(
            number,
            style: AppFonts.playfairDisplay.copyWith(
              color: AppColors.of(context).basicWhite,
              fontSize: 146,
            ),
          ),
          const AppImage(image: AppImages.eclipseIcon),
        ],
      ),
    );
  }
}
