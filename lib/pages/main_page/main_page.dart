import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/user_data_bloc.dart';
import 'package:test_task/pages/main_page/widgets/list_of_users_widget.dart';

import '../../domains/api_clients/api_client.dart';
import '../../util/decorations/decorations.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static bool state = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDataBloc>(
      create: (context) => UserDataBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Unsplash Gallery')),
        body: Container(
            height: double.maxFinite,
            decoration: Decorations.backgroundMainDecoration,
            child: const ListOfUserWidget()),
      ),
    );
  }
}
