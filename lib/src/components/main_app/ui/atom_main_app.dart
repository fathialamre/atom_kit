import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AtomMainApp extends StatelessWidget {
  const AtomMainApp({
    super.key,
    required this.bindings,
    required this.routes,
    required this.initialRoute,
  });

  final Bindings bindings;
  final String initialRoute;
  final List<GetPage<dynamic>> routes;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? widget) {
        return GetMaterialApp(
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context),
              child: widget!,
            );
          },
          theme: FlexThemeData.light(
            scheme: FlexScheme.blue,
            useMaterial3: true,
          ),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.blue,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.light,
          locale: Get.locale,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          initialBinding: bindings,
          initialRoute: initialRoute,
          getPages: routes,
        );
      },
    );
  }
}
