import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/routes.dart';

Widget createTestApp() {
  return MaterialApp(
    initialRoute: AppRoutes.home,
    routes: {
      AppRoutes.home: (context) => const MyHomePage(),
      AppRoutes.project: (context) => const ProjectFormPage(),
      AppRoutes.education: (context) => const EducationFormPage(),
    },
  );
}

Future<void> openEducationForm(WidgetTester tester) async {
  final educationCard = find.text('Tambah Edukasi');

  await tester.ensureVisible(educationCard);
  await tester.pumpAndSettle();

  await tester.tap(educationCard);
  await tester.pumpAndSettle();
}

Future<void> selectEducationLevel(WidgetTester tester) async {
  final levelField = find.byKey(const Key('educationLevelField'));

  await tester.ensureVisible(levelField);
  await tester.pumpAndSettle();

  await tester.tap(levelField);
  await tester.pumpAndSettle();

  await tester.tap(find.text('S1').last);
  await tester.pumpAndSettle();
}

Future<void> fillEducationForm(
  WidgetTester tester, {
  String startYear = '2022',
  String endYear = '2026',
}) async {
  final institutionField = find.byKey(const Key('institutionField'));

  await tester.ensureVisible(institutionField);
  await tester.enterText(institutionField, 'Universitas Indonesia');

  await selectEducationLevel(tester);

  final majorField = find.byKey(const Key('majorField'));

  await tester.ensureVisible(majorField);
  await tester.enterText(majorField, 'Sistem Informasi');

  final startYearField = find.byKey(const Key('startYearField'));

  await tester.ensureVisible(startYearField);
  await tester.enterText(startYearField, startYear);

  final endYearField = find.byKey(const Key('endYearField'));

  await tester.ensureVisible(endYearField);
  await tester.enterText(endYearField, endYear);
}

Future<void> tapSaveButton(WidgetTester tester) async {
  final saveButton = find.text('Simpan');

  await tester.ensureVisible(saveButton);
  await tester.pumpAndSettle();

  await tester.tap(saveButton);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('MyPortfolio menampilkan identitas dan kartu aksi', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    expect(find.text('2506551996'), findsOneWidget);
    expect(find.text('Qanita Syafika'), findsOneWidget);
    expect(find.text('PBP C'), findsOneWidget);

    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Tambah Edukasi'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('Kartu Tambah Edukasi membuka formulir', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    await openEducationForm(tester);

    expect(find.text('Nama Institusi'), findsOneWidget);
    expect(find.text('Program Studi'), findsOneWidget);
    expect(find.text('Tahun Masuk'), findsOneWidget);
    expect(find.text('Tahun Lulus'), findsOneWidget);
  });

  testWidgets('Drawer dapat membuka formulir Edukasi', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    final educationMenu = find.descendant(
      of: find.byType(Drawer),
      matching: find.text('Tambah Edukasi'),
    );

    await tester.tap(educationMenu);
    await tester.pumpAndSettle();

    expect(find.text('Nama Institusi'), findsOneWidget);
    expect(find.text('Simpan'), findsOneWidget);
  });

  testWidgets('Validasi menolak input kosong', (WidgetTester tester) async {
    await tester.pumpWidget(createTestApp());

    await openEducationForm(tester);
    await tapSaveButton(tester);

    expect(find.text('Nama institusi wajib diisi.'), findsOneWidget);
    expect(find.text('Pilih jenjang pendidikan.'), findsOneWidget);
    expect(find.text('Program studi wajib diisi.'), findsOneWidget);
    expect(find.text('Tahun masuk wajib diisi.'), findsOneWidget);
    expect(find.text('Tahun lulus wajib diisi.'), findsOneWidget);
  });

  testWidgets('Validasi menolak input yang hanya berisi spasi', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    await openEducationForm(tester);

    final institutionField = find.byKey(const Key('institutionField'));

    await tester.ensureVisible(institutionField);
    await tester.enterText(institutionField, '   ');

    await tapSaveButton(tester);

    expect(find.text('Nama institusi wajib diisi.'), findsOneWidget);
  });

  testWidgets('Validasi menolak tahun lulus sebelum tahun masuk', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    await openEducationForm(tester);

    await fillEducationForm(tester, startYear: '2024', endYear: '2022');

    await tapSaveButton(tester);

    expect(
      find.text('Tahun lulus tidak boleh lebih awal dari tahun masuk.'),
      findsOneWidget,
    );
  });

  testWidgets('Input valid menampilkan dialog ringkasan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    await openEducationForm(tester);

    await fillEducationForm(tester);

    await tapSaveButton(tester);

    expect(find.text('Data Edukasi Berhasil Disimpan'), findsOneWidget);

    expect(find.text('Nama Institusi: Universitas Indonesia'), findsOneWidget);
    expect(find.text('Jenjang Pendidikan: S1'), findsOneWidget);
    expect(find.text('Program Studi: Sistem Informasi'), findsOneWidget);
    expect(find.text('Tahun Masuk: 2022'), findsOneWidget);
    expect(find.text('Tahun Lulus: 2026'), findsOneWidget);

    await tester.tap(find.text('Tutup'));
    await tester.pumpAndSettle();

    expect(find.text('Data Edukasi Berhasil Disimpan'), findsNothing);
    expect(find.text('Simpan'), findsOneWidget);
  });

  testWidgets('Home dari drawer membawa pengguna ke halaman utama', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    await openEducationForm(tester);

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('Selamat datang di MyPortfolio Mobile!'), findsOneWidget);
  });

  testWidgets('Drawer tetap menyediakan Add Project', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add Project'));
    await tester.pumpAndSettle();

    expect(find.text('Add Project Form'), findsOneWidget);
  });

  testWidgets('Kartu Tambah Proyek membuka formulir', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    final projectCard = find.text('Tambah Proyek');

    await tester.ensureVisible(projectCard);
    await tester.pumpAndSettle();

    await tester.tap(projectCard);
    await tester.pumpAndSettle();

    expect(find.text('Add Project Form'), findsOneWidget);
  });

  testWidgets('Tombol Lihat Proyek menampilkan SnackBar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    final projectCard = find.text('Lihat Proyek');

    await tester.ensureVisible(projectCard);
    await tester.pumpAndSettle();

    await tester.tap(projectCard);
    await tester.pumpAndSettle();

    expect(
      find.text('Kamu telah menekan tombol Lihat Proyek!'),
      findsOneWidget,
    );
  });

  testWidgets('Tombol Logout menampilkan SnackBar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    final logoutCard = find.text('Logout');

    await tester.ensureVisible(logoutCard);
    await tester.pumpAndSettle();

    await tester.tap(logoutCard);
    await tester.pumpAndSettle();

    expect(find.text('Kamu telah menekan tombol Logout!'), findsOneWidget);
  });
}
