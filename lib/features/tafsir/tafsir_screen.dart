import 'package:flutter/material.dart';
import '../../core/services/tafsir_repository.dart';

class TafsirScreen extends StatefulWidget {
  final int surahNumber;
  final int ayahNumber;

  const TafsirScreen({
    Key? key,
    required this.surahNumber,
    required this.ayahNumber,
  }) : super(key: key);

  @override
  State<TafsirScreen> createState() => _TafsirScreenState();
}

class _TafsirScreenState extends State<TafsirScreen> {
  final TafsirRepository _tafsirRepository = TafsirRepository();
  String? _tafsirText;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTafsir();
  }

  Future<void> _loadTafsir() async {
    try {
      final text = await _tafsirRepository.getTafsir(widget.surahNumber, widget.ayahNumber);
      setState(() {
        _tafsirText = text ?? 'Tafsir not available for this Ayah.';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _tafsirText = 'Failed to load tafsir data.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tafsir - Surah ${widget.surahNumber} : Ayah ${widget.ayahNumber}'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  _tafsirText ?? '',
                  style: const TextStyle(fontSize: 18.0, height: 1.6),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
    );
  }
}
