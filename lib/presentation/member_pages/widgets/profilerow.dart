import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
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