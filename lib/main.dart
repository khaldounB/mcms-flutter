// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sizer/sizer.dart';

// Project imports:
import 'core/logic/singleton/singleton.dart';
import 'core/logic/singleton/statics.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await singletone();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router.router,
        );
      },
    );
  }
}
