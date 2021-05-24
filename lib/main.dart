import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aiyaya/main_pages/home_pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]).then((onVal) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1334, 750),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
    );
  }
}
