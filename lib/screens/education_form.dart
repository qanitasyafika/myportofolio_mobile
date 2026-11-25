import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _institution = '';
  String? _educationLevel;
  String _major = '';
  String _startYear = '';
  String _endYear = '';

  final List<String> _levels = [
    'SMA/SMK',
    'D1',
    'D2',
    'D3',
    'D4',
    'S1',
    'S2',
    'S3',
  ];

  String? _validateYear(String? value, String label) {
    final yearText = value?.trim() ?? '';

    if (yearText.isEmpty) {
      return '$label wajib diisi.';
    }

    if (!RegExp(r'^\d{4}$').hasMatch(yearText)) {
      return '$label harus terdiri dari 4 angka.';
    }

    final year = int.parse(yearText);

    if (year < 1900 || year > DateTime.now().year) {
      return '$label harus antara 1900 dan ${DateTime.now().year}.';
    }

    return null;
  }

  void _saveForm() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Data Edukasi Berhasil Disimpan'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Institusi: ${_institution.trim()}'),
                Text('Jenjang Pendidikan: $_educationLevel'),
                Text('Program Studi: ${_major.trim()}'),
                Text('Tahun Masuk: $_startYear'),
                Text('Tahun Lulus: $_endYear'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Edukasi'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  key: const Key('institutionField'),
                  textCapitalization: TextCapitalization.words,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    labelText: 'Nama Institusi',
                    hintText: 'Contoh: Universitas Indonesia',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  onChanged: (value) {
                    _institution = value;
                  },
                  validator: (value) {
                    final input = value?.trim() ?? '';

                    if (input.isEmpty) {
                      return 'Nama institusi wajib diisi.';
                    }

                    if (input.length < 2) {
                      return 'Nama institusi minimal 2 karakter.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  key: const Key('educationLevelField'),
                  initialValue: _educationLevel,
                  decoration: const InputDecoration(
                    labelText: 'Jenjang Pendidikan',
                    border: OutlineInputBorder(),
                  ),
                  items: _levels.map((level) {
                    return DropdownMenuItem(value: level, child: Text(level));
                  }).toList(),
                  onChanged: (value) {
                    _educationLevel = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih jenjang pendidikan.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  key: const Key('majorField'),
                  textCapitalization: TextCapitalization.words,
                  maxLength: 80,
                  decoration: const InputDecoration(
                    labelText: 'Program Studi',
                    hintText: 'Contoh: Sistem Informasi',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  onChanged: (value) {
                    _major = value;
                  },
                  validator: (value) {
                    final input = value?.trim() ?? '';

                    if (input.isEmpty) {
                      return 'Program studi wajib diisi.';
                    }

                    if (input.length < 2) {
                      return 'Program studi minimal 2 karakter.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  key: const Key('startYearField'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 4,
                  decoration: const InputDecoration(
                    labelText: 'Tahun Masuk',
                    hintText: 'Contoh: 2022',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  onChanged: (value) {
                    _startYear = value;
                  },
                  validator: (value) {
                    return _validateYear(value, 'Tahun masuk');
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  key: const Key('endYearField'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 4,
                  decoration: const InputDecoration(
                    labelText: 'Tahun Lulus',
                    hintText: 'Contoh: 2026',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  onChanged: (value) {
                    _endYear = value;
                  },
                  validator: (value) {
                    final error = _validateYear(value, 'Tahun lulus');

                    if (error != null) {
                      return error;
                    }

                    final startYear = int.tryParse(_startYear.trim());
                    final endYear = int.parse(value!.trim());

                    if (startYear != null && endYear < startYear) {
                      return 'Tahun lulus tidak boleh lebih awal dari tahun masuk.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: _saveForm,
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
