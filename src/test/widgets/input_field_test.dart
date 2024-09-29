
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_app/widgets/input_field.dart';

void main() {
	group('InputField Widget Tests', () {
		testWidgets('should find a TextFormField widget', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: InputField())));

			final textFormFieldFinder = find.byType(TextFormField);
			expect(textFormFieldFinder, findsOneWidget);
		});

		testWidgets('should display hint text', (WidgetTester tester) async {
			const hintText = 'Enter text';
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: InputField(hintText: hintText))));

			final hintTextFinder = find.text(hintText);
			expect(hintTextFinder, findsOneWidget);
		});

		testWidgets('should display the correct label text', (WidgetTester tester) async {
			const labelText = 'Label';
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: InputField(labelText: labelText))));

			final labelTextFinder = find.text(labelText);
			expect(labelTextFinder, findsOneWidget);
		});

		testWidgets('should hide text when obscureText is true', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: InputField(obscureText: true))));

			final textFormField = tester.widget<TextFormField>(find.byType(TextFormField));
			expect(textFormField.obscureText, isTrue);
		});
	});
}
