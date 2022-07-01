import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shibinsale/pages/homepage.dart';
import 'package:shibinsale/utils/utils.dart';

class AuthProvider with ChangeNotifier {
  final storage = const FlutterSecureStorage();
  String currentUser = "";
  String authToken = "";

  Future<void> signUp(Map user, BuildContext context) async {
    const signupapi = '${urlsegment}signup';
    // print(signupapi);
    var url = Uri.parse(signupapi);
    var body = json.encode(user);
    var response = await http.post(url, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      Map authData = json.decode(response.body);
      currentUser = authData["localId"];
      await storage.write(key: "token", value: authData["idToken"]);
      await storage.write(key: "user", value: authData["localId"]);
      notifyListeners();
    }
  }

  Future<String> token() async {
    var data = await storage.read(key: "token");
    String userToken = data.toString();
    return userToken;
  }

  // void currentData() async {
  //   var user = storage.read(key: "user");
  //   currentUser = user.toString();
  //   print(currentUser);
  //   //notifyListeners();
  // }
}
