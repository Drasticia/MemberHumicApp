class UserProfile {
  final bool success;
  final Data data;

  UserProfile({required this.success, required this.data});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class Data {
  final int id;
  final String name;
  final String NIP;
  final String faculty;
  final String department;
  final String handphone;
  final String birthday;
  final int gender;
  final String religion;
  final String address;
  final String profilePicture;
  final List<EduBackground> eduBackground;
  final int status;

  Data({
    required this.id,
    required this.name,
    required this.NIP,
    required this.faculty,
    required this.department,
    required this.handphone,
    required this.birthday,
    required this.gender,
    required this.religion,
    required this.address,
    required this.profilePicture,
    required this.eduBackground,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['eduBackground'] as List? ?? [];
    List<EduBackground> eduList = list.map((item) => EduBackground.fromJson(item as Map<String, dynamic>)).toList();

    return Data(
      id: json['id'],
      name: json['name'] ?? '',
      NIP: json['NIP'].toString(),
      faculty: json['faculty'] ?? '',
      department: json['department'] ?? '',
      handphone: json['handphone'].toString(),
      birthday: json['birthday'].toString(),
      gender: json['gender'] ?? 0,
      religion: json['religion'] ?? '',
      address: json['address'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      eduBackground: eduList,
      status: json['status'] ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'NIP': NIP,
      'faculty': faculty,
      'department': department,
      'handphone': handphone,
      'birthday': birthday,
      'gender': gender,
      'religion': religion,
      'address': address,
      'profile_picture': profilePicture,
      'eduBackground': eduBackground.map((e) => e.toJson()).toList(),
      'status' : status
    };
  }
}

class EduBackground {
  final String level;
  final String major;
  final String institution;

  EduBackground({
    required this.level,
    required this.major,
    required this.institution,
  });

  factory EduBackground.fromJson(Map<String, dynamic> json) {
    return EduBackground(
      level: json['level'],
      major: json['major'],
      institution: json['institution'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'major': major,
      'institution': institution,
    };
  }
}
