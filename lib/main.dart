import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shibinsale/pages/authscreen.dart';
import 'package:shibinsale/providers/authprovider.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(builder: (context) {
          return FutureBuilder<String>(
              future: Provider.of<AuthProvider>(context).token(),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data != "null") {
                  return const HomePage();
                } else {
                  return const AuthScreen();
                }
              });
        }),
      ),
    );
  }
}
