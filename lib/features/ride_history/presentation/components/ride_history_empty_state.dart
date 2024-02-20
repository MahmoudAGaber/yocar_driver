import 'package:auto_route/auto_route.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:driver_flutter/core/router/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_common/core/presentation/buttons/app_primary_button.dart';
import 'package:driver_flutter/gen/assets.gen.dart';

class RideHistoryEmptyState extends StatelessWidget {
  const RideHistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.rideHistoryEmptyState.image(
          width: 300,
          height: 300,
        ),
        const SizedBox(height: 12),
        Text(
          context.translate.noRidesYet,
          style: context.titleMedium,
        ),
        const SizedBox(height: 24),
        AppPrimaryButton(
          onPressed: () {
            context.router.navigate(const HomeRoute());
          },
          child: Text(context.translate.orderARide),
        )
      ],
    );
  }
}
