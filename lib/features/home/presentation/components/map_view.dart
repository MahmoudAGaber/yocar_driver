import 'package:driver_flutter/core/blocs/location.dart';
import 'package:driver_flutter/core/blocs/settings.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/config/constants.dart';
import 'package:flutter_common/core/entities/place.dart';
import 'package:generic_map/generic_map.dart';

import '../blocs/home.dart';

class HomeMapView extends StatefulWidget {
  const HomeMapView({super.key});

  @override
  State<HomeMapView> createState() => _HomeMapViewState();
}

class _HomeMapViewState extends State<HomeMapView> {
  MapViewController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.markers.length > 1) {
          final distance = state.markers[0].position.distanceTo(state.markers[1].position);
          if (distance > 0.0) {
            controller?.fitBounds(
              state.markers.map((e) => e.position).toList(),
            );
          } else {
            controller?.moveCamera(state.markers.first.position, null);
          }
        } else if (state.markers.length == 1) {
          controller?.moveCamera(state.markers.first.position, null);
        }
      },
      builder: (context, state) {
        return BlocListener<LocationBloc, LocationState>(
          listener: (context, locationState) {
            locationState.mapOrNull(determined: (determined) {
              state.mapOrNull(
                online: (value) {
                  controller?.moveCamera(
                    determined.location.genericMarker().position,
                    null,
                  );
                },
              );
            });
          },
          child: BlocBuilder<SettingsCubit, SettingsState>(
            buildWhen: (previous, current) => previous.mapProvider != current.mapProvider,
            builder: (context, settingsState) {
              return GenericMap(
                padding: settingsState.mapProvider == MapProviderEnum.googleMaps
                    ? const EdgeInsets.only(
                        bottom: 32,
                        left: 16,
                        right: 16,
                        top: 100,
                      )
                    : EdgeInsets.only(
                        bottom: context.responsive(400, xl: 140),
                        left: 140,
                        right: 140,
                        top: 140,
                      ),
                onControllerReady: (p0) => controller = p0,
                circleMarkers: state.circleMarkers,
                polylines: state.polylines,
                interactive: true,
                mode: MapViewMode.static,
                initialLocation: Constants.defaultLocation.toGenericMapPlace,
                provider: settingsState.provider,
                markers: state.markers,
              );
            },
          ),
        );
      },
    );
  }
}
