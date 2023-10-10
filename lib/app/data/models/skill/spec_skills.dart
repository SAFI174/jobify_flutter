class SpecSkills {
  int? id;
  int? specializationId;
  int? skillId;
  String? specializationName;
  String? skillName;

  SpecSkills({
    this.id,
    this.specializationId,
    this.skillId,
    this.specializationName,
    this.skillName,
  });

  SpecSkills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specializationId = json['specializationId'];
    skillId = json['skillId'];
    specializationName = json['specializationName'];
    skillName = json['skillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['specializationId'] = specializationId;
    data['skillId'] = skillId;
    data['specializationName'] = specializationName;
    data['skillName'] = skillName;
    return data;
  }
}