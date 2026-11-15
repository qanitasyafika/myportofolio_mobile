
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/menu.dart';
void main() {
  testWidgets('MyPortfolio menampilkan identitas dan tombol',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyHomePage(),
      ),
    );

    expect(find.text('2506551996'), findsOneWidget);
    expect(find.text('Qanita Syafika'), findsOneWidget);
    expect(find.text('PBP C'), findsOneWidget);

    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('Tombol Lihat Proyek menampilkan SnackBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: MyHomePage()),
    );

    await tester.tap(find.text('Lihat Proyek'));
    await tester.pumpAndSettle();

    expect(
      find.text('Kamu telah menekan tombol Lihat Proyek!'),
      findsOneWidget,
    );
  });

  testWidgets('Tombol Tambah Proyek menampilkan SnackBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: MyHomePage()),
    );

    await tester.tap(find.text('Tambah Proyek'));
    await tester.pumpAndSettle();

    expect(
      find.text('Kamu telah menekan tombol Tambah Proyek!'),
      findsOneWidget,
    );
  });

  testWidgets('Tombol Logout menampilkan SnackBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: MyHomePage()),
    );

    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();

    expect(
      find.text('Kamu telah menekan tombol Logout!'),
      findsOneWidget,
    );
  });
}
