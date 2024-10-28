import 'package:flutter/material.dart';

class AnnouncementpageMember extends StatefulWidget {
  const AnnouncementpageMember({super.key});

  @override
  State<AnnouncementpageMember> createState() => _AnnouncementpageMemberState();
}

class _AnnouncementpageMemberState extends State<AnnouncementpageMember> {
  final List<String> announcement = [
    "Kami dengan bangga mengumumkan bahwa HUMIC Engineering telah memenangkan penghargaan 'Inovasi Teknologi Terbaik 2024'",
    "Jangan lewatkan seminar 'Masa Depan HMI: Peluang dan Tantangan' pada tanggal 15 November 2024. Pendaftaran dibuka hingga 10 November!",
    "Perubahan Kebijakan: Mulai bulan depan, semua anggota diharapkan untuk memperbarui informasi kontak mereka setiap 6 bulan",
    "Hasil Riset: Publikasi terbaru tentang 'Analisis Kinerja IoT di Sektor Kesehatan' telah diterbitkan.",
    "Kami meluncurkan program mentoring untuk anggota baru. Daftar sekarang untuk mendapatkan bimbingan dari ahli industri",
    "Kami meluncurkan program mentoring untuk anggota baru. Daftar sekarang untuk mendapatkan bimbingan dari ahli industri"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xff800C05), Color(0xffE91407)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: const Text(
            'Announcement',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color(0xff000000).withOpacity(0.1),
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     blurRadius: 6,
            //     offset: const Offset(0, 4),
            //   ),
            // ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "Notifikasi",
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 18,
              //   ),
              // ),
              ...announcement.map((notification) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color(0xffF8ECEC),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffB9B9B9)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          notification,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color(0xffE91407),
              //     ),
              //     child: const Text("Tutup"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
