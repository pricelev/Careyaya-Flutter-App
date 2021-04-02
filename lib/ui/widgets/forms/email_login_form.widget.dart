import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/ui/widgets/forms/fields/button.widget.dart';
import 'package:careyaya/ui/widgets/forms/fields/email_field.widget.dart';
import 'package:careyaya/ui/widgets/forms/form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Find a way to have these values autocomplete?
class EmailLoginValues extends FormValuesInterface {
  final String email;
  // final String password;

  EmailLoginValues.fromJson(Map<String, dynamic> map)
      : this.email = map['email'],
        // this.password = map['password'],
        super.fromJson(null);
}

class EmailLoginForm extends StatelessWidget {
  final AuthController authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return FormWidget<EmailLoginValues>(
        initialValue: {
          'email': '',
          // 'password': '',
        },
        formKey: GlobalKey<FormBuilderState>(),
        onSubmit: (formKey, values) async {
          // Transform values into typed class
          final loginValues = EmailLoginValues.fromJson(values);
          final email = loginValues.email;
          // final password = loginValues.password;
          if (email != null) {
            await authController.sendSignInWithEmailLink(context, email: email);
          }
        },
        child: Column(
          children: [
            EmailField(),
            // PasswordField(),
            Button(
              text: 'Send Sign In Link',
              submit: true,
            ),
          ],
        ));
  }
}
