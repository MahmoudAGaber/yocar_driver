import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/features/home/presentation/components/map_view.dart';
import 'package:driver_flutter/features/home/presentation/screens/desktop_layout_delegate.dart';
import 'package:driver_flutter/features/home/presentation/screens/sheets/chat_sheet.dart';
import 'package:driver_flutter/features/home/presentation/screens/sheets/order_reqeusts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:flutter_common/core/theme/animation_duration.dart';

import '../blocs/home.dart';
import '../components/driver_search_radius_button.dart';
import '../components/top_nav_bar.dart';
import 'sheets/active_order_sheet.dart';
import 'sheets/online_offline_sheet.dart';
import 'sheets/order_summary.dart';
import 'sheets/rate_rider_sheet.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.neutralVariant99,
      child: CustomMultiChildLayout(
        delegate: DesktopLayoutDelegate(
          mapLayoutId: 'map',
          sidebarLayoutId: 'sidebar',
          navbarId: 'navbar',
          bottomSheetLayoutId: 'bottomSheet',
        ),
        children: [
          LayoutId(
            id: 'map',
            child: const HomeMapView(),
          ),
          LayoutId(
            id: 'navbar',
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return SafeArea(
                  bottom: false,
                  child: TopNavBar(
                    isOnline: state.maybeMap(
                      orElse: () => null,
                      offline: (_) => false,
                      online: (_) => true,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                );
              },
            ),
          ),
          LayoutId(
            id: 'sidebar',
            child: SafeArea(
              bottom: false,
              child: Container(
                margin: const EdgeInsets.only(top: 138),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: AnimationDuration.pageStateTransitionMobile,
                      child: state.map(
                        accessDenied: (value) => const Text('access denied'),
                        initial: (_) => const SizedBox(),
                        loading: (_) => const SizedBox(),
                        online: (online) {
                          if (online.orderRequests.isEmpty) {
                            return const SizedBox();
                          } else {
                            return OrderRequestsList(
                              requests: online.orderRequests,
                            );
                          }
                        },
                        offline: (offline) => const SizedBox(),
                        onTrip: (onTrip) => onTrip.page.map(
                          overview: (overview) => ActiveOrderSheet(state: onTrip),
                          chat: (chat) => ChatSheet(order: onTrip.order),
                          payment: (payment) => OrderSummary(order: onTrip.order),
                          rate: (rate) => RateRiderSheet(order: onTrip.order),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          LayoutId(
            id: 'bottomSheet',
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: AnimationDuration.pageStateTransitionMobile,
                  child: state.map(
                    accessDenied: (value) => const Text('access denied'),
                    initial: (_) => const SizedBox(),
                    loading: (_) => const SizedBox(),
                    online: (online) {
                      if (online.orderRequests.isEmpty) {
                        return OnlineOfflineSheet(state: state);
                      } else {
                        return const SizedBox();
                      }
                    },
                    offline: (offline) => OnlineOfflineSheet(state: state),
                    onTrip: (onTrip) => const SizedBox(),
                  ),
                );
              },
            ),
          ),
          LayoutId(
            id: 'search_radius',
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox(),
                  online: (online) {
                    return DriverSearchRadiusButton(
                      radius: online.radiusFilter,
                      onRadiusChanged: (radius) {
                        locator<HomeBloc>().onRadiusChanged(radius);
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
