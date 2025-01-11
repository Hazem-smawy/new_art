
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class UserRepositoryImp implements UserRepository{

        final UserRemoteDataSource remoteDataSource;
        UserRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    