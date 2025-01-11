 
    import '../repositories/repositories.dart';

    class GetUserUseCase {
        final UserRepository repository;
      
        GetUserUseCase({required this.repository});
      
        // Future<User> execute(String userId) async {
        //   return userRepository.getUser(userId);
        // }
      }
      