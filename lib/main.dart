import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_flogin/log_page.dart';
import 'package:social_flogin/login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: LogInPage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Facebook SignIn App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LogInPage(),
      ),
    );
  }
}
