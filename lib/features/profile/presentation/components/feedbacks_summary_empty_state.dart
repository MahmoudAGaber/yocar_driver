import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FeedbacksSummaryEmptyState extends StatelessWidget {
  const FeedbacksSummaryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.translate.feedbacksSummaryEmptyStateTitle,
          style: context.titleMedium,
        ),
      ],
    );
  }
}
