import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:careyaya/screens/session/local_widgets/session_detail.widget.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'data/session_generator.dart';
import 'util/setup_firebase_mocks.dart';
import 'util/wrap_with_material.dart';

Future<void> main() async {
  await setupFirebaseMocks();

  /// Test
  test('Save and Load session', () async {
    final session = SessionGenerator.generateSession();
    final documentAccessor = DocumentAccessor();
    await documentAccessor.save(session);
    final _session =
        await documentAccessor.load<SessionModel>(SessionModel(id: session.id));
    expect(_session.id, session.id);
    expect(_session.totalCost, session.totalCost);
  });

  test('Save and Load sessions', () async {
    final sessionA = SessionGenerator.generateSession();
    final sessionB = SessionGenerator.generateSession();
    final batch = Batch()..save(sessionA)..save(sessionB);
    await batch.commit();
    final documentAccessor = DocumentAccessor();

    final _sessionA = await documentAccessor
        .load<SessionModel>(SessionModel(id: sessionA.id));
    final _sessionB = await documentAccessor
        .load<SessionModel>(SessionModel(id: sessionB.id));
    expect(_sessionA.id, sessionA.id);
    expect(_sessionA.totalCost, sessionA.totalCost);
    expect(_sessionB.id, sessionB.id);
    expect(_sessionB.totalCost, sessionB.totalCost);
  });

  testWidgets('Session Detail widget renders', (WidgetTester tester) async {
    final session = SessionGenerator.generateSession();
    await tester
        .pumpWidget(wrapWithMaterial(SessionDetailWidget(session: session)));

    // Create finders
    final titleFinder = find.text('Appointment Information');

    expect(titleFinder, findsOneWidget);
  });
}
