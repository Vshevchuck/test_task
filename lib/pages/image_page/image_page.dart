import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/colors/colors_style.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = (ModalRoute.of(context)?.settings.arguments) as String;
    return Scaffold(
        backgroundColor: ColorStyle.backgroundColor,
        body: Center(child: SizedBox(child: Image.network(image, fit: BoxFit.fill))));
  }
}
