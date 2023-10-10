import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:jobify/app/data/constants.dart';
import 'package:jobify/app/data/models/user/freelancer.dart';
import 'package:jobify/app/data/models/work_experience/work_experiences.dart';
import 'package:jobify/app/views/views/multi_image_viewer_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkExperiencesList extends StatefulWidget {
  const WorkExperiencesList({
    Key? key,
    required this.freelancer,
    required this.theme,
  }) : super(key: key);

  final Freelancer freelancer;
  final ThemeData theme;

  @override
  _WorkExperiencesListState createState() => _WorkExperiencesListState();
}

class _WorkExperiencesListState extends State<WorkExperiencesList> {
  bool showAllExperiences = false;

  // Function to show a detailed dialog for work experiences
  Future<void> showExperienceDetailDialog(
      WorkExperiences? workExperiences) async {
    await Get.dialog(
      AlertDialog(
        scrollable: true,
        actionsPadding: const EdgeInsets.all(10),
        elevation: 0,
        title: Text(workExperiences!.name!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageSlideshow(
              width: 90.w,
              height: 200,
              initialPage: 0,
              children: [
                for (var image in workExperiences.photos!) ...[
                  GestureDetector(
                    onTap: () => Get.to(
                        () => MultiImageViewerView(
                              imageUrls: workExperiences.photos!,
                              initIndex: workExperiences.photos!.indexOf(image),
                            ),
                        fullscreenDialog: true),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: mainUrl + image,
                      ),
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: RichText(
                text: TextSpan(
                  text: workExperiences.description,
                  style:
                      TextStyle(color: widget.theme.colorScheme.onBackground),
                  children: [
                    TextSpan(
                      text: '\nUse this link for more details',
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(workExperiences.link!));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final experiences = widget.freelancer.workExperiences;
    final initialItemCount = showAllExperiences ? experiences?.length : 2;

    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Work Experiences',
                style: widget.theme.textTheme.titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              experiences!.length > 2
                  ? TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(5)),
                      onPressed: () {
                        setState(() {
                          showAllExperiences = !showAllExperiences;
                        });
                      },
                      child:
                          Text(showAllExperiences ? 'Show Less' : 'Show More'),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: initialItemCount,
          itemBuilder: (context, index) {
            var experience = experiences?[index];
            return ListTile(
              splashColor: Colors.transparent,
              onTap: () => showExperienceDetailDialog(experience),
              trailing: IconButton(
                tooltip: 'More Info',
                onPressed: () => showExperienceDetailDialog(experience),
                icon: const Icon(
                  FluentIcons.info_12_regular,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              subtitle: Text(
                experience?.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: widget.theme.textTheme.labelMedium!
                    .copyWith(color: Colors.grey.shade800),
              ),
              title: Text(experience?.name ?? ''),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                  imageUrl: "$mainUrl${experience?.photos?[0]}",
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
