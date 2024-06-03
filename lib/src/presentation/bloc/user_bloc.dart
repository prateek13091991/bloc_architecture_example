// lib/presentation/blocs/user_bloc.dart
import 'package:bloc_architecture_example/src/domain/usecases/get_users_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUsecase getUsers;

  UserBloc({required this.getUsers}) : super(InitialState()) {
    on<FetchUsersEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final users = await getUsers();
        emit(LoadedState(users));
      } catch (error) {
        emit(ErrorState("Failed to fetch users"));
      }
    });
  }
}
