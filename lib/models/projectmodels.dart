class ProjectModel {
  final int id;
  final String imagePath;
  final String tittle;
  final String description;
  final String status;

  ProjectModel( {
    required this.id, 
    required this.imagePath,
    required this.tittle,
    required this.description,
    required this.status
  });
}

final List<ProjectModel> projectmodel = [
  ProjectModel(
    id: 1,
    tittle: 'Project Humic',
    imagePath:  '',
    description: '''Proyek ini dibuat sebagai tugas internship''',
    status: 'Revision'
  ),
  ProjectModel(
    id: 2,
    tittle: 'Project Media Humic',
    imagePath:'',
    description: '''Proyek ini dibuat sebagai tugas internship''',
    status: 'Approved'

  ) ,
  ProjectModel(
    id: 3,
    tittle: 'Project website beasiswa Telkom University',
    imagePath:'',
    description: '''Proyek ini dibuat sebagai tugas internship''',
    status: 'Approved'
  ),
  ProjectModel(
    id: 4,
    tittle: 'Project website kewirausahaan',
    imagePath:'',
    description: '''Proyek ini dibuat sebagai tugas internship''',
    status: 'On Review'
  ),
  ProjectModel(
    id: 4,
    tittle: 'Project website approval',
    imagePath:'',
    description: '''Proyek ini dibuat sebagai tugas internship''',
    status: 'Rejected'
  ) 
];
