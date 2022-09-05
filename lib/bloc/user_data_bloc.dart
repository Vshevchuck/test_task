import 'package:test_task/bloc/user_data_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/user_data_state.dart';

import '../domains/api_clients/api_client.dart';
import '../domains/user_model/user_model.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  @override
  get initialState => UserDataEmptyState();

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is GetUsersDataEvent) {
      try {
        final apiClient = ApiClient();
        var data = await apiClient.getListOfData();
        List<UserModel> listOfUsers = [];
        for (int i = 0; i < data.length; i++) {
          listOfUsers.add(UserModel.fromJson(data[i]));
          yield LoadedDataState(listOfUsers);
        }
      } catch (e) {
        yield UserDataEmptyState();
      }
    }
  }
}
