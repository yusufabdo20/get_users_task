// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:get_users_task/data/models/userModel.dart';

class UserDetailsView extends StatelessWidget {
  final UserModel user;
  const UserDetailsView({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstname! + " " + user.lastname! + " Details"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assits/images/dossier.gif"),
                  Text("Person Data 🧔"),
                  Text("First name: " + user.firstname!),
                  Text("Last name: " + user.lastname!),
                  Text("Email: " + user.email!),
                  Text("Birth date: " + user.birthDate!),
                  Text("Address 📌"),
                  Text("Street: " + user.address!.street!),
                  Text("City: " + user.address!.city!),
                  Text("Company 🏢"),
                  Text("Company name: " + user.company!.name!),
                  Text("Department: " + user.company!.bs!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
