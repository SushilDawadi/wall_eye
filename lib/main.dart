import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wall_eye_app/admin/admin_login.dart';
import 'package:wall_eye_app/pages/bottomNav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Wallpaper());
}

class Wallpaper extends StatelessWidget {
  const Wallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdminLogin(),
    );
  }
}
