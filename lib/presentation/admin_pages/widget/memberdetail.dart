import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:member_humic/data/models/request/user_request_model.dart'; // Pastikan path ini benar

class MemberDetailDialog extends StatelessWidget {
  final Member member;

  const MemberDetailDialog({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16.0),
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
                        _buildMemberInfoRow(
                          'NIP',
                          member.nip == 0 ? '' : member.nip.toString(),
                        ),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Fakultas', member.faculty),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Program Studi', member.department),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow(
                          'Nomor HP',
                          member.handphone == 0 ? '' : member.handphone.toString(),
                        ),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow(
                          'Jenis Kelamin',
                          member.gender == 1 ? 'Laki-laki' : 'Perempuan',
                        ),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Agama', member.religion),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow('Alamat Asal', member.address),
                        const SizedBox(height: 12),
                        _buildMemberInfoRow(
                          'Tanggal Lahir',
                          member.birthday != null
                              ? DateFormat('dd MMMM yyyy').format(member.birthday)
                              : '',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    children: [
                      Container(
                        width: 110,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors
                              .grey[200],
                          image: member.profilePicture.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(member.profilePicture),
                                  fit: BoxFit.cover,
                                )
                              : null, 
                        ),
                        child: member.profilePicture.isEmpty
                            ? Center(
                                child: Icon(
                                  Icons.person,
                                  size: 50, 
                                  color: Colors
                                      .grey[600],
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: member.status == 1
                              ? const Color(0xffEBF9F1)
                              : const Color(0xffffcfcf),
                          border: Border.all(color: const Color(0xffEBF9F1)),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 16),
                          child: Text(
                            member.status == 1 ? 'Aktif' : 'Tidak Aktif',
                            style: TextStyle(
                              color: member.status == 1
                                  ? const Color(0xff1F9254)
                                  : const Color(0xff930000),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
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
              Text(
                "1. S1 - Informatika\n   Telkom University\n2. S2 - Informatika\n   Institut Teknologi Bandung",
                style: const TextStyle(
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
