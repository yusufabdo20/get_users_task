import 'package:bloc/bloc.dart';
import 'package:get_users_task/data/models/userModel.dart';
import 'package:get_users_task/data/services/api_services.dart';
import 'package:meta/meta.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit() : super(GetUsersInitial());
  List<UserModel> users = [];
  Future<void> getUser() async {
    try {
      emit(GetUsersLoading());
      users = await ApiServices().getData();
      emit(GetUsersSucces(users: users));
    } catch (e) {
      print('🛠🛠🛠🛠🛠🛠🛠🛠🛠🛠' + e.toString());
      emit(GetUsersError(error: e.toString()));
    }
  }
}
