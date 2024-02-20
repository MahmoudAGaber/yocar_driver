part of 'home.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading({
    String? error,
  }) = _Loading;

  const factory HomeState.online({
    required int? radiusFilter,
    required double wallet,
    required String currency,
    required List<OrderRequestEntity> orderRequests,
    OrderRequestEntity? currentOrderRequest,
    DriverLocation? driverLocation,
    String? error,
  }) = OnlineState;

  const factory HomeState.offline({
    required double wallet,
    required String currency,
    String? error,
    DriverLocation? driverLocation,
  }) = OfflineState;

  const factory HomeState.onTrip({
    required OrderEntity order,
    required OnTripPage page,
    DriverLocation? driverLocation,
    Failure? error,
  }) = OnTripState;

  const factory HomeState.accessDenied() = _AccessDenied;

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);

  const HomeState._();

  List<LatLngEntity> get _directions {
    return maybeMap(
      orElse: () => [],
      onTrip: (ride) {
        switch (ride.order.status) {
          case OrderStatus.driverAccepted:
            return ride.order.driverDirections;
          case OrderStatus.arrived:
            return [];

          case OrderStatus.waitingForPrePay:
          case OrderStatus.waitingForPostPay:
          case OrderStatus.found:
          case OrderStatus.requested:
          case OrderStatus.noCloseFound:
          case OrderStatus.notFound:
          case OrderStatus.waitingForReview:
          case OrderStatus.booked:
          case OrderStatus.started:
            return ride.order.rideDirections;

          case OrderStatus.driverCanceled:
          case OrderStatus.riderCanceled:
          case OrderStatus.finished:
          case OrderStatus.expired:
            return [];
        }
      },
    );
  }

  List<CustomMarker> get markers {
    return maybeMap(
      orElse: () => [],
      online: (online) {
        final waypointsMarkers = (online.currentOrderRequest ?? online.orderRequests.firstOrNull)?.waypoints.markers;
        final directionsCapMarkers =
            (online.currentOrderRequest ?? online.orderRequests.firstOrNull)?.route.directionsCapMarkers ?? [];
        final driverMarker = online.driverLocation?.genericMarker();
        return [
          if (waypointsMarkers != null) ...waypointsMarkers,
          if (driverMarker != null) driverMarker,
          ...directionsCapMarkers,
        ];
      },
      onTrip: (onTrip) {
        final List<CustomMarker> waypointsMarkers = switch (onTrip.order.status) {
          OrderStatus.requested => [onTrip.order.waypoints.markers.first],
          OrderStatus.driverAccepted => [onTrip.order.waypoints.markers.first],
          OrderStatus.arrived => [onTrip.order.waypoints.markers.first],
          OrderStatus.waitingForPrePay => onTrip.order.waypoints.markers,
          OrderStatus.waitingForPostPay => onTrip.order.waypoints.markers,
          OrderStatus.started => [onTrip.order.waypoints.markers[(onTrip.order.destinationArrivedTo ?? 0) + 1]],
          _ => onTrip.order.waypoints.markers,
        };
        final directionsCapMarkers = _directions.directionsCapMarkers;
        final driverMarker = onTrip.driverLocation?.genericMarker();
        return [
          ...waypointsMarkers,
          ...directionsCapMarkers,
          if (driverMarker != null) driverMarker,
        ];
      },
      offline: (offline) {
        final driverMarker = offline.driverLocation?.genericMarker();
        return [
          if (driverMarker != null) driverMarker,
        ];
      },
    );
  }

  List<PolyLineLayer> get polylines => maybeMap(
        orElse: () => [],
        online: (online) {
          PolyLineLayer? waypointsMarkers =
              (online.currentOrderRequest ?? online.orderRequests.firstOrNull)?.route.toPolyLineLayer;
          return [
            if (waypointsMarkers != null) waypointsMarkers,
          ];
        },
        onTrip: (onTrip) {
          return [
            _directions.toPolyLineLayer,
          ];
        },
      );

  List<CircleMarker> get circleMarkers => maybeMap(
        orElse: () => [],
        online: (value) {
          if (value.radiusFilter == null || value.driverLocation == null) return [];
          return [
            CircleMarker(
              position: LatLng(value.driverLocation!.lat, value.driverLocation!.lng),
              radius: value.radiusFilter!.toDouble(),
              color: ColorPalette.primary80.withOpacity(0.2),
              borderColor: ColorPalette.primary80.withOpacity(0.8),
              borderWidth: 1,
            ),
          ];
        },
      );
}

@freezed
sealed class OnTripPage with _$OnTripPage {
  const factory OnTripPage.overview() = _Overview;

  const factory OnTripPage.chat() = _Chat;

  const factory OnTripPage.payment() = _Payment;

  const factory OnTripPage.rate() = _Rate;

  factory OnTripPage.fromJson(Map<String, dynamic> json) => _$OnTripPageFromJson(json);
}
