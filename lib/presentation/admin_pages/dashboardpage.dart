import 'package:flutter/material.dart';
import 'package:member_humic/models/lmember.dart';
import 'package:member_humic/presentation/admin_pages/widget/memberdetail.dart';

class DashboardpageAdmin extends StatefulWidget {
  const DashboardpageAdmin({super.key});

  @override
  State<DashboardpageAdmin> createState() => _DashboardpageAdminState();
}

class _DashboardpageAdminState extends State<DashboardpageAdmin> {
  void _showMemberDetailDialog(BuildContext context, TimMember member) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.1),
      builder: (BuildContext context) {
        return MemberDetailDialog(member: member);
      },
    );
  }

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
              'Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.download,
                    size: 22,
                    color: Color(0xff4D4D4D),
                  ),
                  Text(
                    'Download',
                    style: TextStyle(
                      color: Color(0xff4D4D4D),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: SizedBox(
                          width: 200,
                          child: TextField(
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
                              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Row(
                        children: [
                          const Text('Prodi:'),
                          const SizedBox(width: 8),
                          DropdownButton<String>(
                            value: 'All',
                            items: <String>['All', 'Prodi 1', 'Prodi 2', 'Prodi 3']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                      const SizedBox(width: 64),

                      Row(
                        children: [
                          const Text('Fakultas:'),
                          const SizedBox(width: 8),
                          DropdownButton<String>(
                            value: 'All',
                            items: <String>[
                              'All',
                              'Fakultas 1',
                              'Fakultas 2',
                              'Fakultas 3'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                      const SizedBox(width: 64),

                      Row(
                        children: [
                          const Text('Cabang:'),
                          const SizedBox(width: 8),
                          DropdownButton<String>(
                            value: 'All',
                            items: <String>['All', 'Cabang 1', 'Cabang 2', 'Cabang 3']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),                      
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Table(
                          columnWidths: const {
                            0: FixedColumnWidth(80.0),
                            1: FixedColumnWidth(250.0),
                            2: FixedColumnWidth(120.0),
                            3: FixedColumnWidth(250.0),
                            4: FixedColumnWidth(100.0),
                            5: FixedColumnWidth(100.0),
                            6: FixedColumnWidth(100.0),
                            7: FixedColumnWidth(100.0),
                            8: FixedColumnWidth(100.0),
                          },
                          border: TableBorder.all(
                            color: Colors.grey,
                          ),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xff000000).withOpacity(0.06),
                              ),
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'NIP',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'NAMA',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'KODE DOSEN',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'EMAIL',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'STATUS',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'PRODI',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'FAKULTAS',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'CABANG',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'DETAIL',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            ...timMember.map((member) => TableRow(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(member.nip.toString(),
                                            textAlign: TextAlign.center)),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(member.name,
                                            textAlign: TextAlign.center)),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(member.kodeDosen,
                                            textAlign: TextAlign.center)),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(member.email,
                                            textAlign: TextAlign.center)),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xffEBF9F1),
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              member.status,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color(0xff1F9254),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(member.prodi,
                                            textAlign: TextAlign.center)),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(member.fakultas,
                                            textAlign: TextAlign.center)),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(member.cabang,
                                            textAlign: TextAlign.center)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                        onPressed: () {
                                          _showMemberDetailDialog(
                                              context, member);
                                        },
                                        child: const Text(
                                          'Detail',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
