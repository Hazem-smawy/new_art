
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class PointsRepositoryImp implements PointsRepository{

        final PointsRemoteDataSource remoteDataSource;
        PointsRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    