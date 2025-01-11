
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class WalletRepositoryImp implements WalletRepository{

        final WalletRemoteDataSource remoteDataSource;
        WalletRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    