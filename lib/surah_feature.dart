import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurahItem {
  final int nomor;
  final String title;
  final String subtitle;

  const SurahItem(this.nomor, this.title, this.subtitle);
}

const List<SurahItem> targetSurahs = [
  SurahItem(36, "Yasin", "Jantung Al-Quran / 83 Ayat"),
  SurahItem(55, "Ar-Rahman", "Maha Pemurah / 78 Ayat"),
  SurahItem(56, "Al-Waqi'ah", "Hari Kiamat / 96 Ayat"),
  SurahItem(67, "Al-Mulk", "Kerajaan / 30 Ayat"),
  SurahItem(76, "Al-Insan", "Manusia / 31 Ayat"),
  SurahItem(32, "As-Sajdah", "Sujud / 30 Ayat"),
  SurahItem(85, "Al-Buruj", "Gugusan Bintang / 22 Ayat"),
  SurahItem(18, "Al-Kahfi", "Gua / 110 Ayat"),
];

class SurahsCollectionScreen extends StatefulWidget {
  const SurahsCollectionScreen({super.key});

  @override
  State<SurahsCollectionScreen> createState() => _SurahsCollectionScreenState();
}

class _SurahsCollectionScreenState extends State<SurahsCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Cari Surat...",
              prefixIcon: const Icon(Icons.search, color: Color(0xFF045B45)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFF045B45)),
              ),
            ),
          ),
        ),
        
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: targetSurahs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final surah = targetSurahs[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurahDetailScreen(surah: surah)),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE5E0D8)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDFBF7),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
                        ),
                        child: Center(
                          child: Text(
                            "${surah.nomor}",
                            style: const TextStyle(
                              color: Color(0xFF045B45),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              surah.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF045B45)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              surah.subtitle,
                              style: const TextStyle(color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "surah", // Calligraphy placeholder
                        style: TextStyle(fontFamily: 'Georgia', fontSize: 20, color: Color(0xFFD4AF37), fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SurahDetailScreen extends StatefulWidget {
  final SurahItem surah;
  const SurahDetailScreen({super.key, required this.surah});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  List<dynamic> _ayatList = [];
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _fetchSurah();
  }

  Future<void> _fetchSurah() async {
    try {
      final response = await http.get(Uri.parse('https://equran.id/api/v2/surat/${widget.surah.nomor}'));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        setState(() {
          _ayatList = decoded['data']['ayat'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _isError = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surat ${widget.surah.title}", style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color(0xFFFDFBF7),
        elevation: 0,
        centerTitle: true,
      ),
      body: _isLoading 
        ? const Center(
            child: CircularProgressIndicator(color: Color(0xFF045B45)),
          )
        : _isError 
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                const SizedBox(height: 16),
                const Text("Gagal memuat ayat, periksa koneksi internet Anda."),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                      _isError = false;
                    });
                    _fetchSurah();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF045B45)),
                  child: const Text("Coba Lagi", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(24.0),
            itemCount: _ayatList.length + 1, // +1 for Bismillah header if not Al-Tawbah (we can just add it generally for these surahs)
            separatorBuilder: (context, index) => const Divider(height: 48, color: Color(0xFFE5E0D8)),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF045B45).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم",
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 28,
                      height: 2.2,
                      color: Color(0xFF045B45),
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                );
              }
              
              final ayat = _ayatList[index - 1];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF045B45),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${ayat['nomorAyat']}",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          ayat['teksArab'],
                          style: const TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 28,
                            height: 2.2,
                            color: Color(0xFF045B45),
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    ayat['teksLatin'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFD4AF37),
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    ayat['teksIndonesia'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}
