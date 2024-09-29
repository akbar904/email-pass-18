
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_cubit_app/screens/login_screen.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('displays email and password input fields', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(InputField), findsNWidgets(2));
		});

		testWidgets('displays login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(CustomButton), findsOneWidget);
		});

		testWidgets('displays error message when login fails', (WidgetTester tester) async {
			final mockLoginCubit = MockLoginCubit();
			whenListen(
				mockLoginCubit,
				Stream.fromIterable([LoginState.error('Login Failed')]),
				initialState: LoginState.initial(),
			);

			await tester.pumpWidget(MaterialApp(
				home: BlocProvider<LoginCubit>(
					create: (_) => mockLoginCubit,
					child: LoginScreen(),
				),
			));

			await tester.pump();

			expect(find.text('Login Failed'), findsOneWidget);
		});
	});

	group('LoginCubit Tests', () {
		blocTest<LoginCubit, LoginState>(
			'emits [LoginState.loading, LoginState.success] when login is successful',
			build: () => LoginCubit(),
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [
				LoginState.loading(),
				LoginState.success(),
			],
		);

		blocTest<LoginCubit, LoginState>(
			'emits [LoginState.loading, LoginState.error] when login fails',
			build: () => LoginCubit(),
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [
				LoginState.loading(),
				LoginState.error('Invalid credentials'),
			],
		);
	});
}
