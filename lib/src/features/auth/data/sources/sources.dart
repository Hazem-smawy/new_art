import 'package:newart/src/core/api/http_methods.dart';
import 'package:newart/src/features/auth/data/models/login_model.dart';
import 'package:newart/src/features/auth/data/models/user_model.dart';

import '../../../../core/api/api.dart';

class AuthRemoteSource {
  HttpMethons client;
  AuthRemoteSource(this.client);
  Future<Map> login(LoginModel login) async {
    var response = await client.postData(AppLink.login, login.toJson());
    return response;
  }

  Future<Map> register(UserModel user) async {
    final response = await client.postData(AppLink.register, user.toJson());
    return response;
  }

  Future<Map> recoverPassword(String email) async {
    final response = await client.postData(AppLink.register, {'email': email});
    return response;
  }

  // logOutUser() async {
  //   var response = await client.getData(AppLink.logout);
  //   return response.fold((l) => l, (r) => r);
  // }
}
