import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter_common/core/presentation/buttons/app_back_button.dart';
import 'package:flutter_common/core/presentation/buttons/app_primary_button.dart';
import 'package:flutter_common/core/presentation/responsive_dialog/app_responsive_dialog.dart';

import '../blocs/report_issue.dart';
import 'report_issue_success_dialog.dart';

class ReportIssueFormDialog extends StatefulWidget {
  final String orderId;

  const ReportIssueFormDialog({super.key, required this.orderId});

  @override
  State<ReportIssueFormDialog> createState() => _ReportIssueFormDialogState();
}

class _ReportIssueFormDialogState extends State<ReportIssueFormDialog> {
  String subject = "";
  String issueContent = "";
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<ReportIssueCubit>(),
      child: AppResponsiveDialog(
        type: context.responsive(
          DialogType.fullScreen,
          xl: DialogType.dialog,
        ),
        primaryButton: AppPrimaryButton(
          onPressed: () {
            Navigator.of(context).pop();

            locator<ReportIssueCubit>().reportIssue(
              orderId: widget.orderId,
              subject: subject,
              issue: issueContent,
            );
          },
          color: PrimaryButtonColor.error,
          child: Text(context.translate.reportThisIssue),
        ),
        child: BlocListener<ReportIssueCubit, ReportIssueState>(
          listener: (context, state) {
            state.mapOrNull(
              error: (value) {
                setState(() {
                  errorText = value.errorMessage;
                });
              },
              success: (value) {
                context.router.pop();
                showDialog(
                  context: context,
                  useSafeArea: false,
                  builder: (context) => const ReportIssueSuccessDialog(),
                );
              },
            );
          },
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBackButton(onPressed: () {
                  context.router.pop();
                }),
                const SizedBox(height: 16),
                Text(
                  context.translate.reportAnIssue,
                  style: context.headlineSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? context.translate.fieldIsRequired : null,
                  decoration: InputDecoration(
                    errorText: errorText,
                    hintText: context.translate.issueSubjectPlaceholder,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  minLines: 3,
                  maxLines: 6,
                  validator: (value) => value?.isEmpty == true ? context.translate.fieldIsRequired : null,
                  decoration: InputDecoration(
                    hintText: context.translate.issueContentPlaceholder,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
