import 'dart:io';
import 'package:figma/Utils/image_picker.dart';
import 'package:figma/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();

  String? codeDialog;
  String? mobileNumber;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    getImageCameraGallery();
  }

  getImageCameraGallery() async {
    var image = await Utility.getImageByPref();
    var prefName = await Utility.getUserNameByPref();
    var prefMobile = await Utility.getMobileNumberByPref();

    setState(() {
      imageFile = new File(image!);
      codeDialog = prefName;
      mobileNumber = prefMobile;
    });
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
                backgroundImage: imageCameraGallery(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 170,
                width: 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Personal Details"),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              _dialogForCameraGallery();
                            },
                            child: Icon(Icons.camera_alt_outlined)),
                      ],
                    ),
                    Container(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          (codeDialog.toString() == "")
                              ? "Mahipal Shekhawat"
                              : "$codeDialog",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _dialogForUserName(context);
                          },
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          (mobileNumber.toString() == "")
                              ? "+91 8107401889"
                              : "$mobileNumber",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _dialogForMobileNUmber(context);
                          },
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
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
    print("**********picked image from gallery***********");
    print(image?.path.length.toString());

    print("**********saved image path***********");
    print("set image path ${imageFile.toString()}");

    //Set image path in imageFile variable
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
        print("Selected file : ${image.path}");

        Utility.setImageByPref(image.path.toString());
      } else {
        print('No image selected.');
      }
    });
  }

  //Image clicked from Camera
  _getFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    print("**********picked image from Camera***********");
    print(image?.path.length.toString());

    setState(() {
      if (image != null) {
        imageFile = File(image.path);
        Utility.setImageByPref(image.path.toString());
      } else {
        print('No Camera image clicked');
      }
    });
  }

  //Set Image in circle avatar from Camera/Gallery
  ImageProvider imageCameraGallery() {
    if (imageFile != null) {
      return FileImage(imageFile!);
    }
    return AssetImage("assets/mahipal.jpg");
  }

  //Alert dialog for change user name
  Future<void> _dialogForUserName(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              /*onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },*/
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter your full name"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 70,
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = _textFieldController.text.toString();
                    Utility.setUsernameByPref(codeDialog!);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //Alert dialog for mobile number
  Future<void> _dialogForMobileNUmber(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              /* onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },*/
              controller: _mobileNumberController,
              decoration: InputDecoration(hintText: "Enter your mobile number"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 70,
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    mobileNumber = _mobileNumberController.text.toString();
                    Utility.setMobileNumberByPref(mobileNumber!);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //AlertDialog for camera and gallery
  Future<void> _dialogForCameraGallery() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Please select image from'),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CAMERA'),
                onPressed: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 70,
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('GALLERY'),
                onPressed: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
