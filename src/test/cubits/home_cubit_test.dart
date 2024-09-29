
// test/cubits/home_cubit_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project/cubits/home_cubit.dart';

// Mock classes, if necessary
class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('HomeCubit', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = HomeCubit();
		});

		tearDown(() {
			homeCubit.close();
		});

		test('initial state is HomeInitial', () {
			expect(homeCubit.state, equals(HomeInitial()));
		});

		blocTest<HomeCubit, HomeState>(
			'emits [HomeLoading, HomeLoggedOut] when logout is called',
			build: () => homeCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [HomeLoading(), HomeLoggedOut()],
		);
	});
}
