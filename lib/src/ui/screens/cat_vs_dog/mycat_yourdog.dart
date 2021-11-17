import 'dart:io';

import 'package:catdogdec/src/core/utils/styles.dart';
import 'package:catdogdec/src/core/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

const modelLocation = "assets/cat_dog_set/model_unquant.tflite";
const modelLabelocation = "assets/cat_dog_set/labels.txt";

class CatVsDog extends StatefulWidget {
  const CatVsDog({Key key}) : super(key: key);

  @override
  _CatVsDogState createState() => _CatVsDogState();
}

class _CatVsDogState extends State<CatVsDog> {
  bool loading = false;
  final picker = ImagePicker();
  var _image;
  List<dynamic> result;

  //this function gets image from camera
  pickImageCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

//this function gets image from gallary
  pickImageGallary() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  //this function loads the tflite model
  loadModel() async {
    return await Tflite.loadModel(
        model: modelLocation, isAsset: true, labels: modelLabelocation);
  }

//this function predicts the kind of image or object with the model
  classifyImage(File imageFile) async {
    var img = imageFile.path;

    var output = await Tflite.runModelOnImage(
        path: img,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      result = output;
      print(result);
    });
  }

  @override
  void initState() {
    loading = false;
    loadModel().then((e) {
      debugPrint("MODEL STATUS - $e");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceLarge,
              Text(
                "Teachablemachine CNN",
                style: kTextStyle.copyWith(
                  color: appColor.withAlpha(120),
                  fontSize: UIHelper.kMediumFont + 4,
                ),
              ),
              UIHelper.verticalSpaceMedium,
              Text(
                "My Cat vs Your Dog",
                style: kTextStyle.copyWith(
                  color: appColor,
                  fontSize: UIHelper.kLargeFont + 4,
                ),
              ),
              UIHelper.verticalSpaceMedium,
              Center(
                child: (_image != null)
                    ? Image.file(
                        _image,
                        width: 250,
                        height: 250,
                      )
                    : Image.asset(
                        splashImage,
                        width: 250,
                        height: 250,
                      ),
              ),
              // if()
              UIHelper.verticalSpaceMediumPlus,

              if (result != null)
                Column(
                  children: [
                    Text(
                      "This is a  ${result[0]['label']}",
                      style: kTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "This is ${result[0]['confidence']} accurate",
                      style: kTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              UIHelper.verticalSpaceMedium,
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: pickImageCamera,
                      color: appColor,
                      child: const Text("Take a picture"),
                    ),
                    UIHelper.verticalSpaceSmall,
                    MaterialButton(
                      onPressed: pickImageGallary,
                      color: appColor,
                      child: const Text("Camera Roll"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
