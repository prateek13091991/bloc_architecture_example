import '../entities/user.dart';
import '../../data/repository/user_repository.dart';

class GetUsersUsecase {
  final UserRepository userRepository;

  GetUsersUsecase({required this.userRepository});

  Future<List<User>> call() async {
    final userModels = await userRepository.getUsers();
    return userModels
        .map((userModel) => User(
            id: userModel.id, name: userModel.name, email: userModel.email))
        .toList();
  }
}
