import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/user_data_event.dart';
import 'package:test_task/bloc/user_data_state.dart';

import '../../../bloc/user_data_bloc.dart';
import '../../../util/colors/colors_style.dart';
import '../../../util/text_styles/text_styles.dart';

class ListOfUserWidget extends StatelessWidget {
  const ListOfUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDataBloc userBloc = BlocProvider.of<UserDataBloc>(context);
    userBloc.add(GetUsersDataEvent());
    return BlocBuilder<UserDataBloc, UserDataState>(builder: (context, state) {
      if (state is LoadedDataState) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.listOfUsers.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 8, bottom: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/image',
                      arguments: state.listOfUsers[index].urls?.full ?? "",
                    );
                  },
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.network(
                              state.listOfUsers[index].urls?.regular ?? "",
                              fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text(
                              style: TextStyles.nameTextStyle,
                              state.listOfUsers[index].user?.name ?? 'user'),
                          subtitle: Text(
                              state.listOfUsers[index].user?.username ??
                                  'user'),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        );
      }
      return const Center(
          child: CircularProgressIndicator(color: ColorStyle.indicatorColor));
    });
  }
}
