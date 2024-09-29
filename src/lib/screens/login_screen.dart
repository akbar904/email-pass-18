
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/login_cubit.dart';
import '../widgets/input_field.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocConsumer<LoginCubit, LoginState>(
				listener: (context, state) {
					if (state is LoginStateError) {
						ScaffoldMessenger.of(context).showSnackBar(
							SnackBar(content: Text(state.message)),
						);
					} else if (state is LoginStateSuccess) {
						Navigator.pushReplacementNamed(context, '/home');
					}
				},
				builder: (context, state) {
					return Padding(
						padding: const EdgeInsets.all(16.0),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								InputField(
									labelText: 'Email',
									onChanged: (value) {
										context.read<LoginCubit>().emailChanged(value);
									},
								),
								SizedBox(height: 16.0),
								InputField(
									labelText: 'Password',
									obscureText: true,
									onChanged: (value) {
										context.read<LoginCubit>().passwordChanged(value);
									},
								),
								SizedBox(height: 16.0),
								if (state is LoginStateLoading)
									CircularProgressIndicator()
								else
									CustomButton(
										text: 'Login',
										onPressed: () {
											context.read<LoginCubit>().login();
										},
									),
							],
						),
					);
				},
			),
		);
	}
}
