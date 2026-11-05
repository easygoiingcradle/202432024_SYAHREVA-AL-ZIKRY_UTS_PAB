import 'package:flutter/material.dart';

void main() {
  runApp(const LostAndFoundApp());
}
//Syahreva Al Zikry_202432024
// ============================================================================
// 1. ROOT APPLICATION WIDGET
// ============================================================================
class LostAndFoundApp extends StatelessWidget {
  const LostAndFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost & Found Kampus ITPLN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0088A9),
          primary: const Color(0xFF0088A9),
          secondary: const Color(0xFF005F75),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0088A9),
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 2,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ============================================================================
// 2. MODEL DATA LAPORAN BARANG (LOST & FOUND)
// ============================================================================
class LaporanBarang {
  final String id;
  final String namaBarang;
  final String kategori;
  final String jenisLaporan; // 'Hilang' atau 'Ditemukan'
  final String lokasi;
  final String waktu;
  final String deskripsi;
  final String namaPelapor;
  final String kontakPelapor;
  final String imageUrl;
  final bool isAssetImage;
  bool sudahSelesai;

  LaporanBarang({
    required this.id,
    required this.namaBarang,
    required this.kategori,
    required this.jenisLaporan,
    required this.lokasi,
    required this.waktu,
    required this.deskripsi,
    required this.namaPelapor,
    required this.kontakPelapor,
    required this.imageUrl,
    this.isAssetImage = false,
    this.sudahSelesai = false,
  });
}

// ============================================================================
// 3. HALAMAN UTAMA (HOME PAGE DENGAN TABBAR & TABBARVIEW)
// ============================================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategoryFilter = 'Semua';

  final List<String> _kategoriList = [
    'Semua',
    'Dompet & Identitas',
    'Elektronik',
    'Kunci & Aksesori',
    'Dokumen & Buku',
    'Lainnya',
  ];

  // Data awal (Dummy Data) yang disimpan di dalam list selama aplikasi berjalan
  final List<LaporanBarang> _daftarLaporan = [
    LaporanBarang(
      id: 'LF-001',
      namaBarang: 'Dompet Kulit Cokelat + KTM ITPLN',
      kategori: 'Dompet & Identitas',
      jenisLaporan: 'Hilang',
      lokasi: 'Kantin Lt. 1 Menara PLN',
      waktu: '04 Nov 2026, 12:30 WIB',
      deskripsi:
          'Dompet kulit lipat warna cokelat tua berisi KTM ITPLN, KTP, dan uang tunai. Terakhir terlihat di meja pojok kantin saat jam istirahat siang.',
      namaPelapor: 'Rizky Pratama (Mahasiswa S1 Sistem Informasi)',
      kontakPelapor: '0812-3456-7890 (WhatsApp)',
      imageUrl:
          'https://images.unsplash.com/photo-1627123424574-724758594e93?auto=format&fit=crop&w=600&q=80',
    ),
    LaporanBarang(
      id: 'LF-002',
      namaBarang: 'TWS Earbuds Putih (Casing Silikon Biru)',
      kategori: 'Elektronik',
      jenisLaporan: 'Hilang',
      lokasi: 'Lab Software Architecture & Quality (Lt. 4)',
      waktu: '05 Nov 2026, 10:15 WIB',
      deskripsi:
          'Earbuds warna putih dengan pelindung silikon biru muda. Tertinggal di meja praktikum baris kedua setelah sesi praktikum PAB.',
      namaPelapor: 'Nadia Putri (Mahasiswa S1 Teknik Informatika)',
      kontakPelapor: '0813-9876-5432 (WhatsApp)',
      imageUrl:
          'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&w=600&q=80',
    ),
    LaporanBarang(
      id: 'LF-003',
      namaBarang: 'Kunci Motor Honda + Gantungan Akrilik',
      kategori: 'Kunci & Aksesori',
      jenisLaporan: 'Ditemukan',
      lokasi: 'Area Parkir Motor Gedung Utama',
      waktu: '05 Nov 2026, 08:45 WIB',
      deskripsi:
          'Ditemukan sepasang kunci motor Honda dengan gantungan akrilik logo himpunan di dekat pos keluar parkir motor. Saat ini diamankan di Pos Satpam.',
      namaPelapor: 'Bpk. Hendra (Petugas Keamanan Kampus)',
      kontakPelapor: 'Pos Keamanan Lt. Dasar / 0857-1122-3344',
      imageUrl:
          'https://images.unsplash.com/photo-1582139329536-e7284fece509?auto=format&fit=crop&w=600&q=80',
    ),
    LaporanBarang(
      id: 'LF-004',
      namaBarang: 'Tumbler Stainless Hitam 500ml',
      kategori: 'Lainnya',
      jenisLaporan: 'Ditemukan',
      lokasi: 'Ruang Perpustakaan Lt. 2',
      waktu: '04 Nov 2026, 15:20 WIB',
      deskripsi:
          'Ditemukan botol minum stainless warna hitam doff di meja baca nomor 6. Terdapat stiker kecil bertuliskan "Flutter Dev" di bagian bawah botol.',
      namaPelapor: 'Siti Rahmawati (Staf Perpustakaan)',
      kontakPelapor: 'Meja Layanan Perpustakaan Lt. 2',
      imageUrl:
          'https://images.unsplash.com/photo-1602143407151-7111542de6e8?auto=format&fit=crop&w=600&q=80',
    ),
    LaporanBarang(
      id: 'LF-005',
      namaBarang: 'Flashdisk SanDisk 64GB Hitam-Merah',
      kategori: 'Elektronik',
      jenisLaporan: 'Ditemukan',
      lokasi: 'Ruang Kelas 304',
      waktu: '03 Nov 2026, 16:00 WIB',
      deskripsi:
          'Flashdisk masih menancap di PC dosen ruang 304 setelah perkuliahan selesai. Berisi folder tugas praktikum dan laporan.',
      namaPelapor: 'Dimas Aditya (Mahasiswa S1 Sistem Informasi)',
      kontakPelapor: '0821-5566-7788 (WhatsApp)',
      imageUrl:
          'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?auto=format&fit=crop&w=600&q=80',
    ),
  ];

  // Navigasi ke halaman Formulir (Navigator.push) dan menerima data baru (Navigator.pop)
  Future<void> _bukaFormTambahLaporan({String defaultJenis = 'Hilang'}) async {
    final LaporanBarang? laporanBaru = await Navigator.push<LaporanBarang>(
      context,
      MaterialPageRoute(
        builder: (context) => FormLaporanPage(initialJenisLaporan: defaultJenis),
      ),
    );

    if (laporanBaru != null) {
      setState(() {
        _daftarLaporan.insert(0, laporanBaru);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Laporan "${laporanBaru.namaBarang}" (${laporanBaru.jenisLaporan}) berhasil ditambahkan!',
          ),
          backgroundColor: const Color(0xFF0088A9),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // Navigasi ke halaman Detail Barang (Navigator.push)
  Future<void> _bukaDetailBarang(LaporanBarang barang) async {
    final bool? statusDiubah = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => DetailBarangPage(barang: barang),
      ),
    );

    if (statusDiubah == true) {
      setState(() {});
    }
  }

  List<LaporanBarang> _filterBerdasarkanJenis(String jenis) {
    return _daftarLaporan.where((item) {
      final cocokJenis = item.jenisLaporan == jenis;
      final cocokKategori = _selectedCategoryFilter == 'Semua' ||
          item.kategori == _selectedCategoryFilter;
      return cocokJenis && cocokKategori;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final listBarangHilang = _filterBerdasarkanJenis('Hilang');
    final listBarangDitemukan = _filterBerdasarkanJenis('Ditemukan');

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F8FA),
        appBar: AppBar(
          title: Row(
            children: [
              // Penggunaan Image.asset pada AppBar dengan fallback ikon
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    'assets/images/logo_kampus.png',
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.travel_explore,
                      color: Color(0xFF0088A9),
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SI-TEMU ITPLN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Pusat Informasi Barang Hilang & Temuan Kampus',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorColor: Colors.amberAccent,
            indicatorWeight: 3.5,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            tabs: [
              Tab(
                icon: Icon(Icons.search_off_rounded, size: 20),
                text: 'Barang Hilang',
              ),
              Tab(
                icon: Icon(Icons.check_circle_outline_rounded, size: 20),
                text: 'Ditemukan',
              ),
              Tab(
                icon: Icon(Icons.info_outline_rounded, size: 20),
                text: 'Info & Rekap',
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            // Bar Filter Kategori
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _kategoriList.map((kategori) {
                    final bool isSelected = _selectedCategoryFilter == kategori;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(kategori),
                        selected: isSelected,
                        selectedColor: const Color(0xFF0088A9),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 12,
                        ),
                        onSelected: (_) {
                          setState(() {
                            _selectedCategoryFilter = kategori;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Isi Halaman dengan TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  // TAB 1: Menggunakan ListView.builder untuk Daftar Barang Hilang
                  _buildTabBarangHilang(listBarangHilang),

                  // TAB 2: Menggunakan ListView.separated untuk Daftar Barang Ditemukan
                  _buildTabBarangDitemukan(listBarangDitemukan),

                  // TAB 3: Halaman Ringkasan, Statistik & Panduan Posko (Image.asset)
                  _buildTabInfoDanPanduan(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _bukaFormTambahLaporan(defaultJenis: 'Hilang'),
          backgroundColor: const Color(0xFF0088A9),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add_circle_outline),
          label: const Text(
            'Buat Laporan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------------------------------
  // TAB 1: DAFTAR BARANG HILANG (MENGGUNAKAN ListView.builder)
  // --------------------------------------------------------------------------
  Widget _buildTabBarangHilang(List<LaporanBarang> items) {
    if (items.isEmpty) {
      return _buildEmptyState(
        'Belum ada laporan barang hilang pada kategori ini.',
        Icons.search_off_rounded,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 85),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final barang = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _buildBarangCard(barang),
        );
      },
    );
  }

  // --------------------------------------------------------------------------
  // TAB 2: DAFTAR BARANG DITEMUKAN (MENGGUNAKAN ListView.separated)
  // --------------------------------------------------------------------------
  Widget _buildTabBarangDitemukan(List<LaporanBarang> items) {
    if (items.isEmpty) {
      return _buildEmptyState(
        'Belum ada laporan barang ditemukan pada kategori ini.',
        Icons.inventory_2_outlined,
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 85),
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(
        height: 18,
        thickness: 1,
        color: Color(0xFFDCE6EC),
      ),
      itemBuilder: (context, index) {
        final barang = items[index];
        return _buildBarangCard(barang);
      },
    );
  }

  // --------------------------------------------------------------------------
  // TAB 3: RINGKASAN STATISTIK & PANDUAN POSKO (MENGGUNAKAN Image.asset)
  // --------------------------------------------------------------------------
  Widget _buildTabInfoDanPanduan() {
    final totalHilang =
        _daftarLaporan.where((e) => e.jenisLaporan == 'Hilang').length;
    final totalDitemukan =
        _daftarLaporan.where((e) => e.jenisLaporan == 'Ditemukan').length;
    final totalSelesai = _daftarLaporan.where((e) => e.sudahSelesai).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Kartu Banner Kampus dengan Image.asset
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/logo_kampus.png',
                      height: 110,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBF7FA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_balance,
                                size: 42,
                                color: Color(0xFF0088A9),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Software Architecture & Quality Laboratory - ITPLN',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0088A9),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Layanan Terpadu Barang Hilang & Temuan (Lost & Found)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Fakultas Telematika Energi – Institut Teknologi PLN Jakarta\nMenara PLN, Jl. Lingkar Luar Barat, Duri Kosambi, Jakarta Barat',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Ringkasan Statistik Laporan
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  label: 'Barang Hilang',
                  count: totalHilang.toString(),
                  color: Colors.red.shade700,
                  icon: Icons.report_problem_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  label: 'Ditemukan',
                  count: totalDitemukan.toString(),
                  color: Colors.teal.shade700,
                  icon: Icons.where_to_vote_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  label: 'Terselesaikan',
                  count: totalSelesai.toString(),
                  color: Colors.blue.shade700,
                  icon: Icons.verified_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Tombol Aksi Cepat (Button)
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () =>
                      _bukaFormTambahLaporan(defaultJenis: 'Hilang'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: const Icon(Icons.campaign_outlined),
                  label: const Text('Lapor Kehilangan'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () =>
                      _bukaFormTambahLaporan(defaultJenis: 'Ditemukan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: const Icon(Icons.volunteer_activism_outlined),
                  label: const Text('Lapor Penemuan'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Panduan Prosedur Pelaporan & Klaim
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Panduan Pelaporan & Pengambilan Barang',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF005F75),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1. Pilih tab "Barang Hilang" atau "Ditemukan" untuk memeriksa apakah barang Anda sudah dilaporkan.\n'
                    '2. Ketuk salah satu item pada daftar untuk melihat detail lengkap lokasi, waktu, foto, dan kontak pelapor.\n'
                    '3. Tekan tombol "Buat Laporan" untuk mengisi formulir kehilangan atau penemuan barang baru.\n'
                    '4. Apabila barang telah kembali ke pemiliknya, buka halaman Detail dan tekan tombol "Tandai Sudah Diklaim / Selesai".',
                    style: TextStyle(fontSize: 13, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String label,
    required String count,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 6),
          Text(
            count,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------
  // KOMPONEN CARD BARANG (MENGGUNAKAN Image.network & Layout Row/Column)
  // --------------------------------------------------------------------------
  Widget _buildBarangCard(LaporanBarang barang) {
    final bool isHilang = barang.jenisLaporan == 'Hilang';
    final Color statusColor =
        isHilang ? Colors.red.shade700 : Colors.teal.shade700;

    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _bukaDetailBarang(barang),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Barang menggunakan Image.network atau Image.asset
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: barang.isAssetImage
                      ? Image.asset(
                          barang.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, err, st) =>
                              _buildFallbackThumbnail(isHilang),
                        )
                      : Image.network(
                          barang.imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              _buildFallbackThumbnail(isHilang),
                        ),
                ),
              ),
              const SizedBox(width: 12),

              // Informasi Ringkas Barang
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            barang.jenisLaporan.toUpperCase(),
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            barang.kategori,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        if (barang.sudahSelesai)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Selesai',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade800,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      barang.namaBarang,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Color(0xFF0088A9),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            barang.lokasi,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.black45,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            barang.waktu,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackThumbnail(bool isHilang) {
    return Container(
      color: isHilang ? Colors.red.shade50 : Colors.teal.shade50,
      child: Icon(
        isHilang ? Icons.help_outline_rounded : Icons.inventory_2_outlined,
        color: isHilang ? Colors.red.shade400 : Colors.teal.shade400,
        size: 36,
      ),
    );
  }

  Widget _buildEmptyState(String pesan, IconData icon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              pesan,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 4. HALAMAN DETAIL INFORMASI BARANG (DETAIL PAGE)
// ============================================================================
class DetailBarangPage extends StatefulWidget {
  final LaporanBarang barang;

  const DetailBarangPage({super.key, required this.barang});

  @override
  State<DetailBarangPage> createState() => _DetailBarangPageState();
}

class _DetailBarangPageState extends State<DetailBarangPage> {
  @override
  Widget build(BuildContext context) {
    final barang = widget.barang;
    final bool isHilang = barang.jenisLaporan == 'Hilang';
    final Color badgeColor =
        isHilang ? Colors.red.shade700 : Colors.teal.shade700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Informasi Barang'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar Utama Barang (Image.network / Image.asset)
            SizedBox(
              height: 240,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  barang.isAssetImage
                      ? Image.asset(
                          barang.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, err, st) =>
                              _buildDetailFallbackImage(isHilang),
                        )
                      : Image.network(
                          barang.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, err, st) =>
                              _buildDetailFallbackImage(isHilang),
                        ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'LAPORAN BARANG ${barang.jenisLaporan.toUpperCase()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        avatar: const Icon(Icons.category_outlined, size: 16),
                        label: Text(barang.kategori),
                        backgroundColor: const Color(0xFFEBF7FA),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        avatar: Icon(
                          barang.sudahSelesai
                              ? Icons.check_circle
                              : Icons.pending_outlined,
                          size: 16,
                          color: barang.sudahSelesai
                              ? Colors.green.shade700
                              : Colors.orange.shade800,
                        ),
                        label: Text(
                          barang.sudahSelesai
                              ? 'Sudah Diklaim / Selesai'
                              : 'Masih Aktif',
                        ),
                        backgroundColor: barang.sudahSelesai
                            ? Colors.green.shade50
                            : Colors.orange.shade50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    barang.namaBarang,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID Laporan: ${barang.id}',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const Divider(height: 28),

                  // Informasi Lokasi & Waktu Kehilangan / Penemuan
                  _buildInfoRow(
                    icon: Icons.place_outlined,
                    label:
                        'Lokasi ${isHilang ? "Kehilangan" : "Penemuan"} Barang',
                    value: barang.lokasi,
                  ),
                  const SizedBox(height: 14),
                  _buildInfoRow(
                    icon: Icons.calendar_today_outlined,
                    label:
                        'Waktu ${isHilang ? "Kehilangan" : "Penemuan"} Barang',
                    value: barang.waktu,
                  ),
                  const SizedBox(height: 14),
                  _buildInfoRow(
                    icon: Icons.person_outline,
                    label: 'Dilaporkan Oleh',
                    value: barang.namaPelapor,
                  ),
                  const SizedBox(height: 14),
                  _buildInfoRow(
                    icon: Icons.phone_outlined,
                    label: 'Kontak / Posko Pengambilan',
                    value: barang.kontakPelapor,
                  ),
                  const Divider(height: 28),

                  const Text(
                    'Deskripsi & Ciri-Ciri Barang',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      barang.deskripsi,
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tombol Aksi (Button & Navigator.pop)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              barang.sudahSelesai = !barang.sudahSelesai;
                            });
                            Navigator.pop(context, true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: barang.sudahSelesai
                                ? Colors.orange.shade700
                                : const Color(0xFF0088A9),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          icon: Icon(
                            barang.sudahSelesai
                                ? Icons.replay
                                : Icons.check_circle_outline,
                          ),
                          label: Text(
                            barang.sudahSelesai
                                ? 'Tandai Masih Aktif'
                                : 'Tandai Sudah Selesai',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEBF7FA),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF0088A9), size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailFallbackImage(bool isHilang) {
    return Container(
      color: isHilang ? Colors.red.shade50 : Colors.teal.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isHilang ? Icons.search_off_rounded : Icons.inventory_2_outlined,
            size: 64,
            color: isHilang ? Colors.red.shade400 : Colors.teal.shade400,
          ),
          const SizedBox(height: 8),
          const Text('Gambar Barang'),
        ],
      ),
    );
  }
}

// ============================================================================
// 5. HALAMAN FORMULIR TAMBAH LAPORAN (INPUT DATA & VALIDASI)
// ============================================================================
class FormLaporanPage extends StatefulWidget {
  final String initialJenisLaporan;

  const FormLaporanPage({super.key, this.initialJenisLaporan = 'Hilang'});

  @override
  State<FormLaporanPage> createState() => _FormLaporanPageState();
}

class _FormLaporanPageState extends State<FormLaporanPage> {
  final _formKey = GlobalKey<FormState>();

  late String _jenisLaporan;
  String _selectedKategori = 'Elektronik';

  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _waktuController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _pelaporController = TextEditingController();
  final TextEditingController _kontakController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  final List<String> _pilihanKategori = [
    'Dompet & Identitas',
    'Elektronik',
    'Kunci & Aksesori',
    'Dokumen & Buku',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    _jenisLaporan = widget.initialJenisLaporan;
  }

  @override
  void dispose() {
    _namaBarangController.dispose();
    _lokasiController.dispose();
    _waktuController.dispose();
    _deskripsiController.dispose();
    _pelaporController.dispose();
    _kontakController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _simpanLaporan() {
    if (_formKey.currentState!.validate()) {
      final String urlInput = _imageUrlController.text.trim();
      final String defaultImage = _jenisLaporan == 'Hilang'
          ? 'https://images.unsplash.com/photo-1544816155-12df9643f363?auto=format&fit=crop&w=600&q=80'
          : 'https://images.unsplash.com/photo-1586769852044-692d6e3703f0?auto=format&fit=crop&w=600&q=80';

      final laporanBaru = LaporanBarang(
        id: 'LF-${DateTime.now().millisecondsSinceEpoch.toString().substring(9)}',
        namaBarang: _namaBarangController.text.trim(),
        kategori: _selectedKategori,
        jenisLaporan: _jenisLaporan,
        lokasi: _lokasiController.text.trim(),
        waktu: _waktuController.text.trim(),
        deskripsi: _deskripsiController.text.trim(),
        namaPelapor: _pelaporController.text.trim(),
        kontakPelapor: _kontakController.text.trim(),
        imageUrl: urlInput.isNotEmpty ? urlInput : defaultImage,
      );

      // Mengirim data kembali ke halaman utama menggunakan Navigator.pop
      Navigator.pop(context, laporanBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Laporan Barang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pilihan Jenis Laporan (Kehilangan / Penemuan)
              const Text(
                'Jenis Laporan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text(
                        'Kehilangan',
                        style: TextStyle(fontSize: 13),
                      ),
                      value: 'Hilang',
                      groupValue: _jenisLaporan,
                      activeColor: Colors.red.shade700,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: _jenisLaporan == 'Hilang'
                              ? Colors.red.shade700
                              : Colors.grey.shade300,
                        ),
                      ),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _jenisLaporan = value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text(
                        'Penemuan',
                        style: TextStyle(fontSize: 13),
                      ),
                      value: 'Ditemukan',
                      groupValue: _jenisLaporan,
                      activeColor: Colors.teal.shade700,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: _jenisLaporan == 'Ditemukan'
                              ? Colors.teal.shade700
                              : Colors.grey.shade300,
                        ),
                      ),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _jenisLaporan = value);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Input Nama Barang
              TextFormField(
                controller: _namaBarangController,
                decoration: const InputDecoration(
                  labelText: 'Nama Barang *',
                  hintText: 'Contoh: KTP & KTM a.n. Budi / Charger Laptop Asus',
                  prefixIcon: Icon(Icons.inventory_2_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama barang wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Dropdown Kategori Barang
              DropdownButtonFormField<String>(
                initialValue: _selectedKategori,
                decoration: const InputDecoration(
                  labelText: 'Kategori Barang *',
                  prefixIcon: Icon(Icons.category_outlined),
                  border: OutlineInputBorder(),
                ),
                items: _pilihanKategori.map((kategori) {
                  return DropdownMenuItem(
                    value: kategori,
                    child: Text(kategori),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedKategori = value);
                  }
                },
              ),
              const SizedBox(height: 14),

              // Input Lokasi Kehilangan / Penemuan
              TextFormField(
                controller: _lokasiController,
                decoration: InputDecoration(
                  labelText:
                      'Lokasi ${_jenisLaporan == "Hilang" ? "Kehilangan" : "Penemuan"} *',
                  hintText: 'Contoh: Ruang Lab SAQ Lt. 4 / Kantin Menara PLN',
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Lokasi wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Input Waktu & Tanggal
              TextFormField(
                controller: _waktuController,
                decoration: InputDecoration(
                  labelText:
                      'Waktu ${_jenisLaporan == "Hilang" ? "Kehilangan" : "Penemuan"} *',
                  hintText: 'Contoh: 05 Nov 2026, 13:45 WIB',
                  prefixIcon: const Icon(Icons.access_time_outlined),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Waktu kejadian wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Input Nama Pelapor
              TextFormField(
                controller: _pelaporController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pelapor *',
                  hintText: 'Contoh: Andi Saputra (Mahasiswa S1 SI)',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama pelapor wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Input Kontak Pelapor
              TextFormField(
                controller: _kontakController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Kontak / Lokasi Titip Barang *',
                  hintText: 'Contoh: 0812-xxxx-xxxx / Dititipkan di Pos Satpam',
                  prefixIcon: Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kontak pelapor wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Input URL Gambar (Opsional untuk Image.network)
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'URL Foto Barang (Opsional - Image.network)',
                  hintText: 'Kosongkan untuk menggunakan foto ilustrasi default',
                  prefixIcon: Icon(Icons.image_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),

              // Input Deskripsi Lengkap
              TextFormField(
                controller: _deskripsiController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi & Ciri Khusus Barang *',
                  hintText:
                      'Jelaskan warna, merk, stiker, atau ciri khusus barang...',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Deskripsi barang wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),

              // Tombol Batal & Simpan Laporan
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: _simpanLaporan,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0088A9),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      icon: const Icon(Icons.save_outlined),
                      label: const Text(
                        'Simpan Laporan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Syahreva Al Zikry_202432024