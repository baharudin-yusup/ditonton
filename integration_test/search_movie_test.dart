import 'package:ditonton/common/constants.dart';
import 'package:ditonton/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'tap the search icon button and then input "Resident" in the text field',
      (tester) async {
    /// Init
    app.main();
    await tester.pumpAndSettle();

    /// Open search movie page
    final searchButton = find.byKey(kSearchButtonKey);
    expect(searchButton, findsOneWidget);
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    /// Input "Resident" in the text field
    final textField = find.byKey(kTexFieldKey);
    expect(textField, findsOneWidget);
    await tester.pump(Duration(milliseconds: 400));
    await tester.enterText(textField, 'Resident');

    /// Verify the input
    expect(find.text('Resident'), findsOneWidget);
  });
}
