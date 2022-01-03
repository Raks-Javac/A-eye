import 'package:a_eye/src/core/utils/constants.dart';
import 'package:a_eye/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AeyeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AeyeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Row(
        children: [
          Image.asset(
            ImageStore.appLogo,
            width: screenAwareSize(130, context),
            height: screenAwareSize(130, context),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(70, 65);
}
