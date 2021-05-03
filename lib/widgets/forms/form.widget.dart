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
  final GlobalKey<FormBuilderState> formKey;
  final SubmitFunction<FormValues> onSubmit;
  final Map<String, dynamic> initialValue;
  final AutovalidateMode autovalidateMode;
  final int index;

  FormWidget(
      {@required this.child,
      @required this.onSubmit,
      @required this.formKey,
      this.index,
      this.initialValue,
      this.autovalidateMode: AutovalidateMode.disabled});

  @override
  Widget build(BuildContext context) {
    final tag = this.index != null ? this.index.toString() : '';
    Get.put<FormController>(
        FormController(formKey: this.formKey, onSubmit: this.onSubmit),
        tag: tag);
    return FormBuilder(
      key: this.formKey,
      child: child,
      autovalidateMode: autovalidateMode,
      initialValue: initialValue,
    );
  }
}
