import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:patient/core/localization/app_localizations.dart';
// import 'package:patient/core/pocketbase/pocketbase_helper.dart';
import 'package:patient/providers/_main.dart';
import 'package:patient/providers/locale_px.dart';
import 'package:patient/router/router.dart';
import 'package:patient/theme/app_theme.dart';
import 'package:patient/utils/utils_keys.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy();
  runApp(const AppProvider());

  // final pb = PocketbaseHelper();
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxLocale>(
      builder: (context, l, _) {
        return MaterialApp.router(
          scaffoldMessengerKey: UtilsKeys.scaffoldMessengerKey,
          title: "ProKliniK Patients",
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          locale: l.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) {
            child = EasyLoading.init()(context, child);
            return child;
          },
          theme: AppTheme.theme,
        );
      },
    );
  }
}
