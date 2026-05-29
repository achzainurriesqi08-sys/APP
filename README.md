# 🕋 Munjiyat Santri P2S - Application Blueprint

Dokumen ini berisi cetak biru (blueprint) arsitektur, struktur folder, dan panduan komponen untuk pengembangan aplikasi **Munjiyat Santri P2S**. Blueprint ini dirancang menggunakan pendekatan **Feature-First Structure** untuk memastikan kode tetap rapi, modular, mudah dirawat (*maintainable*), dan siap untuk dikembangkan skalanya di masa depan.

---

## 🎨 1. Panduan Desain & Identitas Visual (Design System)

Aplikasi ini mengusung tema *Islamic Elegant* dengan kontras tinggi untuk memastikan kenyamanan santri saat membaca teks dzikir maupun tulisan Arab.

### Warna Utama (Color Palette)
*   **Primary Green:** `#045B45` (Representasi nuansa Islami/Pesantren yang tenang).
*   **Secondary Gold:** `#D4AF37` (Aksen premium untuk indikator, ikon penting, dan tasbih).
*   **Surface Light:** `#FDFBF7` (Warna latar belakang berwujud krem hangat untuk mengurangi kelelahan mata).
*   **Card Border:** `#E5E0D8` (Garis tepi tipis untuk pemisah komponen Bento Grid).

### Tipografi (Typography)
*   **Teks Arab & Judul Utama:** Menggunakan font `Georgia` (atau font Serif lokal) dengan pengaturan *Right-to-Left* (RTL) pada teks Arab untuk menjaga keaslian harakat.
*   **Teks Bacaan Latin & Deskripsi:** Menggunakan font `Roboto` / `Inter` (Sans-serif) untuk keterbacaan yang optimal pada perangkat seluler.

---

## 📂 2. Struktur Folder & Arsitektur Kode (Feature-First)

Untuk memisahkan fungsionalitas antar fitur (Doa, Surah, Sholawat, Tasbih), struktur kode di dalam direktori `lib/` diatur sebagai berikut:

```text
lib/
│
├── main.dart                       # Entry point aplikasi & Konfigurasi tema global
│
├── core/                           # Komponen global yang digunakan lintas fitur
│   ├── constants/
│   │   ├── app_colors.dart         # Kode hex warna primary, secondary, & surface
│   │   └── app_styles.dart         # Konfigurasi TextTheme (Georgia & Roboto)
│   └── widgets/
│       └── global_background.dart  # Stack widget untuk gambar latar pesantren & overlay gelap
│
└── features/                       # Modul Utama Aplikasi (Berbasis Fitur)
    ├── dashboard/
    │   └── presentation/
    │       ├── screens/dashboard_screen.dart
    │       └── widgets/ayat_of_the_day_card.dart
    │
    ├── doa/
    │   ├── data/models/prayer_model.dart       # Model data untuk struktur PrayerItem
    │   └── presentation/
    │       ├── screens/prayers_collection_screen.dart
    │       ├── screens/prayer_detail_screen.dart
    │       └── widgets/audio_waveform_mock.dart
    │
    ├── surah/                      # Modul Surah Pilihan (surah_feature.dart)
    │   └── presentation/screens/surahs_collection_screen.dart
    │
    ├── sholawat/                   # Modul Koleksi Sholawat (sholawat_feature.dart)
    │   └── presentation/screens/sholawats_collection_screen.dart
    │
    └── tasbih/
        └── presentation/
            ├── screens/tasbih_screen.dart
            └── widgets/counter_circle.dart     # Lingkaran tasbih interaktif dengan efek haptic