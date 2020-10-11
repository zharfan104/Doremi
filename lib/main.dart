import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // tes aja hehehe
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doremi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Montserrat",
          primaryColor: darkGrey,
          accentColor: darkGrey,
          errorColor: darkAqua,
          textSelectionColor: darkGrey,
          textSelectionHandleColor: darkGrey,
          hintColor: darkGrey),
      builder: ExtendedNavigator.builder<Router>(
        router: Router(),
        initialRoute: Routes.InitialRoute,
      ),
      // routes: routes
    );
  }
}
