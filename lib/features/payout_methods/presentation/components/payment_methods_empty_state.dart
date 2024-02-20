import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:driver_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/core/presentation/buttons/app_primary_button.dart';

import '../blocs/payout_accounts.dart';
import '../dialogs/select_payout_method_dialog.dart';

class PaymentMethodsEmptyState extends StatelessWidget {
  const PaymentMethodsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.images.rideHistoryEmptyState.image(
          width: 300,
          height: 300,
        ),
        const SizedBox(height: 12),
        Text(
          context.translate.noPayoutMethods,
          style: context.titleMedium,
        ),
        const SizedBox(height: 12),
        AppPrimaryButton(
          onPressed: () async {
            await showDialog(
              context: context,
              useSafeArea: false,
              builder: (context) => const SelectPayoutMethodDialog(),
            );
            locator<PayoutAccountsBloc>().load();
          },
          child: Text(context.translate.addPayoutMethod),
        )
      ],
    );
  }
}
