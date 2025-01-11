
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class New_workRepositoryImp implements New_workRepository{

        final New_workRemoteDataSource remoteDataSource;
        New_workRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    