import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/splash_bloc.dart';

class SplashForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (BuildContext context, SplashState state) {
          return SizedBox(
            height: 1.sh,
            child: Placeholder(),
          );
        },
      ),
    );
  }
}
