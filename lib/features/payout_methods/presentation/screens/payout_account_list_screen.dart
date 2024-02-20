import 'package:auto_route/auto_route.dart';
import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:driver_flutter/features/payout_methods/data/models/payout_account.prod.dart';
import 'package:driver_flutter/features/payout_methods/domain/entitites/payout_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:flutter_common/core/presentation/buttons/app_bordered_button.dart';
import 'package:flutter_common/core/presentation/responsive_dialog/app_top_bar.dart';
import 'package:ionicons/ionicons.dart';

import '../blocs/payout_accounts.dart';
import '../dialogs/select_payout_method_dialog.dart';

@RoutePage()
class PayoutAccountListScreen extends StatelessWidget {
  final List<PayoutAccountEntity> methods;

  const PayoutAccountListScreen({
    super.key,
    required this.methods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.neutralVariant99,
      padding: context.responsive(
        const EdgeInsets.all(16).copyWith(bottom: 0),
        xl: const EdgeInsets.all(16).copyWith(top: 96, bottom: 0),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppTopBar(title: context.translate.payoutMethods),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: AppBorderedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    useSafeArea: false,
                    builder: (context) => const SelectPayoutMethodDialog(),
                  );
                  locator<PayoutAccountsBloc>().load();
                },
                title: context.translate.addPayoutMethod,
                icon: Ionicons.add_circle,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return methods[index].toSavedCard(
                    onDefaultChanged: null,
                    onDeletePressed: null,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: methods.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
