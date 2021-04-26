import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import './post_session_check.dart';

void main() {
  testWidgets('Checkbox part of post session survey rendered',
      (WidgetTester tester) async {
    //Create the widget by telling tester to build it
    await tester.pumpWidget(PostSessionCheck());

    var container = find.byType(Container);

    expect(container, findsOneWidget);
  });
}
