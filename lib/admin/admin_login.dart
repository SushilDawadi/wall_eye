import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wall_eye_app/admin/add_Wallpaper.dart';
import 'package:wall_eye_app/pages/input_field.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededeb),
      body: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                        MediaQuery.of(context).size.width, 110.0))),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Let's start with \nAdmin",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20.0),
                    elevation: 3.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50.0,
                          ),
                          MyInputField(
                            msg: "Please enter username",
                            hintText: "Username",
                            controller: usernameController,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          MyInputField(
                            msg: "Please enter password",
                            hintText: "Password",
                            controller: passwordController,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              loginAdmin();
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'LogIn',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((element) {
        if (element.data()['id'] == usernameController.text) {
          if (element.data()['password'] == passwordController.text) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Login Successful"),
              backgroundColor: Colors.green,
            ));

            Route route =
                MaterialPageRoute(builder: (context) => const AddWallpaper());

            Navigator.pushReplacement(context, route);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Username or Password is incorrect"),
            backgroundColor: Colors.red,
            dismissDirection: DismissDirection.down,
            showCloseIcon: true,
          ));
        }
      });
    });
  }
}
