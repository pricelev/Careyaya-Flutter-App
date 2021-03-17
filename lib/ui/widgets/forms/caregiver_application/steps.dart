import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/identity_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/joygiver_profile_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/personal_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/pricing_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/reference_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/schedule_meeting_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/scheduling_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/service_details_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/caregiver_application/pages/upload_video_page.widget.dart';
import 'package:careyaya/ui/widgets/forms/form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormStep extends StatelessWidget {
  final Widget content;
  final int index;
  final Map<String, dynamic> initialValues;

  FormStep(
      {@required this.content,
      @required this.index,
      @required this.initialValues});

  @override
  Widget build(BuildContext context) {
    return FormWidget(
      formKey: formKeys[this.index],
      initialValue: initialValues,
      child: content,
      index: this.index,
      onSubmit: (formKey, values) async {
        FirestoreController fc = new FirestoreController();
        fc.setCaregiverApplication(values);
        // final applicationValues =
        //     CaregiverApplicationValues.fromJson(values);
      },
    );
  }
}

final List<Step> steps = [
  Step(
    title: Text('Tell us about yourself'),
    content: KeyedSubtree(
      child: FormStep(
        index: 0,
        content: PersonalDetailsPage(),
        initialValues: {
          'phoneNumber': '',
        },
      ),
    ),
  ),
  Step(
    title: Text('Set your rate'),
    content: KeyedSubtree(
      child: FormStep(
        index: 1,
        content: PricingDetailsPage(),
        initialValues: {},
      ),
    ),
  ),
  Step(
    title: Text('Set your schedule'),
    content: KeyedSubtree(
      child: FormStep(
        index: 2,
        content: SchedulingDetailsPage(),
        initialValues: {
          'schedule.Sunday': [],
          'schedule.Monday': [],
          'schedule.Tuesday': [],
          'schedule.Wednesday': [],
          'schedule.Thursday': [],
          'schedule.Friday': [],
          'schedule.Saturday': [],
        },
      ),
    ),
  ),
  Step(
    title: Text('Verify your identity'),
    content: KeyedSubtree(
      child: FormStep(
        index: 3,
        content: IdentityDetailsPage(),
        initialValues: {},
      ),
    ),
  ),
  Step(
    title: Text('Create your Joygiver Profile'),
    content: KeyedSubtree(
      child: FormStep(
        index: 4,
        content: JoygiverProfileDetailsPage(),
        initialValues: {
          'introDescription': '',
          'isComfortableWithPets': false,
          'hasTransportation': false,
          'drives': false,
          'isSmoker': false,
        },
      ),
      key: GlobalKey<FormBuilderState>(),
    ),
  ),
  Step(
    title: Text('Define your service'),
    content: KeyedSubtree(
      child: FormStep(
        index: 5,
        content: ServiceDetailsPage(),
        initialValues: {
          'tasks': <String>[],
          'certifications': <String>[],
          'preferredSexes': <String>[],
          'covidHandlingMethods': <String>[],
          'maximumSessionDistance': 40,
        },
      ),
      key: GlobalKey<FormBuilderState>(),
    ),
  ),
  Step(
    title: Text('Provide your references'),
    content: KeyedSubtree(
      child: FormStep(
        index: 6,
        content: ReferenceDetailsPage(),
        initialValues: {
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
      key: GlobalKey<FormBuilderState>(),
    ),
  ),
  Step(
    title: Text('Meet with us'),
    content: KeyedSubtree(
      child: FormStep(
        index: 7,
        content: ScheduleMeetingPage(),
        initialValues: {},
      ),
      key: GlobalKey<FormBuilderState>(),
    ),
  ),
  Step(
    title: Text('Upload your Profile Video'),
    content: KeyedSubtree(
      child: FormStep(
        index: 8,
        content: UploadVideoPage(),
        initialValues: {},
      ),
      key: GlobalKey<FormBuilderState>(),
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
