# Amoora Market (amoora_mkt)

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/platform-android%20%7C%20ios%20%7C%20web%20%7C%20windows%20%7C%20macos%20%7C%20linux-lightgrey.svg)](https://flutter.dev)

Amoora Market (`amoora_mkt`) adalah aplikasi mobile dan multi-platform yang dibangun menggunakan **Flutter SDK** dan bahasa pemrograman **Dart**. Project ini dirancang untuk mendukung kebutuhan pemasaran dan operasional bisnis Amoora secara efisien.

---

## 🚀 Fitur Utama
*   **Multi-platform Support:** Dapat dijalankan di Android, iOS, Web, Windows, macOS, dan Linux.
*   **Arsitektur Clean & Scalable:** Struktur kode dipisah secara modular di dalam direktori `lib/` untuk memudahkan pengembangan jangka panjang.
*   **Manajemen Aset Terpusat:** Menyimpan semua aset gambar, font, dan konfigurasi lokal di dalam folder `assets/`.

---

## 🛠️ Prasyarat (Prerequisites)

Sebelum memulai, pastikan Anda telah memasang perangkat lunak berikut di komputer Anda:

*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Versi terbaru sangat direkomendasikan)
*   [Dart SDK](https://dart.dev/get-dart)
*   Android Studio / Xcode (Untuk emulator dan build mobile)
*   VS Code (Opsional, tetapi direkomendasikan dengan ekstensi Flutter & Dart)

---

## ⚙️ Memulai Pengembangan (Getting Started)

Ikuti langkah-langkah berikut untuk menjalankan project ini di lingkungan lokal Anda:

### 1. Kloning Repositori
```bash
git clone [https://github.com/antho-firuze/app.rynest.amoora_mkt.git](https://github.com/antho-firuze/app.rynest.amoora_mkt.git)
cd app.rynest.amoora_mkt

```

### 2. Install Dependensi

Unduh semua paket (packages) yang dibutuhkan yang terdaftar di `pubspec.yaml`:

```bash
flutter pub get

```

### 3. Jalankan Aplikasi

Pastikan emulator Anda sudah aktif atau perangkat fisik sudah terhubung, lalu jalankan perintah:

```bash
flutter run

```

---

## 📂 Struktur Direktori Utama

Berikut adalah gambaran singkat mengenai struktur folder dalam project ini:

* **`lib/`**: Tempat utama seluruh kode sumber Dart (UI, logika bisnis, model, dan service).
* **`assets/`**: Menyimpan file statis seperti gambar, ikon, dan font.
* **`android/` / `ios/**`: Konfigurasi spesifik untuk platform mobile (termasuk file keystore untuk rilis Android).
* **`web/` / `windows/` / `macos/` / `linux/**`: Konfigurasi spesifik untuk platform desktop dan web.

---

## 📦 Pembuatan Build (Production Release)

### Android

Untuk melakukan *build* APK atau Android App Bundle (AAB), pastikan file `upload-keystore.jks` sudah terkonfigurasi dengan benar di folder `android/app`, kemudian jalankan:

```bash
# Untuk APK
flutter build apk --release

# Untuk App Bundle (Play Store)
flutter build appbundle --release

```

### iOS

```bash
flutter build ipa --release

```

---

## 👥 Kontributor

* **Ahmad Hertanto** ([@antho-firuze](https://github.com/antho-firuze)) - *Initial work & Developer*

```

---

### 💡 Tips Tambahan:
1. Anda bisa langsung membuat atau mengedit file `README.md` di GitHub dan menempelkan (*paste*) kode Markdown di atas.
2. Jika nanti Anda menambahkan *state management* tertentu (seperti Bloc, Provider, atau GetX), pastikan untuk menambahkannya di bagian **Fitur Utama** atau **Teknologi yang Digunakan** agar tim lain lebih mudah memahami teknis project ini.

```