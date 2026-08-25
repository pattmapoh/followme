// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:followme/main.dart';

void main() {
  testWidgets('สมัครบัญชีแล้วไปหน้าโปรไฟล์และเปิดฟอร์มแก้ไขได้', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());

    expect(find.text('iSharing'), findsOneWidget);
    await tester.tap(find.text('สมัครบัญชี'));
    await tester.pumpAndSettle();

    final signupFields = find.byType(TextField);
    await tester.enterText(signupFields.at(0), 'my name');
    await tester.enterText(signupFields.at(1), 'test@example.com');
    await tester.enterText(signupFields.at(2), 'password');
    await tester.enterText(signupFields.at(3), 'password');
    await tester.tap(find.text('สมัครบัญชี'));
    await tester.pumpAndSettle();

    expect(find.text('โปรไฟล์ของฉัน'), findsOneWidget);
    expect(find.text('my name'), findsOneWidget);

    await tester.tap(find.text('ตั้งชื่อเรา'));
    await tester.pump();

    expect(find.text('ตั้งชื่อใหม่'), findsOneWidget);
    expect(find.text('บันทึก'), findsOneWidget);

    await tester.tap(find.text('บันทึก'));
    await tester.pump();
    expect(find.text('ตั้งชื่อเรา'), findsOneWidget);
  });
}
