import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:newart/src/core/services/shared_preferences.dart';
import 'package:newart/src/features/auth/data/sources/firebse_data_source.dart';
import 'package:newart/src/features/auth/data/sources/sources.dart';
import 'package:newart/src/features/auth/domain/repositories/repositories.dart';
import 'package:newart/src/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/email_verify_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/get_user_details_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/recover_password_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/sign_with_google_usecase.dart';
import 'package:newart/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:newart/src/features/auth/presentation/getX/verify_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/implements/auth_implements.dart';
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
        recoverPasswordUsecase: Get.find(),
        currentUserUsecase: Get.find(),
        signWithGoogleUsecase: Get.find(),
        getUserDetailsUsecase: Get.find(),
        signOutUsecase: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => VerifyEmailController(verifyEmailUseCase: Get.find()),
      fenix: true,
    );
    //usecase
    Get.lazyPut(
      () => GetUserDetailsUsecase(authRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => SignOutUsecase(authRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => RegisterUsecase(authRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => SignWithGoogleUsecase(authRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => VerifyEmailUseCase(Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => CurrentUserUsecase(authRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => RecoverPasswordUsecase(authRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginUsecase(authRepository: Get.find()),
      fenix: true,
    );

    //reposistory
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImp(
          remoteDataSource: Get.find(), firebseDataSource: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => AuthRemoteSource(Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => FirebseDataSource(),
      fenix: true,
    );
  }
}
