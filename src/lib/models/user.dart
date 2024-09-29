
import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String id;
	final String email;

	User({required this.id, required this.email});

	// Converts a User instance to a JSON map.
	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'email': email,
		};
	}

	// Creates a User instance from a JSON map.
	factory User.fromJson(Map<String, dynamic> json) {
		return User(
			id: json['id'],
			email: json['email'],
		);
	}

	@override
	List<Object?> get props => [id, email];
}
