import 'dart:ffi';
import 'dart:io';
import 'package:figma/Utils/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  ImagePicker picker = ImagePicker();
  File? imageFile;
  File? profileImage;
String? _imagepath;

@override
void initState(){
  super.initState();

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: image(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 150,
                width: 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Personal Details"),
                        Spacer(),
                        Icon(Icons.edit),
                        SizedBox(
                          width: 15.0,
                        ),
                        InkWell(
                            onTap: () {
                              _getFromGallery();
                            },
                            child: Icon(Icons.camera_alt_outlined)),
                      ],
                    ),
                    Container(
                      height: 30,
                    ),
                    Text(
                      "Mahipal Shekhawat",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text("+91 8107401889"),
                    Container(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("mahipal@softserv.in"),
                        Spacer(),
                        Icon(Icons.security_update_good, color: Colors.green),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //Image picked from gallery

  _getFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print("**********picked image from gallary***********");
    print(image?.path.length.toString());

    setState(() {
      if (image != null) {
        imageFile = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //Set Image in circle avatar
  ImageProvider image() {
    if (imageFile != null) {
      return FileImage(imageFile!);
    }
    return AssetImage("assets/mahipal.jpg");
  }

  //Image picked from Camera

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }



}
