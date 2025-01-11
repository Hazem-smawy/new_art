import '../sources/home_remote_srouce.dart';
import '../../domain/repositories/repositories.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteSource remoteDataSource;
  HomeRepositoryImp({required this.remoteDataSource});

  // ... example ...
  //
  // Future<User> getUser(String userId) async {
  //     return remoteDataSource.getUser(userId);
  //   }
  // ...
}
