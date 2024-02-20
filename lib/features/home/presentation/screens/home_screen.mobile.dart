// ignore_for_file: use_build_context_synchronously

import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/blocs/location.dart';
import 'package:driver_flutter/core/presentation/app_drawer.dart';
import 'package:driver_flutter/features/home/presentation/blocs/home.dart';
import 'package:driver_flutter/features/home/presentation/components/map_view.dart';
import 'package:driver_flutter/features/home/presentation/components/top_nav_bar.dart';
import 'package:driver_flutter/features/home/presentation/screens/mobile_layout_delegate.dart';
import 'package:driver_flutter/features/home/presentation/screens/sheets/active_order_sheet.dart';
import 'package:driver_flutter/features/home/presentation/screens/sheets/chat_sheet.dart';
import 'package:driver_flutter/features/home/presentation/screens/sheets/online_offline_sheet.dart';
import 'package:driver_flutter/features/home/presentation/screens/sheets/order_summary.dart';
import 'package:driver_flutter/features/home/presentation/screens/sheets/rate_rider_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/core/theme/animation_duration.dart';
import 'package:generic_map/generic_map.dart';
import 'package:flutter_common/core/presentation/my_location_button.dart';

import '../components/driver_search_radius_button.dart';
import 'sheets/order_requests_pageview.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  MapViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      extendBody: true,
      body: CustomMultiChildLayout(
        delegate: MobileLayoutDelegate(),
        children: [
          LayoutId(
            id: MobileLayoutDelegate.mapLayoutId,
            child: const HomeMapView(),
          ),
          LayoutId(
            id: MobileLayoutDelegate.navbarId,
            child: SafeArea(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return TopNavBar(
                    onMenuButtonPressed: () => scaffoldKey.currentState?.openDrawer(),
                    isOnline: state.maybeMap(
                      orElse: () => null,
                      offline: (_) => false,
                      online: (_) => true,
                    ),
                  );
                },
              ),
            ),
          ),
          LayoutId(
            id: MobileLayoutDelegate.cardLayoutId,
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
                        return OrderRequestsPageView(
                          requests: online.orderRequests,
                        );
                      }
                    },
                    offline: (offline) => OnlineOfflineSheet(state: state),
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
          LayoutId(
            id: MobileLayoutDelegate.searchRadiusButtonId,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => state.maybeMap(
                orElse: () => const SizedBox(),
                online: (online) => DriverSearchRadiusButton(
                  radius: online.radiusFilter,
                  onRadiusChanged: locator<HomeBloc>().onRadiusChanged,
                ),
              ),
            ),
          ),
          LayoutId(
            id: MobileLayoutDelegate.myLocationButtonId,
            child: MyLocationButton(
              onPressed: () {
                locator<LocationBloc>().fetchCurrentLocation();
                final location = locator<LocationBloc>().state.maybeMap(
                      orElse: () => null,
                      determined: (determined) => determined.location,
                    );
                if (location != null) {
                  locator<HomeBloc>().onLocationUpdated(location);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
