import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core_ui/theme/app_colors.dart';
import '../../../core_ui/theme/app_images.dart';
import '../../../core_ui/widgets/app_image.dart';
import '../bloc/splash_bloc.dart';

class SplashForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (BuildContext context, SplashState state) {
          return Container(
            height: 1.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColors.of(context).primaryBg,
            ),
            child: Center(
              child: AppImage(
                image: AppImages.eclipseMain,
                width: 860.w,
                height: 460.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
