// ignore_for_file: use_build_context_synchronously

import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/datasources/location_datasource.dart';
import 'package:driver_flutter/core/enums/driver_status.dart';
import 'package:driver_flutter/core/enums/location_permission.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:flutter_common/core/presentation/snackbar/snackbar.dart';
import 'package:ionicons/ionicons.dart';

import '../blocs/home.dart';
import '../dialogs/location_permission_denied_forever_dialog.dart';
import '../dialogs/location_permission_request_dialog.dart';

class TopNavBar extends StatelessWidget {
  final Function()? onMenuButtonPressed;
  final bool? isOnline;
  final BorderRadiusGeometry borderRadius;

  const TopNavBar({
    super.key,
    this.onMenuButtonPressed,
    required this.isOnline,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(12),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorPalette.neutralVariant99,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff64748B).withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (onMenuButtonPressed != null)
            Align(
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                onPressed: onMenuButtonPressed,
                minSize: 0,
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Ionicons.menu,
                  color: ColorPalette.neutral50,
                ),
              ),
            ),
          Positioned.fill(
            child: Center(
              child: Text(
                isOnline == null
                    ? ""
                    : isOnline!
                        ? context.translate.online
                        : context.translate.offline,
                style: context.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoSwitch(
              value: isOnline ?? true,
              onChanged: isOnline == null
                  ? null
                  : (value) async {
                      final homeBloc = locator<HomeBloc>();

                      if (value == true) {
                        final locationDatsource = locator<LocationDatasource>();
                        final locationPermissionGranted = await locationDatsource.getLocationPermissionStatus();
                        switch (locationPermissionGranted) {
                          case LocationPermission.always:
                            homeBloc.onStatusChanged(const DriverStatus.online());
                            break;
                          case LocationPermission.denied:
                            final permissionResult = await showDialog(
                              context: context,
                              useSafeArea: false,
                              builder: (context) => const LocationPermissionRequestDialog(),
                            );
                            if (permissionResult == true) {
                              homeBloc.onStatusChanged(const DriverStatus.online());
                            }
                            break;
                          case LocationPermission.deniedForever:
                            showDialog(
                              context: context,
                              useSafeArea: false,
                              builder: (context) => const LocationPermissionDeniedForeverDialog(),
                            );
                            break;
                          case LocationPermission.whileInUse:
                            context.showSnackBar(
                              message:
                                  "Background location updates are not allowed, Please allow this permission in your phone settings for optimal experience.",
                            );
                            homeBloc.onStatusChanged(const DriverStatus.online());

                            break;
                        }
                        final locationServiceEnabled = await locationDatsource.isLocationServiceEnabled();
                        if (!locationServiceEnabled) {
                          final serviceEnabled = await locationDatsource.requestLocationService();
                          if (serviceEnabled) {
                            homeBloc.onStatusChanged(const DriverStatus.online());
                          }
                        }

                        return;
                      } else {
                        homeBloc.onStatusChanged(
                          const DriverStatus.offline(),
                        );
                      }
                    },
              activeColor: ColorPalette.semanticgreen60,
            ),
          ),
        ],
      ),
    );
  }
}
