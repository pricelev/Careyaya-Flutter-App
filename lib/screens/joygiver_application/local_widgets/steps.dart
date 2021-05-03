import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/identity_details_page.widget.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/joygiver_profile_details_page.widget.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/personal_details_page.widget.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/pricing_details_page.widget.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/reference_details_page.widget.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/schedule_meeting_page.widget.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/service_details_page.widget.dart';
import 'package:careyaya/screens/joygiver_application/local_widgets/pages/upload_video_page.widget.dart';
import 'package:careyaya/widgets/forms/form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormStep extends StatelessWidget {
  final Widget content;
  final int index;
  final Map<String, dynamic> initialValues;

  const FormStep(
      {@required this.content,
      @required this.index,
      @required this.initialValues});

  @override
  Widget build(BuildContext context) {
    return FormWidget(
      formKey: formKeys[index],
      initialValue: initialValues,
      index: index,
      onSubmit: (formKey, values) async {
        final FirestoreController fc = FirestoreController();
        fc.setCaregiverApplication(values);
        // final applicationValues =
        //     CaregiverApplicationValues.fromJson(values);
      },
      child: content,
    );
  }
}

final List<Step> steps = [
  Step(
    title: const Text('Tell us about yourself'),
    content: KeyedSubtree(
      child: FormStep(
        index: 0,
        content: PersonalDetailsPage(),
        initialValues: const {
          'phoneNumber': '',
        },
      ),
    ),
  ),
  Step(
    title: const Text('Set your rate'),
    content: KeyedSubtree(
      child: FormStep(
        index: 1,
        content: PricingDetailsPage(),
        initialValues: const {},
      ),
    ),
  ),
  Step(
    title: const Text('Verify your identity'),
    content: KeyedSubtree(
      child: FormStep(
        index: 3,
        content: IdentityDetailsPage(),
        initialValues: const {},
      ),
    ),
  ),
  Step(
    title: const Text('Create your Joygiver Profile'),
    content: KeyedSubtree(
      key: GlobalKey<FormBuilderState>(),
      child: FormStep(
        index: 4,
        content: JoygiverProfileDetailsPage(),
        initialValues: const {
          'introDescription': '',
          'isComfortableWithPets': false,
          'hasTransportation': false,
          'drives': false,
          'isSmoker': false,
        },
      ),
    ),
  ),
  Step(
    title: const Text('Define your service'),
    content: KeyedSubtree(
      key: GlobalKey<FormBuilderState>(),
      child: FormStep(
        index: 5,
        content: ServiceDetailsPage(),
        initialValues: const {
          'tasks': <String>[],
          'certifications': <String>[],
          'preferredSexes': <String>[],
          'covidHandlingMethods': <String>[],
          'maximumSessionDistance': 40,
        },
      ),
    ),
  ),
  Step(
    title: const Text('Provide your references'),
    content: KeyedSubtree(
      key: GlobalKey<FormBuilderState>(),
      child: FormStep(
        index: 6,
        content: ReferenceDetailsPage(),
        initialValues: const {
          'references.1.name': '',
          'references.1.relationship': 'employer',
          'references.1.phone': '',
          'references.1.email': '',
          'references.2.name': '',
          'references.2.relationship': 'personal',
          'references.2.phone': '',
          'references.2.email': '',
        },
      ),
    ),
  ),
  Step(
    title: const Text('Meet with us'),
    content: KeyedSubtree(
      key: GlobalKey<FormBuilderState>(),
      child: FormStep(
        index: 7,
        content: ScheduleMeetingPage(),
        initialValues: const {},
      ),
    ),
  ),
  Step(
    title: const Text('Upload your Profile Video'),
    content: KeyedSubtree(
      key: GlobalKey<FormBuilderState>(),
      child: FormStep(
        index: 8,
        content: UploadVideoPage(),
        initialValues: const {},
      ),
    ),
  ),
];

final List<GlobalKey<FormBuilderState>> formKeys = [
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
  GlobalKey<FormBuilderState>(),
];
