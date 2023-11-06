import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/model/get_device_unique_id.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/homeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 추가
  await dotenv.load(fileName: 'assets/config/.env'); // 추가

  await Firebase.initializeApp(
      // Replace with actual values
      options: FirebaseOptions(
    apiKey: "${dotenv.env['API_KEY']}",
    appId: "${dotenv.env['APP_ID']}",
    messagingSenderId: "515663394442",
    projectId: "GrowPuang",
  )); // Firebase 초기화

  final personalController = Get.put(PersonalController());
  personalController.userId = await getMobileId(); //모델 id 저장

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); //스크린유틸 초기화

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (var platform in TargetPlatform.values)
              platform: NoTransitionsBuilder(),
          },
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //final pageRoutingController = Get.put(PageRoutingController());
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (BuildContext context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightColorTheme,
        home: HomeScreen(),
        //getPages: pageRoutingController.makeNewTravelPageList,
      ),
    );
  }
}
