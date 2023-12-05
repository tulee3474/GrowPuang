import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/login/LoginPage.dart';


Future<void> main() async {
  await initializeApp();
  runApp(const MyApp());
}

FirebaseOptions getFirebaseOptions() {
  return FirebaseOptions( // Replace with actual values
    apiKey: "${dotenv.env['API_KEY']}",
    appId: "${dotenv.env['APP_ID']}",
    messagingSenderId: "515663394442",
    projectId: "GrowPuang",
  ); // Firebase 초기화
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  await Firebase.initializeApp(options: getFirebaseOptions());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); //스크린유틸 초기화
    return ScreenUtilInit(
      designSize: const Size(570, 907),
      builder: (BuildContext context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          useMaterial3: true,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              for (var platform in TargetPlatform.values)
                platform: const NoTransitionsBuilder(),
            },
          ),
        ),
        home: const LogInPage(),
        // const firstPage(title: 'Flutter Demo Home Page'),
        //getPages: pageRoutingController.makeNewTravelPageList,
      ),
    );
  }
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
