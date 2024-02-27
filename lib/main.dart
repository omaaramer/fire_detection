import 'package:chat_app/constants/app_routes.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //ensure that data needed is ready for use
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   /* dark theme settings */
      // ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRout,
    );
  }
}
