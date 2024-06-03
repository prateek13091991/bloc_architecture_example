import 'package:bloc_architecture_example/src/data/sources/user_remote_data_source.dart';
import 'package:bloc_architecture_example/src/domain/usecases/get_users_usecase.dart';
import 'package:bloc_architecture_example/src/presentation/widgets/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../../data/repository/user_repository.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocProvider(
        create: (context) => UserBloc(
            getUsers: GetUsersUsecase(
                userRepository: UserRepository(
                    userRemoteDataSource: UserRemoteDataSource()))),
        child: const UserListWidget(),
      ),
    );
  }
}
