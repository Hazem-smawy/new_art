
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class Audio_playerRepositoryImp implements Audio_playerRepository{

        final Audio_playerRemoteDataSource remoteDataSource;
        Audio_playerRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    