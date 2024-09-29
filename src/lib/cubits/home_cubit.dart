
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
	HomeCubit() : super(HomeInitial());

	void logout() {
		emit(HomeLoading());
		// Simulate a delay for the logout process
		Future.delayed(Duration(seconds: 1), () {
			emit(HomeLoggedOut());
		});
	}
}
