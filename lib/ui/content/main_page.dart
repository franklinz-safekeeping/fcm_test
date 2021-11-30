import 'package:fcm_test/ui/content/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FCM Test"),
      ),
      body: const SafeArea(
        child: MainScreen(),
      ),
    );
  }
}
