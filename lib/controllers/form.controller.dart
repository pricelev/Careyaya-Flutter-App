import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  static FormController to = Get.find();
  Function onSubmit;
  RxBool submitting = false.obs;
  Rx<GlobalKey<FormBuilderState>> formKey;

  bool get isSubmitting => submitting.value;

  FormController(
      {this.onSubmit, @required GlobalKey<FormBuilderState> formKey}) {
    this.formKey = formKey.obs;
  }

  @override
  void dispose() {
    formKey = null;
    formKey.close();
    super.dispose();
  }

  Future<bool> submit() async {
    submitting.value = true;
    update();
    try {
      if (onSubmit != null) {
        final currentState = formKey.value.currentState;
        final isValid = currentState.saveAndValidate();
        if (!isValid) {
          print(currentState.value);
          throw 'Form Values not valid.';
        }
        final formValues = currentState.value;
        await onSubmit(formKey.value, formValues);
        return true;
      }
    } catch (error) {
      print(error);
      return false;
    }
    submitting.value = false;
  }
}
