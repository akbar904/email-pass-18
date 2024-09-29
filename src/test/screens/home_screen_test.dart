
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_app/screens/home_screen.dart';
import 'package:com.example.flutter_cubit_app/cubits/home_cubit.dart';

class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display the logout button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeCubit Tests', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = MockHomeCubit();
		});

		blocTest<HomeCubit, void>(
			'emits nothing when logout is called',
			build: () => homeCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [],
		);
	});
}
