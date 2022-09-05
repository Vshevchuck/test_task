import '../domains/user_model/user_model.dart';

class UserDataState {}

class LoadedDataState extends UserDataState {
  final List<UserModel> listOfUsers;

  LoadedDataState(this.listOfUsers);
}

class UserDataEmptyState extends UserDataState {}

class UserDataErrorState extends UserDataState {}
