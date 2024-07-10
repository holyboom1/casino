import '../../core/di/app_di.dart';
import '../app_router/app_router.dart';
import '../app_router/services/auth_service.dart';

void setupNavigationDependencies() {
  appLocator.registerSingleton<AuthService>(AuthService());

  appLocator.registerSingleton<AppRouter>(AppRouter());
}
