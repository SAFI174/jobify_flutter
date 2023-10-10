import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jobify/app/data/constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:get/get.dart';

class MultiImageViewerView extends GetView {
  const MultiImageViewerView(
      {Key? key, required this.imageUrls, required this.initIndex})
      : super(key: key);
  final List<String> imageUrls;
  final int initIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider:
                CachedNetworkImageProvider(mainUrl + imageUrls[index]),
            initialScale: PhotoViewComputedScale.contained * 1,
          );
        },
        itemCount: imageUrls.length,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
        pageController: PageController(initialPage: initIndex),
      ),
    );
  }
}
