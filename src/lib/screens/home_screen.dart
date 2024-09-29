
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.flutter_cubit_app/cubits/home_cubit.dart';
import 'package:com.example.flutter_cubit_app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final homeCubit = context.read<HomeCubit>();

		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: CustomButton(
					onPressed: () {
						homeCubit.logout();
					},
					child: Text('Logout'),
				),
			),
		);
	}
}
