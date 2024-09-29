
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// States
abstract class LoginState extends Equatable {
	const LoginState();

	@override
	List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

// Cubit
class LoginCubit extends Cubit<LoginState> {
	LoginCubit() : super(LoginInitial());

	void login(String email, String password) async {
		try {
			emit(LoginLoading());
			// Simulated login process
			await Future.delayed(Duration(seconds: 1));
			if (email == 'test@example.com' && password == 'password123') {
				emit(LoginSuccess());
			} else {
				emit(LoginFailure());
			}
		} catch (_) {
			emit(LoginFailure());
		}
	}
}
