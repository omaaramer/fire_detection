import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'constants/app_routes.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Box? mybox;
Future<Box> openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(boxname);
}

void main() async {
  await Hive.initFlutter();

  WidgetsFlutterBinding
      .ensureInitialized(); //ensure that data needed is ready for use
  mybox = await openHiveBox("userinfo");
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
      darkTheme: ThemeData(fontFamily: "Rubik"),
      // brightness: Brightness.dark,
      /* dark theme settings */
      // ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRout,
    );
  }
}
