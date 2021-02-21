import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  static FormController to = Get.find();
  Function onSubmit;
  RxBool submitting = false.obs;
  Rx<GlobalKey<FormBuilderState>> key = GlobalKey<FormBuilderState>().obs;

  bool get isSubmitting => submitting.value;

  FormController({this.onSubmit});

  @override
  void dispose() {
    key = null;
    key.close();
    super.dispose();
  }

  Future<void> submit() async {
    submitting.value = true;
    update();
    try {
      if (onSubmit != null) {
        final currentState = key.value.currentState;
        currentState.save();
        final formValues = currentState.value;
        await onSubmit(key.value, formValues);
      }
    } catch (error) {
      print(error);
    }
    submitting.value = false;
  }
}
