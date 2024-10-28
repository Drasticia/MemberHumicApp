import 'package:flutter/material.dart';
import 'package:member_humic/models/member.dart';

class MemberDetailPage extends StatelessWidget {
  final TeamMember member;

  const MemberDetailPage({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/logo.png', 
              height: 40,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                member.imagePath,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              member.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              member.position,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              member.email,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'NIP :',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  member.nip,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text(
                  'Fakultas :',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  member.fakultas,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text(
                  'Prodi :',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  member.prodi,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
