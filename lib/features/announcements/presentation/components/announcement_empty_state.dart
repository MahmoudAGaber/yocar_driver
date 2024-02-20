import 'package:flutter/material.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:driver_flutter/gen/assets.gen.dart';

class AnnouncementEmptyState extends StatelessWidget {
  const AnnouncementEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.announcementEmpty.image(width: 300, height: 300),
          const SizedBox(height: 16),
          Text(
            context.translate.noAnnouncements,
            style: context.titleMedium,
          ),
        ],
      ),
    );
  }
}
