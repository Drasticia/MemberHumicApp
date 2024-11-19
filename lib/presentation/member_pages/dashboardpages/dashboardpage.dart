import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/presentation/member_pages/bloc/profile/profile_bloc.dart';
import 'package:member_humic/presentation/member_pages/dashboardpages/editprofile.dart';
import 'package:member_humic/presentation/member_pages/widgets/profilerow.dart';

class DashboardpageMember extends StatefulWidget {
  const DashboardpageMember({super.key});

  @override
  State<DashboardpageMember> createState() => _DashboardpageMemberState();
}

class _DashboardpageMemberState extends State<DashboardpageMember> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.fetchProfile());
  }
    void _fetchUserProfile() {
    context.read<ProfileBloc>().add(const ProfileEvent.fetchProfile());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body:BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            updated: () {
              _fetchUserProfile();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile updated successfully!")),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
          );
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (userProfile) => _buildProfileContent(userProfile.data),
              error: (message) => _buildErrorState(message),
              updated: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xff800C05), Color(0xffE91407)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
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
          onPressed: () {},
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
    );
  }

  Widget _buildProfileContent(dynamic user) {
    return Padding(
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PROFILE",
                      style: TextStyle(
                        color: Color(0xffE91407),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ProfileRow(label: "Nama Lengkap", value: user.name),
                    const SizedBox(height: 12),
                    ProfileRow(label: "NIP", value: user.NIP.toString()),
                    const SizedBox(height: 12),
                    ProfileRow(label: "Fakultas", value: user.faculty),
                    const SizedBox(height: 12),
                    ProfileRow(label: "Program Studi", value: user.department),
                    const SizedBox(height: 12),
                    ProfileRow(
                        label: "Nomor HP", value: user.handphone.toString()),
                    const SizedBox(height: 12),
                    ProfileRow(
                      label: "Jenis Kelamin",
                      value: user.gender == 1 ? "Laki-laki" : "Perempuan",
                    ),
                    const SizedBox(height: 12),
                    ProfileRow(label: "Agama", value: user.religion),
                    const SizedBox(height: 12),
                    ProfileRow(label: "Alamat Asal", value: user.address),
                    const SizedBox(height: 12),
                    ProfileRow(
                      label: "Tanggal Lahir",
                      value: user.birthday != null
                          ? user.birthday!.toString().split(' ')[0]
                          : "Tanggal tidak tersedia",
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
                    _buildEducationHistory(user),
                    const SizedBox(height: 12),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(user: user),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              _buildProfilePicture(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationHistory(dynamic user) {
    if (user.eduBackground == null || user.eduBackground.isEmpty) {
      return const Text(
        "Tidak ada data riwayat studi.",
        style: TextStyle(fontSize: 12),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: List<Widget>.from(
        user.eduBackground.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final edu = entry.value;
          return Text(
            "$index. ${edu.level} - ${edu.major}\n   ${edu.institution}",
            style: const TextStyle(fontSize: 12),
          );
        }),
      ),
    );
  }

  Widget _buildProfilePicture(dynamic user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Column(
        children: [
          Container(
            width: 110,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: user.profilePicture != null && user.profilePicture.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: "${Variables.imageBaseUrl}${user.profilePicture}",
                    width: 110,
                    height: 140,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: user.status == 1
                  ? const Color(0xffEBF9F1)
                  : const Color(0xffffcfcf),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
              child: Text(
                user.status == 1 ? 'Aktif' : 'Tidak Aktif',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: user.status == 1
                      ? const Color(0xff1F9254)
                      : const Color(0xff930000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.red, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context
                  .read<ProfileBloc>()
                  .add(const ProfileEvent.fetchProfile());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
