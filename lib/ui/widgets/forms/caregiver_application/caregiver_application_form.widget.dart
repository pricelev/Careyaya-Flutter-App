import 'package:careyaya/controllers/form.controller.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/steps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepperController extends GetxController {
  int activeStep = 4;

  void next() {
    activeStep++;
    update();
  }

  void previous() {
    activeStep--;
    update();
  }
}

Widget controlsBuilder(BuildContext context,
    {void Function() onStepCancel, void Function() onStepContinue}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: GetBuilder<StepperController>(
      init: Get.put<StepperController>(StepperController()),
      builder: (StepperController stepperController) {
        final continueButtonText =
            stepperController.activeStep == steps.length - 1
                ? 'Finish'
                : 'Continue';
        final List<Widget> buttonList = [];
        if (stepperController.activeStep > 0) {
          buttonList
              .add(TextButton(onPressed: onStepCancel, child: Text('Back')));
        }
        buttonList.add(ElevatedButton(
            onPressed: onStepContinue, child: Text(continueButtonText)));
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: buttonList,
        );
      },
    ),
  );
}

class CaregiverApplicationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StepperController>(
        init: Get.put<StepperController>(StepperController()),
        builder: (StepperController stepperController) {
          return Stepper(
            controlsBuilder: controlsBuilder,
            currentStep: stepperController.activeStep,
            steps: steps,
            type: StepperType.vertical,
            onStepContinue: _handleStepContinue,
            onStepCancel: _handleStepCancel,
          );
        });
  }
}

_handleStepContinue() async {
  final sc = Get.find<StepperController>();
  final fc = Get.find<FormController>(tag: sc?.activeStep.toString());
  final didSubmit = await fc?.submit();
  if (didSubmit) {
    final activeStep = sc?.activeStep;
    if (activeStep != null && activeStep < steps.length - 1) {
      // Go to next step
      sc?.next();
    } else {
      // Route to success page
    }
  }
}

_handleStepCancel() {
  final sc = Get.find<StepperController>();
  final activeStep = sc?.activeStep;
  if (activeStep != null && activeStep > 0) {
    sc?.previous();
  }
}
