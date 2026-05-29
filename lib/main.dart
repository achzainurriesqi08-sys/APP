import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'surah_feature.dart';
import 'sholawat_feature.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MunjiyatApp());
}

class MunjiyatApp extends StatelessWidget {
  const MunjiyatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Munjiyat Santri P2S',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF045B45),
          primary: const Color(0xFF045B45),
          secondary: const Color(0xFFD4AF37),
          surface: const Color(0xFFFDFBF7),
        ),
        fontFamily: 'Roboto', // Using Roboto as proxy for Inter
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Georgia', color: Color(0xFF045B45), fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontFamily: 'Georgia', color: Color(0xFF045B45), fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontFamily: 'Georgia', color: Color(0xFF045B45), fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontFamily: 'Georgia', color: Color(0xFF045B45), fontWeight: FontWeight.w600),
          titleLarge: TextStyle(fontFamily: 'Georgia', color: Color(0xFF045B45), fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  String _userName = "Gus Rizky";
  
  final List<Widget> _screens = [
    const DashboardScreen(),
    const PrayersCollectionScreen(),
    const SurahsCollectionScreen(),
    const SholawatsCollectionScreen(),
    const TasbihScreen(),
  ];

  void _showProfileSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return ProfileSheet(
          currentName: _userName,
          onNameChanged: (newName) {
            setState(() {
              _userName = newName;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withValues(alpha: 0.35),
        elevation: 0,
        foregroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.jpg'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assalamualaikum,",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
            Text(
              _userName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: _showProfileSheet,
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundColor: Color(0xFFD4AF37),
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_pesantren.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Dark overlay agar konten tetap terbaca jelas
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.45),
            ),
          ),
          // Konten utama
          _screens[_currentIndex],
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD4AF37).withOpacity(0.3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF045B45)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book, color: Color(0xFF045B45)),
            label: 'Doa',
          ),
          NavigationDestination(
            icon: Icon(Icons.import_contacts_outlined),
            selectedIcon: Icon(Icons.import_contacts, color: Color(0xFF045B45)),
            label: 'Surat',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite, color: Color(0xFF045B45)),
            label: 'Sholawat',
          ),
          NavigationDestination(
            icon: Icon(Icons.fingerprint_outlined),
            selectedIcon: Icon(Icons.fingerprint, color: Color(0xFF045B45)),
            label: 'Tasbih',
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// DASHBOARD SCREEN
// ---------------------------------------------------------
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Ayat of the Day Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF045B45),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF045B45).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4AF37).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.auto_awesome, color: Color(0xFFD4AF37), size: 16),
                        SizedBox(width: 4),
                        Text(
                          "Ayat Hari Ini",
                          style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.white, size: 20),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "فَٱذْكُرُونِىٓ أَذْكُرْكُمْ وَٱشْكُرُوا۟ لِى وَلَا تَكْفُرُونِ",
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 24,
                  color: Colors.white,
                  height: 2.0,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 12),
              Text(
                "Karena itu, ingatlah kamu kepada-Ku niscaya Aku ingat (pula) kepadamu, dan bersyukurlah kepada-Ku, dan janganlah kamu mengingkari (nikmat)-Ku.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "QS. Al-Baqarah: 152",
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Bento Grid
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE5E0D8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.chrome_reader_mode, color: Color(0xFFD4AF37)),
                    const SizedBox(height: 12),
                    const Text(
                      "Doa Dibaca",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "5 / 12",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE5E0D8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.data_usage, color: Color(0xFF045B45)),
                    const SizedBox(height: 12),
                    const Text(
                      "Target Dzikir",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "75",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text(
                          "%",
                          style: TextStyle(color: Color(0xFF045B45), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        Text(
          "Doa Populer",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        
        // Popular Prayers Carousel
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPrayerCard(context, "Doa Sapu Jagat", "Kebaikan dunia & akhirat"),
              _buildPrayerCard(context, "Doa Sayyidul Istighfar", "Penghulu mohon ampun"),
              _buildPrayerCard(context, "Doa Pagi Hari", "Memulai hari dengan berkah"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPrayerCard(BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        final prayer = mockPrayersList.firstWhere((p) => p.title == title, orElse: () => mockPrayersList[0]);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PrayerDetailScreen(prayer: prayer)),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE5E0D8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFDFBF7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.bookmark_outline, color: Color(0xFFD4AF37)),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF045B45)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 11, color: Colors.black54),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


class PrayerItem {
  final String title;
  final String subtitle;
  final String arabic;
  final String latin;
  final String translation;

  const PrayerItem(this.title, this.subtitle, this.arabic, this.latin, this.translation);
}

const List<PrayerItem> mockPrayersList = [
  PrayerItem(
    "Doa Sapu Jagat",
    "Kebaikan dunia dan akhirat",
    "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",
    "Rabbana atina fid-dunya hasanatan wa fil 'akhirati hasanatan waqina 'adhaban-nar.",
    "Ya Tuhan kami, berilah kami kebaikan di dunia dan kebaikan di akhirat dan peliharalah kami dari siksa neraka.",
  ),
  PrayerItem(
    "Doa Pagi Hari",
    "Memulai hari dengan berkah",
    "اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ",
    "Allahumma bika ashbahna, wa bika amsaina, wa bika nahya, wa bika namutu, wa ilaikan-nusyur.",
    "Ya Allah, dengan rahmat-Mu kami memasuki waktu pagi, dengan rahmat-Mu kami memasuki waktu petang, dengannya kami hidup, dengannya kami mati, dan kepada-Mu tempat kembali.",
  ),
  PrayerItem(
    "Doa Sebelum Tidur",
    "Memohon perlindungan saat tidur",
    "بِاسْمِكَ اللَّهُمَّ أَحْيَا وَبِاسْمِكَ أَمُوتُ",
    "Bismikallahumma ahya wa bismika amut.",
    "Dengan nama-Mu, ya Allah, aku hidup dan dengan nama-Mu aku mati.",
  ),
  PrayerItem(
    "Doa Bangun Tidur",
    "Syukur atas kehidupan baru",
    "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
    "Alhamdu lillahil-ladzi ahyana ba'da ma amatana wa ilaihin-nushur.",
    "Segala puji bagi Allah yang telah menghidupkan kami setelah kami mati, dan hanya kepada-Nya kami dikembalikan.",
  ),
  PrayerItem(
    "Doa Sayyidul Istighfar",
    "Penghulu mohon ampun",
    "اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَهَ إِلَّا أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ",
    "Allahumma anta Rabbi la ilaha illa anta, khalaqtani wa ana 'abduka.",
    "Ya Allah, Engkau adalah Tuhanku, tiada Tuhan yang berhak disembah kecuali Engkau. Engkaulah yang menciptakanku dan aku adalah hamba-Mu.",
  ),
  PrayerItem(
    "Doa Sebelum Makan",
    "Memohon keberkahan rezeki",
    "اللَّهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ",
    "Allahumma barik lana fima razaqtana waqina 'adzaban-nar.",
    "Ya Allah, berkahilah rezeki yang telah Engkau karuniakan kepada kami dan peliharalah kami dari siksa neraka.",
  ),
  PrayerItem(
    "Doa Selepas Makan",
    "Syukur sesudah makan",
    "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ",
    "Alhamdu lillahil-ladzi ath'amana wa saqana wa ja'alana muslimin.",
    "Segala puji bagi Allah yang telah memberi kami makan dan minum serta menjadikan kami orang-orang muslim.",
  ),
];

// ---------------------------------------------------------
// PRAYERS COLLECTION SCREEN
// ---------------------------------------------------------
class PrayersCollectionScreen extends StatefulWidget {
  const PrayersCollectionScreen({super.key});

  @override
  State<PrayersCollectionScreen> createState() => _PrayersCollectionScreenState();
}

class _PrayersCollectionScreenState extends State<PrayersCollectionScreen> {
  final List<String> categories = ["Semua", "Pagi & Petang", "Perlindungan", "Sholat", "Dzikir", "Rezeki"];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Cari doa, terjemahan...",
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
        
        // Category Filter
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedCategoryIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF045B45) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF045B45) : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        
        // List of Prayers
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: mockPrayersList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final prayer = mockPrayersList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrayerDetailScreen(prayer: prayer)),
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
                            "${index + 1}",
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
                              prayer.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF045B45)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              prayer.subtitle,
                              style: const TextStyle(color: Colors.black54, fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          index == 0 ? Icons.bookmark : Icons.bookmark_outline,
                          color: const Color(0xFFD4AF37),
                        ),
                        onPressed: () {},
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

// ---------------------------------------------------------
// PRAYER DETAIL SCREEN
// ---------------------------------------------------------
class PrayerDetailScreen extends StatelessWidget {
  final PrayerItem prayer;
  const PrayerDetailScreen({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prayer.title, style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color(0xFFFDFBF7),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Color(0xFF045B45)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    prayer.arabic,
                    style: const TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 32,
                      height: 2.2,
                      color: Color(0xFF045B45),
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    prayer.latin,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFD4AF37),
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    prayer.translation,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // Audio Player UI Mock
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE5E0D8)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF045B45),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.play_arrow, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Mock Waveform
                        Expanded(
                          child: Row(
                            children: List.generate(20, (index) {
                              return Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                  height: index % 2 == 0 ? 12 : 24,
                                  decoration: BoxDecoration(
                                    color: index < 5 ? const Color(0xFFD4AF37) : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text("0:12", style: TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Action Button
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back and user can navigate to tasbih manually, or dispatch tasbih state for a real app.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF045B45),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Mulai Dzikir", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// DIGITAL TASBIH SCREEN
// ---------------------------------------------------------
class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> with SingleTickerProviderStateMixin {
  int _count = 0;
  int _target = 33;
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _increment() {
    HapticFeedback.lightImpact(); // Simulator tactile tap
    
    setState(() {
      if (_target == 0) { // Infinite
        _count++;
      } else {
        if (_count < _target) {
          _count++;
        }
      }
    });

    if (_target != 0 && _count == _target) {
      HapticFeedback.heavyImpact();
      Future.delayed(const Duration(milliseconds: 200), () {
        HapticFeedback.heavyImpact(); // Dual vibration on target
      });
    }

    _animController.forward().then((_) => _animController.reverse());
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Progress calculation
    double progress = _target == 0 ? 0.0 : (_count / _target).clamp(0.0, 1.0);
    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: _reset, icon: const Icon(Icons.refresh, color: Colors.black54)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE5E0D8)),
                ),
                child: DropdownButton<int>(
                  value: _target,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF045B45)),
                  items: const [
                    DropdownMenuItem(value: 33, child: Text("Target: 33", style: TextStyle(fontWeight: FontWeight.bold))),
                    DropdownMenuItem(value: 99, child: Text("Target: 99", style: TextStyle(fontWeight: FontWeight.bold))),
                    DropdownMenuItem(value: 0, child: Text("Target: ∞", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _target = val!;
                      _count = 0;
                    });
                  },
                ),
              ),
            ],
          ),
          
          Expanded(
            child: Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: GestureDetector(
                  onTap: _increment,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Progress Ring Base
                      SizedBox(
                        width: 280,
                        height: 280,
                        child: CircularProgressIndicator(
                          value: 1.0,
                          strokeWidth: 8,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      // Active Progress Ring
                      SizedBox(
                        width: 280,
                        height: 280,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 8,
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.lerp(const Color(0xFF045B45), const Color(0xFFD4AF37), progress) ?? const Color(0xFF045B45)
                          ),
                        ),
                      ),
                      // Main Tactile Button
                      Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF045B45),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF045B45).withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$_count",
                                style: const TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Georgia'
                                ),
                              ),
                              if (_target != 0)
                                Text(
                                  "/ $_target",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          const Text(
            "Ketuk lingkaran untuk menghitung",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// PROFILE SHEET
// ---------------------------------------------------------
class ProfileSheet extends StatefulWidget {
  final String currentName;
  final ValueChanged<String> onNameChanged;

  const ProfileSheet({super.key, required this.currentName, required this.onNameChanged});

  @override
  State<ProfileSheet> createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet> {
  late TextEditingController _nameController;
  int _selectedAvatar = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Profil Santri",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF045B45)),
              ),
              IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
            ],
          ),
          const SizedBox(height: 24),
          
          const Text("Panggilan Anda", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFFDFBF7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF045B45)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          const Text("Pilih Karakter", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              final isSelected = index == _selectedAvatar;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAvatar = index;
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? const Color(0xFFD4AF37) : Colors.transparent,
                      width: 3,
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.face,
                      color: isSelected ? const Color(0xFF045B45) : Colors.grey,
                      size: 32,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 32),
          
          ElevatedButton(
            onPressed: () {
              widget.onNameChanged(_nameController.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF045B45),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Simpan Profil", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
