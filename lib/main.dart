import 'package:flutter/material.dart';
import 'package:pet_care_second_version/features/base_provider/base_provider.dart';
import 'package:pet_care_second_version/resources/theme_manager.dart';
import 'package:pet_care_second_version/routing/routing_module.dart';
import 'package:pet_care_second_version/utils/app_config.dart';
import 'package:pet_care_second_version/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'features/home/controllers/home_provider.dart';
import 'features/notification/provider/notification_provider.dart';
import 'features/onboarding/core/on_boarding_provider.dart';
import 'features/shop/controllers/product_provider.dart';
import 'locator.dart';

Future<void> main() async {

  await init();
  sl<NotificationProvider>().initNotification();
  sl<AppConfig>().loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider.value(value: sl<ProductProvider>()),
        ChangeNotifierProvider.value(value: sl<HomeProvider>()),
        ChangeNotifierProvider.value(value: sl<NotificationProvider>()),
        ChangeNotifierProvider.value(value: sl<BaseProvider>()),
      ],
      child: Builder(
        builder: (context) {
          ResponsiveUtil.init(context);
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Pet Care',
              theme: ThemeManager.lightTheme,
              scaffoldMessengerKey: Helpers.scaffoldKey,
              initialRoute: RouteNames.splashScreen,
              navigatorKey: RouteService.serviceNavi.navKey,
              onGenerateRoute: RoutsGenerate.generateRoute,
            ),
          );
        },
      ),
    );
  }
}