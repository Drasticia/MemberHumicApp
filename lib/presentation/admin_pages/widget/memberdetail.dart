import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:member_humic/models/lmember.dart';

class MemberDetailDialog extends StatelessWidget {
  final TimMember member;

  const MemberDetailDialog({Key? key, required this.member}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          Colors.transparent, 
      insetPadding: const EdgeInsets.all(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 10, sigmaY: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'DETAIL',
                style: TextStyle(
                  color: Color(0xffE91407),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildMemberInfoRow('Nama', member.name),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('NIP', member.nip.toString()),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Fakultas', member.fakultas),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Prodi', member.prodi),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Nomor HP', member.number.toString()),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Jenis Kelamin', member.gender),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Agama', member.agama),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Tanggal Lahir', member.lahir),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
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
              const SizedBox(height: 12),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(
                    'Tutup',
                    style: TextStyle(
                      color: Color(0xffE91407),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberInfoRow(String label, String value) {
    return Table(
      border: TableBorder.all(color: Colors.transparent, width: 1),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Text(
                '$label: ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
            TableCell(
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}