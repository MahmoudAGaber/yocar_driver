import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:driver_flutter/features/home/presentation/blocs/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:flutter_common/core/presentation/card_handle.dart';
import 'package:flutter_common/core/theme/animation_duration.dart';
import 'package:ionicons/ionicons.dart';

import '../../components/notice_bar_content.dart';

class OnlineOfflineSheet extends StatelessWidget {
  final HomeState state;

  const OnlineOfflineSheet({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: ColorPalette.neutralVariant99,
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: Column(
              children: [
                CardHandle(),
                AnimatedSwitcher(
                  duration: AnimationDuration.pageStateTransitionMobile,
                  child: state.maybeMap(
                    orElse: () => const SizedBox(),
                    online: (online) => const NoticeBarContent(
                      icon: Ionicons.search,
                      text: "Searching for a ride",
                    ),
                    offline: (offline) => const NoticeBarContent(
                      icon: Ionicons.car,
                      text: "Get online to start receiving requests",
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorPalette.neutral90),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Ionicons.wallet,
                        color: ColorPalette.primary30,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        context.translate.yourBalance,
                        style: context.labelLarge,
                      ),
                    ),
                    Text(
                      state.maybeMap(
                        orElse: () => "",
                        offline: (offline) => offline.wallet.formatCurrency(offline.currency),
                        online: (online) => online.wallet.formatCurrency(online.currency),
                      ),
                      style: context.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
