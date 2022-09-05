import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height);
    final image = (ModalRoute.of(context)?.settings.arguments) as String;
    return Scaffold(
        body: SizedBox(
            height: screenHeight,
            child: Image.network(image, fit: BoxFit.fill)));
  }
}
