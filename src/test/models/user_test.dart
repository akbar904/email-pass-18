
import 'package:flutter_test/flutter_test.dart';
import 'package:equatable/equatable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/models/user.dart';

void main() {
	group('User Model Tests', () {
		test('User model should be equatable', () {
			final user1 = User(id: '123', email: 'test@example.com');
			final user2 = User(id: '123', email: 'test@example.com');
			final user3 = User(id: '456', email: 'test2@example.com');

			// Equatable should consider user1 and user2 as equal
			expect(user1, equals(user2));

			// Equatable should not consider user1 and user3 as equal
			expect(user1, isNot(equals(user3)));
		});

		test('User model should serialize to JSON correctly', () {
			final user = User(id: '123', email: 'test@example.com');
			final json = user.toJson();

			expect(json, equals({'id': '123', 'email': 'test@example.com'}));
		});

		test('User model should deserialize from JSON correctly', () {
			final json = {'id': '123', 'email': 'test@example.com'};
			final user = User.fromJson(json);

			expect(user.id, equals('123'));
			expect(user.email, equals('test@example.com'));
		});
	});
}
