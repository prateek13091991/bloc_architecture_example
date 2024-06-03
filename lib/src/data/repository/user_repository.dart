import '../models/user_model.dart';
import '../sources/user_remote_data_source.dart';

class UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepository({required this.userRemoteDataSource});

  Future<List<UserModel>> getUsers() async {
    return await userRemoteDataSource.fetchUsers();
  }
}
