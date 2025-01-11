
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class ArtistRepositoryImp implements ArtistRepository{

        final ArtistRemoteDataSource remoteDataSource;
        ArtistRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    