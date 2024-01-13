import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_users_task/presentation/view_models/cubits/get_users_cubit/get_users_cubit.dart';

import '../../data/models/userModel.dart';
import 'user_details_view.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: BlocProvider.of<GetUsersCubit>(context).getUser,
        child: Icon(
          Icons.update_rounded,
        ),
      ),
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: SafeArea(
        child: BlocConsumer<GetUsersCubit, GetUsersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetUsersSucces) {
              List<UserModel> users = state.users;

              ///RefreshIndicator to Pull the screen down to update users
              return RefreshIndicator(
                ///onRefresh to get users and update users
                onRefresh: BlocProvider.of<GetUsersCubit>(context).getUser,

                ///Show Users List from API

                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      UserModel user = users[index];
                      return GestureDetector(
                        onTap: () {
                          ///Navigate to user datails screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetailsView(
                                        user: user,
                                      )));
                        },

                        ///if state is Success Show data in Card
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: Icon(Icons.person),
                            title: Text(user.firstname! + " " + user.lastname!),
                            subtitle: Text("Email : " +
                                user.email! +
                                "\n" +
                                "Phone : " +
                                user.phone!),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      );
                    }),
              );
            } else if (state is GetUsersError) {
              ///if state is Error Show error text

              return Center(
                child: Text("Can't Get Users , Please try later"),
              );

              ///if state is loading Show Loading
            } else if (state is GetUsersLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text("Error , Try LATER !!!"),
              );
            }
          },
        ),
      ),
    );
  }
}
