import 'package:careyaya/controllers/form.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

abstract class FormValuesInterface {
  FormValuesInterface.fromJson(Map<String, dynamic> map);
}

typedef SubmitFunction<FormValues> = void Function(
    GlobalKey<FormBuilderState> key, Map<String, dynamic> values);

class FormWidget<FormValues extends FormValuesInterface>
    extends StatelessWidget {
  final Widget child;
  final SubmitFunction<FormValues> onSubmit;
  final Map<String, dynamic> initialValue;
  final AutovalidateMode autovalidateMode;

  FormWidget(
      {@required this.child,
      @required this.onSubmit,
      this.initialValue,
      this.autovalidateMode: AutovalidateMode.disabled});

  @override
  Widget build(BuildContext context) {
    return GetX<FormController>(
      init: Get.put<FormController>(FormController(onSubmit: onSubmit)),
      builder: (formController) {
        return FormBuilder(
          key: formController.key.value,
          child: child,
          autovalidateMode: autovalidateMode,
          initialValue: initialValue,
        );
      },
    );
  }
}
