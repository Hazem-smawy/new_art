
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class BanksRepositoryImp implements BanksRepository{

        final BanksRemoteDataSource remoteDataSource;
        BanksRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    