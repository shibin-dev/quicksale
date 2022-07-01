import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shibinsale/providers/authprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, () {
  //     Provider.of<AuthProvider>(context, listen: false).currentData();
  //   });
  //   super.initState();
  // }

  // void check() async {}

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                final storage = new FlutterSecureStorage();
                storage.delete(key: 'token');
              },
              icon: Icon(Icons.access_time_sharp))
        ],
      ),
      body: Center(
        child: Column(
          children: [Text("${userData.currentUser}")],
        ),
      ),
    );
  }
}
