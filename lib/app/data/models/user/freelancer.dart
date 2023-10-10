import 'package:jobify/app/data/models/skill/spec_skills.dart';
import 'package:jobify/app/data/models/user/user.dart';
import 'package:jobify/app/data/models/work_experience/work_experiences.dart';

class Freelancer extends User {
  List<SpecSkills>? specSkills;
  int? underReviewRequests;
  int? acceptedRequests;
  int? doneProjects;
  List<WorkExperiences>? workExperiences;

  Freelancer(
      {List<SpecSkills>? specSkills,
      int? underReviewRequests,
      int? acceptedRequests,
      int? doneProjects,
      this.workExperiences
      // other fields inherited from User
      // ...
      })
      : super(
          // initialize fields from User
          id: 0,
          currentUserId: 0,
          firstname: '',
          lastname: '',
          userName: '',
          phoneNumber: '',
          email: '',
          bio: '',
          profilePhoto: '',
          idPhoto: '',
          type: 0,
          country: '',
          language: '',
          gender: 0,
          lastSeen: '',
          jobTitleId: 0,
          roleId: 0,
          isconfirmedEmail: false,
          isConfirmedIdPhoto: false,
        ) {
    this.specSkills = specSkills;
    this.underReviewRequests = underReviewRequests;
    this.acceptedRequests = acceptedRequests;
    this.doneProjects = doneProjects;
  }

  Freelancer.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // initialize fields specific to FreeLancer
    if (json['specSkills'] != null) {
      specSkills = <SpecSkills>[];
      json['specSkills'].forEach((v) {
        specSkills!.add(SpecSkills.fromJson(v));
      });
    }
    if (json['workExperiences'] != null) {
      workExperiences = <WorkExperiences>[];
      json['workExperiences'].forEach((v) {
        workExperiences!.add(WorkExperiences.fromJson(v));
      });
    }
    underReviewRequests = json['underReviewRequests'];
    acceptedRequests = json['acceptedRequests'];
    doneProjects = json['doneProjects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    // add fields specific to FreeLancer
    if (specSkills != null) {
      data['specSkills'] = specSkills!.map((v) => v.toJson()).toList();
    }
    if (workExperiences != null) {
      data['workExperiences'] =
          workExperiences!.map((v) => v.toJson()).toList();
    }
    data['underReviewRequests'] = underReviewRequests;
    data['acceptedRequests'] = acceptedRequests;
    data['doneProjects'] = doneProjects;
    return data;
  }
}
