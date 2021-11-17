import 'package:catdogdec/src/animations/slide_in.dart';
import 'package:catdogdec/src/ui/screens/cat_vs_dog/mycat_yourdog.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  PreviewSlideRoute(preview: const CatVsDog(), duration: 300));
            },
            leading: Text(
              "my cat vs your dog",
            ),
            trailing: Icon(Icons.forward),
          )
        ],
      ),
    );
  }
}
