import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shibinsale/providers/authprovider.dart';

import 'homepage.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<AuthProvider>(context, listen: false).token();
    });
    super.initState();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    //final orgController = TextEditingController();
    final emailController = TextEditingController();
    final mobileController = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'UserName'),
            controller: nameController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Password'),
            controller: passwordController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Email'),
            controller: emailController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Mobile'),
            controller: mobileController,
          ),
          const SizedBox(height: 30),
          IgnorePointer(
            ignoring: isLoading,
            child: TextButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final user = {
                    "Username": "rashidsdamn",
                    //nameController.text.trim(),
                    "Password": "rty",
                    //passwordController.text.trim(),
                    "Email": "rashusd@gmail.com",
                    //emailController.text.trim(),
                    "Mobile": "9946120506"
                    //mobileController.text.trim(),
                  };
                  await Provider.of<AuthProvider>(context, listen: false)
                      .signUp(user, context)
                      .then(
                        (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            )),
                      );
                  setState(() {
                    isLoading = false;
                  });
                },
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : const Text("Save")),
          )
        ],
      ),
    );
  }
}
