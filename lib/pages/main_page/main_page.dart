import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domains/api_clients/api_client.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static bool state = true;

  @override
  Widget build(BuildContext context) {
    ApiClient apiClient = ApiClient();
    showImages(apiClient);
    return Scaffold();
  }

  showImages(ApiClient apiClient) async {
    print(await apiClient.getListOfData());
  }
}
