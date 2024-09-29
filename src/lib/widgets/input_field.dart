
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
	final String? hintText;
	final String? labelText;
	final bool obscureText;

	const InputField({Key? key, this.hintText, this.labelText, this.obscureText = false}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return TextFormField(
			decoration: InputDecoration(
				hintText: hintText,
				labelText: labelText,
			),
			obscureText: obscureText,
		);
	}
}
