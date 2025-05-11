import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/presentation/router/app_router.dart';
import 'package:flutter_project/presentation/router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helper/constant/constants_resource.dart';
import 'helper/constant/dimensions_resource.dart';
import 'helper/theme/app_theme.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {

  final router = AppRouter();

  runApp(MyApp(appRouter: router,));
}

final GlobalKey<NavigatorState> globalNavigator = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(
        ConstantsResource.APP_DESIGN_WIDTH,
        ConstantsResource.APP_DESIGN_HEIGHT,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: DimensionsResource.D_1,
              ),
              child: child ?? Container(),
            );
          },
          initialRoute: SPLASH_SCREEN_ROUTE,
          debugShowCheckedModeBanner: false,
          navigatorKey: globalNavigator,
          theme: AppTheme.theme,
          onGenerateRoute: widget.appRouter.generateRoute,
          navigatorObservers: <NavigatorObserver>[routeObserver],
        );
      },
    );
  }

  @override
  void dispose() {
    widget.appRouter.dispose();
    super.dispose();
  }
}

