import 'package:flutter/cupertino.dart';

import '../../core/core_export.dart';
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
      width: 300.r,
      height: 300.r,
      padding: const EdgeInsets.all(20).r,
      decoration: BoxDecoration(
        color: color ?? AppColors.of(context).basicBlue,
        borderRadius: BorderRadius.circular(78).r,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            number,
            style: AppFonts.playfairDisplay.copyWith(
              color: AppColors.of(context).basicWhite,
              fontSize: 100.sp,
            ),
          ),
          AppImage(
            image: AppImages.eclipseIcon,
            width: 146.w,
            height: 66.h,
          ),
        ],
      ),
    );
  }
}
