import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:member_humic/models/lmember.dart';

class Memberhistorypage extends StatefulWidget {
  const Memberhistorypage({super.key});

  @override
  State<Memberhistorypage> createState() => _MemberhistorypageState();
}

class _MemberhistorypageState extends State<Memberhistorypage> {
  int _selectedEntries = 10;
  final List<int> _entriesOptions = [5, 10, 20, 50, 100];
  String searchQuery = "";

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
            'Member History',
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
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xffB9B9B9).withOpacity(0.5),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Show',
                          style: TextStyle(
                            color: Color(0xffE91407), 
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(width: 5),
                        DropdownButton<int>(
                          value: _selectedEntries,
                          items: _entriesOptions.map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedEntries = newValue!;
                            });
                          },
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'entries',
                          style: TextStyle(
                            color: Color(0xffE91407), 
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: const TextStyle(
                              fontSize: 10,
                              color: Color(0xffB9B9B9)
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 16,
                              color: Color(0xffB9B9B9),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xffB9B9B9),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xffB9B9B9),
                                width: 2.0,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {

                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.download,
                            size: 16,
                            color: Color(0xff4D4D4D),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Download',
                            style: TextStyle(
                              color: Color(0xff4D4D4D),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(60.0),
                    1: FixedColumnWidth(80.0),
                    2: FixedColumnWidth(80.0),
                    3: FixedColumnWidth(80.0),
                    4: FixedColumnWidth(80.0),
                  },
                  border: TableBorder.all(
                    color: Colors.grey,
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: const Color(0xff000000).withOpacity(0.06),
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'No',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'NAME',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'USERNAME',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'EMAIL',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'DATE & TIME',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ...timMember.asMap().entries.map((entry) {
                      int index = entry.key + 1;
                      var member = entry.value;
                      String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(member.time);
                      return TableRow(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(index.toString(),
                                    textAlign: TextAlign.center)),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(member.name,
                                    textAlign: TextAlign.start)),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(member.name,
                                    textAlign: TextAlign.start)),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(member.email,
                                    textAlign: TextAlign.start)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(formattedDateTime, textAlign: TextAlign.start),
                            ),
                          ],
                        );
                      } 
                    ) 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}