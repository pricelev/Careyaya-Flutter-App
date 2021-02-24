import 'package:careyaya/controllers/form.controller.dart';
// import 'package:careyaya/models/address.model.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/personal_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/pricing_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/form.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careyaya/controllers/firestore/firestore.controller.dart';


final steps = [
  Step(title: Text('Tell us about yourself'), content: PersonalDetailsPage()),
  Step(title: Text('Set your rate'), content: PricingDetailsPage()),
];

// Have these values autocomplete
class CaregiverApplicationValues extends FormValuesInterface {
  final String firstName;
  final String lastName;
  final String sex;
  final String email;
  // final Address address;
  final String phoneNumber;
  final String experienceDescription;
  final int yearsExperience;
  final int hourlyRate;

  CaregiverApplicationValues.fromJson(Map<String, dynamic> map)
      : this.firstName = map['firstName'],
        this.lastName = map['lastName'],
        this.sex = map['sex'],
        this.email = map['email'],
        // this.address = map['address'], // Need to convert Address from Map
        this.phoneNumber = map['phoneNumber'],
        this.yearsExperience = int.parse(map['yearsExperience']),
        this.experienceDescription = map['experienceDescription'],
        this.hourlyRate = int.parse(map['hourlyRate']),
        super.fromJson(null);
}

class StepperController extends GetxController {
  int activeStep = 0;

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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: onStepCancel, child: Text('Back')),
        ElevatedButton(onPressed: onStepContinue, child: Text('Continue')),
      ],
    ),
  );
}

class CaregiverApplicationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put<StepperController>(StepperController()),
        builder: (StepperController stepperController) {
          return FormWidget(
            initialValue: {
              'firstName': '',
              'lastName': '',
              'sex': '',
              'email': '',
              'address': '',
              'phoneNumber': '',
              'yearsExperience': '0',
              'experienceDescription': '',
              'hourlyRate': '1200',
            },
            child: Stepper(
              controlsBuilder: controlsBuilder,
              currentStep: stepperController.activeStep,
              steps: steps,
              type: StepperType.vertical,
              onStepContinue: _handleStepContinue,
              onStepCancel: _handleStepCancel,
            ),
            onSubmit: (formKey, values) async {
              // Transform values into typed class
              FirestoreController fc = new FirestoreController();
              fc.setCaregiverApplication(values);
              //print(values);
              final applicationValues =
                  CaregiverApplicationValues.fromJson(values);
            },
          );
        });
  }
}

_handleStepContinue() async {
  final fc = Get.find<FormController>();
  await fc?.submit();
  final sc = Get.find<StepperController>();
  final activeStep = sc?.activeStep;
  if (activeStep != null && activeStep < steps.length - 1) {
    // Go to next step
    sc?.next();
  } else {
    // Route to success page
  }
}

_handleStepCancel() {
  Get.find<StepperController>()?.previous();
}
