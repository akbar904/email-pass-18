
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.flutter_cubit_app/widgets/custom_button.dart';

void main() {
	group('CustomButton Widget Tests', () {
		testWidgets('should display correct text', (WidgetTester tester) async {
			// Arrange
			const buttonText = 'Press Me';

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: buttonText,
							onPressed: () {},
						),
					),
				),
			);

			// Assert
			expect(find.text(buttonText), findsOneWidget);
		});

		testWidgets('should trigger onPressed callback when tapped', (WidgetTester tester) async {
			// Arrange
			var pressed = false;
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: 'Press Me',
							onPressed: () {
								pressed = true;
							},
						),
					),
				),
			);

			// Act
			await tester.tap(find.byType(CustomButton));
			await tester.pump();

			// Assert
			expect(pressed, true);
		});

		testWidgets('should display loading spinner when isLoading is true', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: 'Press Me',
							onPressed: () {},
							isLoading: true,
						),
					),
				),
			);

			// Assert
			expect(find.byType(CircularProgressIndicator), findsOneWidget);
			expect(find.text('Press Me'), findsNothing);
		});
	});
}
