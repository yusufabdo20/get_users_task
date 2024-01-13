import 'package:dio/dio.dart';

import '../models/userModel.dart';

class ApiServices {
  Dio _dio = Dio();
  Future<List<UserModel>> getData() async {
    Response response = await _dio.get("https://jsonplaceholder.org/users");
    var data = response.data;
    print('🎃🎃User1 in response.data ${data[0].toString()}');
    List<UserModel> users = [];
    for (var user in data) {
      users.add(UserModel.fromJson(user));
    }
    return users;
  }
}
