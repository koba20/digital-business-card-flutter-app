import 'package:fire_app/firebase_options.dart';
import 'package:fire_app/providers/user_provider.dart';
import 'package:fire_app/responsive/mobilescreen_layout.dart';
import 'package:fire_app/responsive/responsive_layout.dart';
import 'package:fire_app/responsive/webscreen_layout.dart';
import 'package:fire_app/screens/authentication/login.dart';
import 'package:fire_app/screens/authentication/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // theme: ThemeData.dark()
            //     .copyWith(scaffoldBackgroundColor: Colors.black26),
            home: StreamBuilder(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return const ResponsiveLayout(
                          mobileScreenLayout: MobileScreenLayout(),
                          webScreenLayout: WebScreenLayout());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  return Login();
                }),
          );
        },
        //child: HomePage(title: 'First Method'),
      ),
    );
  }
}
