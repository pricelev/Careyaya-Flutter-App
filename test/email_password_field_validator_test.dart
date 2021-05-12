import 'package:flutter_test/flutter_test.dart';
import 'package:careyaya/screens/sign_in/sign_in.screen.dart';
import 'util/emailField.dart'
void main() {

  testWidgets('emailfieldInput', (WidgetTester tester)async {
    await tester.pumpWidget(emailField());

    expect(email, findsWidgets);
    await tester.enterText(emailField, 'Continue with email');
    expect(find.text('Send Sign in Link'), findsWidget);
  })
  
  test('empty email returns error string', () {

    final result = emailField.validate('');
    expect(result, 'This field cannot be empty');
  });

  test('non-empty email returns null', () {

    final result = emailField.validate('email');
    expect(result, null);
  });

