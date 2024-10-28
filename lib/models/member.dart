class TeamMember {
  final int id;
  final String imagePath;
  final String name;
  final String position;
  final String email;
  final String nip;
  final String fakultas;
  final String prodi;


  TeamMember({
    required this.id, 
    required this.imagePath,
    required this.name,
    required this.position,
    required this.email,
    required this.nip,
    required this.fakultas,
    required this.prodi,
  });
}

final List<TeamMember> teamMembers = [
  TeamMember(
    id: 1,
    imagePath: 'https://humic.telkomuniversity.ac.id/wp-content/uploads/2020/06/profile_satria.jpg',
    name: 'Satria Mandala, S.T., M.Sc., Ph.D.',
    position: 'Director of Research', 
    nip: '111111',
    email: 'satriamandala@telkomuniversity.ac.id',
    prodi: 'informatika',
    fakultas: 'informatika'
  ),
  TeamMember(
    id: 2,
    imagePath: 'https://humic.telkomuniversity.ac.id/wp-content/uploads/2020/06/Putu-Harry-Gunawan.jpeg',
    name: 'Dr. Putu Harry Gunawan, S.Si., M.Si., M.Sc.',
    position: 'Vice Director of Research Center',
    nip: '111111',
    email: 'PutuHarryGunawana@telkomuniversity.ac.id',
    prodi: 'informatika',
    fakultas: 'informatika'
  ),
];
