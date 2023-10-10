class User {
  int? id;
  int? currentUserId;
  String? firstname;
  String? lastname;
  String? userName;
  String? phoneNumber;
  String? email;
  String? bio;
  String? profilePhoto;
  String? idPhoto;
  int? type;
  String? country;
  String? language;
  int? gender;
  String? lastSeen;
  int? jobTitleId;
  int? roleId;
  bool? isconfirmedEmail;
  bool? isConfirmedIdPhoto;

  User({
    this.id,
    this.currentUserId,
    this.firstname,
    this.lastname,
    this.userName,
    this.phoneNumber,
    this.email,
    this.bio,
    this.profilePhoto,
    this.idPhoto,
    this.type,
    this.country,
    this.language,
    this.gender,
    this.lastSeen,
    this.jobTitleId,
    this.roleId,
    this.isconfirmedEmail,
    this.isConfirmedIdPhoto,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currentUserId = json['currentUserId'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    bio = json['bio'];
    profilePhoto = "${json['profilePhoto']}";
    idPhoto = json['idPhoto'];
    type = json['type'];
    country = json['country'];
    language = json['language'];
    gender = json['gender'];
    lastSeen = json['lastSeen'];
    jobTitleId = json['jobTitleId'];
    roleId = json['roleId'];
    isconfirmedEmail = json['isconfirmedEmail'];
    isConfirmedIdPhoto = json['isConfirmedIdPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currentUserId'] = currentUserId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['bio'] = bio;
    data['profilePhoto'] = profilePhoto;
    data['idPhoto'] = idPhoto;
    data['type'] = type;
    data['country'] = country;
    data['language'] = language;
    data['gender'] = gender;
    data['lastSeen'] = lastSeen;
    data['jobTitleId'] = jobTitleId;
    data['roleId'] = roleId;
    data['isconfirmedEmail'] = isconfirmedEmail;
    data['isConfirmedIdPhoto'] = isConfirmedIdPhoto;
    return data;
  }
}
