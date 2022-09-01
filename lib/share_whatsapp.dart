import 'dart:io';

import 'package:figma/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:image_picker/image_picker.dart';

///sharing platform
enum Share {
  whatsapp,
}

class Whats extends StatefulWidget {
  @override
  _WhatsState createState() => _WhatsState();
}

class _WhatsState extends State<Whats> {
  File? file;
  ImagePicker picker = ImagePicker();
  bool videoEnable = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              ElevatedButton(onPressed: pickImage, child: Text('Pick Image')),

              ElevatedButton(
                onPressed: () => onButtonTap(Share.whatsapp),
                child: const Text('share to WhatsApp'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    print(xFile);
    if (xFile != null) {
      file = File(xFile.path);
      setState(() {
        videoEnable = false;
      });
    }
  }


  Future<void> onButtonTap(Share share) async {
    String msg = Utils.flushBarMessage("Please select image", "Error", context);
        // 'Flutter share is great!!\n Check out full example at https://pub.dev/packages/flutter_share_me';
    String url = 'https://pub.dev/packages/flutter_share_me';

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    try{
      switch (share) {

        case Share.whatsapp:
          if (file != null) {
            response = await flutterShareMe.shareToWhatsApp(
                imagePath: file!.path,
                fileType: videoEnable ? FileType.video : FileType.image);
          } else {
            response = await flutterShareMe.shareToWhatsApp(msg: msg);
          }
          break;
      }
    }catch(e){
      print(e.toString());
     return null;
    }
    debugPrint(response);
  }
}