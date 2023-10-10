class WorkExperiences {
  int? workExperienceId;
  String? description;
  List<String>? photos;
  String? link;
  int? freelancerId;
  String? name;

  WorkExperiences(
      {this.workExperienceId,
      this.description,
      this.photos,
      this.link,
      this.freelancerId,
      this.name});

  WorkExperiences.fromJson(Map<String, dynamic> json) {
    workExperienceId = json['workExperienceId'];
    description = json['description'];
    photos = json['photos'].cast<String>();
    link = json['link'];
    freelancerId = json['freelancerId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['workExperienceId'] = workExperienceId;
    data['description'] = description;
    data['photos'] = photos;
    data['link'] = link;
    data['freelancerId'] = freelancerId;
    data['name'] = name;
    return data;
  }
}
