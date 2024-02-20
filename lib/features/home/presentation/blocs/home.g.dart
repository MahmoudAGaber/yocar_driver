// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialImpl _$$InitialImplFromJson(Map<String, dynamic> json) =>
    _$InitialImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InitialImplToJson(_$InitialImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingImpl _$$LoadingImplFromJson(Map<String, dynamic> json) =>
    _$LoadingImpl(
      error: json['error'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingImplToJson(_$LoadingImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$OnlineStateImpl _$$OnlineStateImplFromJson(Map<String, dynamic> json) =>
    _$OnlineStateImpl(
      radiusFilter: json['radiusFilter'] as int?,
      wallet: (json['wallet'] as num).toDouble(),
      currency: json['currency'] as String,
      orderRequests: (json['orderRequests'] as List<dynamic>)
          .map((e) => OrderRequestEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentOrderRequest: json['currentOrderRequest'] == null
          ? null
          : OrderRequestEntity.fromJson(
              json['currentOrderRequest'] as Map<String, dynamic>),
      driverLocation: json['driverLocation'] == null
          ? null
          : DriverLocation.fromJson(
              json['driverLocation'] as Map<String, dynamic>),
      error: json['error'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OnlineStateImplToJson(_$OnlineStateImpl instance) =>
    <String, dynamic>{
      'radiusFilter': instance.radiusFilter,
      'wallet': instance.wallet,
      'currency': instance.currency,
      'orderRequests': instance.orderRequests,
      'currentOrderRequest': instance.currentOrderRequest,
      'driverLocation': instance.driverLocation,
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$OfflineStateImpl _$$OfflineStateImplFromJson(Map<String, dynamic> json) =>
    _$OfflineStateImpl(
      wallet: (json['wallet'] as num).toDouble(),
      currency: json['currency'] as String,
      error: json['error'] as String?,
      driverLocation: json['driverLocation'] == null
          ? null
          : DriverLocation.fromJson(
              json['driverLocation'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OfflineStateImplToJson(_$OfflineStateImpl instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
      'currency': instance.currency,
      'error': instance.error,
      'driverLocation': instance.driverLocation,
      'runtimeType': instance.$type,
    };

_$OnTripStateImpl _$$OnTripStateImplFromJson(Map<String, dynamic> json) =>
    _$OnTripStateImpl(
      order: OrderEntity.fromJson(json['order'] as Map<String, dynamic>),
      page: OnTripPage.fromJson(json['page'] as Map<String, dynamic>),
      driverLocation: json['driverLocation'] == null
          ? null
          : DriverLocation.fromJson(
              json['driverLocation'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : Failure.fromJson(json['error'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OnTripStateImplToJson(_$OnTripStateImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'page': instance.page,
      'driverLocation': instance.driverLocation,
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$AccessDeniedImpl _$$AccessDeniedImplFromJson(Map<String, dynamic> json) =>
    _$AccessDeniedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AccessDeniedImplToJson(_$AccessDeniedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OverviewImpl _$$OverviewImplFromJson(Map<String, dynamic> json) =>
    _$OverviewImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OverviewImplToJson(_$OverviewImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RateImpl _$$RateImplFromJson(Map<String, dynamic> json) => _$RateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RateImplToJson(_$RateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
