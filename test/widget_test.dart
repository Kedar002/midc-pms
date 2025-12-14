import 'package:flutter_test/flutter_test.dart';
import 'package:midc_pms/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome to MIDC-PMS'), findsOneWidget);
    expect(find.text('Open Spreadsheet'), findsOneWidget);
  });
}
