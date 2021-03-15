import 'package:bfaf_app/main.dart';
import 'package:bfaf_app/provider/done_module_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<DoneModuleProvider>(
      create: (_) => DoneModuleProvider(),
      child: MaterialApp(
        home: ModulePage(),
      ),
    );

void main() {
  group(
    'Module List Page Widget Test',
    () {
      testWidgets(
        'Testing if Listview shows up',
        (WidgetTester tester) async {
          await tester.pumpWidget(createHomeScreen());
          expect(find.byType(ListView), findsOneWidget);
        },
      );

      testWidgets(
        'Test Done Button',
        (tester) async {
          await tester.pumpWidget(createHomeScreen());
          await tester.tap(find.byType(ElevatedButton).first);
          await tester.pumpAndSettle();
          expect(find.byIcon(Icons.done), findsNWidgets(2));
        },
      );
    },
  );
}
