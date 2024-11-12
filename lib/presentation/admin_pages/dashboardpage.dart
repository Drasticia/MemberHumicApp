import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/datasources/user_remote_datasource.dart';
import 'package:member_humic/data/models/request/user_request_model.dart';
import 'package:member_humic/presentation/admin_pages/bloc/member/member_bloc.dart';
import 'package:member_humic/presentation/admin_pages/widget/memberdetail.dart';

class DashboardpageAdmin extends StatefulWidget {
  const DashboardpageAdmin({super.key});

  @override
  State<DashboardpageAdmin> createState() => _DashboardpageAdminState();
}

class _DashboardpageAdminState extends State<DashboardpageAdmin> {
  int _selectedEntries = 10;
  int currentPage = 1;
  String searchQuery = "";
  String selectedProdi = 'All';
  String selectedFaculty = 'All';
  String selectedBranch = 'All';
  final List<int> _entriesOptions = [5, 10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _fetchMembers();
  }

  void _fetchMembers() {
    context.read<MemberBloc>().add(
          MemberEvent.fetch(
            page: currentPage,
            entriesPerPage: _selectedEntries,
            searchQuery: searchQuery,
            selectedProdi: selectedProdi == 'All' ? null : selectedProdi,
            selectedFaculty: selectedFaculty == 'All' ? null : selectedFaculty,
            selectedBranch: selectedBranch == 'All' ? null : selectedBranch,
          ),
        );
  }

  void _goToNextPage() {
    setState(() {
      currentPage++;
    });
    _fetchMembers();
  }

  void _goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
      });
      _fetchMembers();
    }
  }
  void _deleteMember(int memberId) {
    context.read<MemberBloc>().add(MemberEvent.delete(memberId));
  }

  void _confirmDelete(BuildContext context, int memberId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this member?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
              _deleteMember(memberId); // Panggil fungsi delete
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
                          fontWeight: FontWeight.bold),
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
                        _fetchMembers();
                      },
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'entries',
                      style: TextStyle(
                          color: Color(0xffE91407),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    // Search Field
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                            _fetchMembers();
                          },
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: const TextStyle(
                                fontSize: 10, color: Color(0xffB9B9B9)),
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8.0),
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
                          value: selectedProdi,
                          items: ['All', 'Informatics', 'Biology', 'Literature']
                              .map((department) {
                            return DropdownMenuItem(
                              value: department,
                              child: Text(department),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedProdi = value!;
                            });
                            _fetchMembers();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 64),
                    Row(
                      children: [
                        const Text('Fakulty:'),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: selectedFaculty,
                          items: ['All', 'Informatics', 'Teknik', 'Law']
                              .map((faculty) {
                            return DropdownMenuItem(
                              value: faculty,
                              child: Text(faculty),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedFaculty = value!;
                            });
                            _fetchMembers();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 64),
                    Row(
                      children: [
                        const Text('Cabang:'),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: selectedBranch,
                          items: ['All', 'Bandung', 'Surabaya', 'Jakarta']
                              .map((branch) {
                            return DropdownMenuItem(
                              value: branch,
                              child: Text(branch),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBranch = value!;
                            });
                            _fetchMembers();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              BlocBuilder<MemberBloc, MemberState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Center(child: Text('Welcome to Dashboard')),
                    loading: () => Center(child: CircularProgressIndicator()),
                    success: (members) => buildMemberTable(members),
                    error: (message) => Center(child: Text(message)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildMemberTable(List<Member> members) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(100.0),
                  1: FixedColumnWidth(250.0),
                  2: FixedColumnWidth(120.0),
                  3: FixedColumnWidth(250.0),
                  4: FixedColumnWidth(110.0),
                  5: FixedColumnWidth(100.0),
                  6: FixedColumnWidth(100.0),
                  7: FixedColumnWidth(100.0),
                  8: FixedColumnWidth(100.0),
                  9: FixedColumnWidth(100.0),
                },
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: const Color(0xff000000).withOpacity(0.06),
                    ),
                    children: const [
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('NIP',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('NAMA',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('KODE DOSEN',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('EMAIL',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('STATUS',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('PRODI',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('FAKULTAS',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('CABANG',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('DETAIL',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Delete',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                  ...members.map((member) => TableRow(
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
                              child: Text(member.code,
                                  textAlign: TextAlign.center)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(member.email,
                                  textAlign: TextAlign.center)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: member.status == 1 ? const Color(0xffEBF9F1) : const Color(0xffffcfcf),
                                  borderRadius: BorderRadius.circular(22)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  member.status == 1 ? 'Aktif' : 'Tidak Aktif',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: member.status == 1 ? const Color(0xff1F9254) : const Color(0xff930000),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(member.department,
                                  textAlign: TextAlign.center)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(member.faculty,
                                  textAlign: TextAlign.center)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(member.branch,
                                  textAlign: TextAlign.center)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => MemberDetailDialog(member: member),
                                );
                              },
                              child: const Text('Detail',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                _confirmDelete(context, member.id);
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            buildPaginationControls(members.length),
          ],
        ),
      ),
    );
  }

  Widget buildPaginationControls(int memberCount) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous button
          IconButton(
            onPressed: currentPage > 1 ? _goToPreviousPage : null,
            icon: const Icon(Icons.chevron_left),
            color: currentPage > 1 ? const Color(0xff0d6efd) : Colors.grey,
          ),

          // Page indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xff0d6efd),
                ),
                child: Center(
                  child: Text(
                    '$currentPage',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: memberCount == _selectedEntries ? _goToNextPage : null,
            icon: const Icon(Icons.chevron_right),
            color: memberCount == _selectedEntries ? const Color(0xff0d6efd) : Colors.grey,
          ),
        ],
      );
  }
}
