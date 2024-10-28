import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:member_humic/presentation/member_pages/dashboardpages/editprofile.dart';
import 'package:member_humic/presentation/member_pages/widgets/profilerow.dart';

class DashboardpageMember extends StatefulWidget {
  const DashboardpageMember({super.key});

  @override
  State<DashboardpageMember> createState() => _DashboardpageMemberState();
}

class _DashboardpageMemberState extends State<DashboardpageMember> {
  final List<String> notifications = [
    "Proyek 'Smart City Development' telah diperbarui. Cek status terbaru di dashboard Anda",
    "Anda telah menerima umpan balik dari Project Approval Project website beasiswa Telkom University. Klik di sini untuk melihat",
    "Pembaruan Data: Anda telah berhasil mengubah data anda. Jika ini bukan permintaan Anda, silakan hubungi dukungan.",
    "Terima kasih telah berpartisipasi dalam survei kepuasan anggota. Hasilnya akan diumumkan dalam waktu dekat!",
    "Terima kasih telah berpartisipasi dalam survei kepuasan anggota. Hasilnya akan diumumkan dalam waktu dekat!"
  ];

  void _showNotificationPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
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
                  ...notifications.map((notification) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color(0xffF8ECEC),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffB9B9B9)
                            ),
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
                      )
                    ),
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
      },
    );
  }

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
            'Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showNotificationPopup(context);
            },
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Color(0xff171717),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color(0xff000000).withOpacity(0.1),
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PROFILE",
                  style: TextStyle(
                    color: Color(0xffE91407),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileRow(
                            label: "Nama Lengkap",
                            value: "Amila Nafila Vidyana, S.I.Kom",
                          ),
                          SizedBox(height: 12),
                          ProfileRow(label: "NIP", value: "333333"),
                          SizedBox(height: 12),
                          ProfileRow(label: "Fakultas", value: "Informatika"),
                          SizedBox(height: 12),
                          ProfileRow(
                              label: "Program Studi", value: "Informatika"),
                          SizedBox(height: 12),
                          ProfileRow(
                              label: "Nomor HP", value: "081244557898"),
                          SizedBox(height: 12),
                          ProfileRow(
                              label: "Jenis Kelamin", value: "Perempuan"),
                          SizedBox(height: 12),
                          ProfileRow(label: "Agama", value: "Muslim"),
                          SizedBox(height: 12),
                          ProfileRow(label: "Alamat Asal", value: "Bogor"),
                          SizedBox(height: 12),
                          ProfileRow(
                              label: "Tanggal Lahir", value: "1997-03-14"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Container(
                          width: 110,
                          height: 140,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://humic.telkomuniversity.ac.id/wp-content/uploads/2024/05/amilaa-1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffEBF9F1),
                            border: Border.all(
                              color: const Color(0xffEBF9F1)
                            ),
                            borderRadius: BorderRadius.circular(22)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
                            child: Text(
                              'Aktif',
                              style: TextStyle(
                                color:  Color(0xff1F9254),
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                              ),
                            ),
                          ),
                        ),    
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Riwayat Studi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "1. S1 - Informatika\n   Telkom University\n2. S2 - Informatika\n   Institut Teknologi Bandung",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Editprofile(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff006AFF),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
