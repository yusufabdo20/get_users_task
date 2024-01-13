part of 'get_users_cubit.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersSucces extends GetUsersState {
  final List<UserModel> users;

  GetUsersSucces({required this.users});
}

final class GetUsersError extends GetUsersState {
  final String error;

  GetUsersError({required this.error});
}
