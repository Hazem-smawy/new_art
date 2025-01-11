import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:new_art/src/core/services/shared_preferences.dart';
import 'package:new_art/src/features/auth/data/implements/implements.dart';
import 'package:new_art/src/features/auth/data/sources/sources.dart';
import 'package:new_art/src/features/auth/domain/repositories/repositories.dart';
import 'package:new_art/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:new_art/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:new_art/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/http_methods.dart';

class DependencyInjection {
  static Future<void> init() async {
    //? core
    //shared prefrences
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences, fenix: true);
    await Get.putAsync(() => MyServices().init());

    //http
    // Get.lazyPut(() => HttpMethons(client: client), fenix: true);
    Get.lazyPut(() => HttpMethons(), fenix: true);
    Get.lazyPut(() => http.Client(), fenix: true);

    //! Features - auth
    Get.lazyPut(
      () => AuthController(
        registerUsecase: Get.find(),
        loginUsecase: Get.find(),
      ),
      fenix: true,
    );
    //usecase
    Get.lazyPut(
      () => RegisterUsecase(authRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginUsecase(authRepository: Get.find()),
      fenix: true,
    );

    //reposistory
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImp(remoteDataSource: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => AuthRemoteSource(Get.find()),
      fenix: true,
    );
  }
}
