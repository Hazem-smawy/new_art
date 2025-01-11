import 'package:dartz/dartz.dart';
import 'package:new_art/src/core/api/http_methods.dart';
import 'package:new_art/src/core/error/error.dart';
import 'package:new_art/src/core/types/status_response.dart';
import 'package:new_art/src/features/auth/data/models/login_model.dart';
import 'package:new_art/src/features/auth/data/models/user_model.dart';

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

  // logOut(String email, String password) async {
  //   var response = await client
  //       .postData(AppLink.login, {'email': email, 'password': password});
  //   return response.fold((l) => l, (r) => r);
  // }

  logOutUser() async {
    var response = await client.getData(AppLink.logout);
    return response.fold((l) => l, (r) => r);
  }
}
