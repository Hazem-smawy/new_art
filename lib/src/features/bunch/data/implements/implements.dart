
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class BunchRepositoryImp implements BunchRepository{

        final BunchRemoteDataSource remoteDataSource;
        BunchRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    