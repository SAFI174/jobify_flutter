import 'package:jobify/app/data/models/user/user.dart';

class ProjectManager extends User {
  int? highestPaid;
  int? projectCount;
  int? projectCompleted;

  ProjectManager({
    this.highestPaid,
    this.projectCount,
    this.projectCompleted,
  });

  ProjectManager.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // initialize fields specific to ProjectManager
    highestPaid = json['highestPaid'];
    projectCount = json['projectCount'];
    projectCompleted = json['projectCompleted'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    // add fields specific to ProjectManager
    data['highestPaid'] = highestPaid;
    data['projectCount'] = projectCount;
    data['projectCompleted'] = projectCompleted;
    return data;
  }
}
