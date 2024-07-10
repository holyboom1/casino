import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/app_di.dart';
import 'core_ui/theme/app_theme.dart';
import 'core_ui/widgets/localization_inherited.dart';
import 'navigation/app_router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onChangeLocale(Locale locale) {
      context.setLocale(locale).then(
            (void value) => setState(
              () {},
            ),
          );
    }

    return ScreenUtilInit(
      designSize: const Size(1200, 1920),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (BuildContext context, Widget? child) => LocalizationWidget(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            ...context.localizationDelegates,
          ],
          supportedLocales: context.supportedLocales,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          locale: context.locale,
          routeInformationParser: appLocator<AppRouter>().router.routeInformationParser,
          routeInformationProvider: appLocator<AppRouter>().router.routeInformationProvider,
          routerDelegate: appLocator<AppRouter>().router.routerDelegate,
        ),
        onChangeLocale,
      ),
    );
  }
}
