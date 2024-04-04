import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:wall_eye_app/pages/button.dart';
import 'package:wall_eye_app/service/database.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  final List<String> categoriesName = ['Wildlife', 'Foods', 'Nature', 'Car'];
  String? value;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  //function to get image
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  upload() async {
    if (selectedImage != null) {
      String addId = randomAlphaNumeric(10);
      Reference ref =
          FirebaseStorage.instance.ref().child("BlogImage").child(addId);
      final UploadTask uploadTask = ref.putFile(selectedImage!);
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "image": downloadUrl,
        "id": addId,
      };
      await DatabaseMethod().addWallPaper(addItem, addId, value!).then(
          (value) => Fluttertoast.showToast(
              msg: "Wallpaper Added Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 49, 202, 18),
              textColor: Colors.white,
              fontSize: 16.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Add Wallpaper",
            style: TextStyle(
                color: Colors.black, fontSize: 20.0, fontFamily: 'Poppins'),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            selectedImage == null
                ? GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: 250,
                          height: 300,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 35.0),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFececf8)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(5.0),
                  elevation: 4,
                  items: categoriesName
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontFamily: 'Poppins', fontSize: 18.0),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                  hint: const Text(
                    "Select Category",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                  value: value,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(onTap: upload, child: const MyButton(text: "Add"))
          ],
        ));
  }
}
