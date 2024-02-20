import 'package:dartz/dartz.dart';
import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/entities/order.dart';
import 'package:driver_flutter/core/entities/order_request.dart';
import 'package:driver_flutter/core/entities/profile.dart';
import 'package:driver_flutter/core/enums/driver_status.dart';
import 'package:driver_flutter/core/error/failure.dart';
import 'package:driver_flutter/core/repositories/firebase_repository.dart';
import 'package:driver_flutter/core/router/app_router.dart';
import 'package:driver_flutter/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:flutter_common/core/entities/place.dart';
import 'package:flutter_common/core/enums/order_status.dart';
import 'package:flutter_common/features/chat/chat.dart';
import 'package:generic_map/generic_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_common/core/entities/driver_location.dart';
import 'package:latlong2/latlong.dart';

part 'home.event.dart';
part 'home.state.dart';
part 'home.freezed.dart';
part 'home.g.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  final FirebaseRepository _firebaseRepository;
  Stream<List<OrderRequestEntity>>? orderRequests;
  Stream<OrderEntity>? order;

  HomeBloc(
    this._repository,
    this._firebaseRepository,
  ) : super(const HomeState.initial()) {
    on<HomeEvent>(
      (event, emit) async {
        switch (event) {
          case _OnStarted():
            final profile = await _repository.getProfile();
            _firebaseRepository.retrieveAndUpdateFcmToken();
            await _onProfileUpdated(profile, emit);
            break;

          case _OnStatusChanged(:final status):
            final profile = await _repository.updateStatus(status: status);
            await _onProfileUpdated(profile, emit);
            break;

          case _OnLocationUpdated(:final location):
            final orders = await _repository.updateDriverLocation(location: location);
            orders.fold(
              (l) => null,
              (r) => state.mapOrNull(
                online: (online) => emit(
                  online.copyWith(driverLocation: location, orderRequests: r),
                ),
                onTrip: (value) {
                  emit(value.copyWith(driverLocation: location));
                },
              ),
            );
            break;

          case _OnAcceptOrder(:final request):
            final order = await _repository.acceptOrderRequest(requestId: request.id);
            await order.fold(
              (l) async => emit(
                state.maybeMap(
                  orElse: () => throw Exception('Invalid state'),
                  online: (online) => online.copyWith(
                    orderRequests: online.orderRequests.where((r) => r.id != request.id).toList(),
                    error: l.errorMessage,
                  ),
                ),
              ),
              (r) async {
                emit(HomeState.onTrip(order: r, page: const OnTripPage.overview()));
                await _startOrderUpdateSubscription(r.id, emit);
              },
            );
            break;

          case _OnCancelOrder(:final orderId):
            final order = await _repository.cancelOrder(orderId: orderId);
            final newState = _orderToHomeState(order);
            emit(newState);

            break;

          case _OnArrivedToPickupPoint(:final orderId):
            final order = await _repository.arrivedToPickup(orderId: orderId);
            final newState = _orderToHomeState(order);
            emit(newState);

            break;

          case _OnTripStarted(:final orderId):
            final order = await _repository.startTrip(orderId: orderId);
            final newState = _orderToHomeState(order);
            emit(newState);

            break;

          case _OnArrivedToDestination(:final order, :final destinationArrivedTo):
            final newOrder = await _repository.arrivedToDestination(
              order: order,
              destinationArrivedTo: destinationArrivedTo,
            );
            final newState = _orderToHomeState(newOrder);
            emit(newState);
            break;

          case _OnShowChat():
            emit(
              state.maybeMap(
                orElse: () => throw Exception('Invalid state'),
                onTrip: (onTrip) => onTrip.copyWith(page: const OnTripPage.chat()),
              ),
            );
            break;

          case _ReviewSubmitted(:final rating, :final review, :final orderId):
            if (rating == null) {
              onStarted();
            } else {
              await _repository.submitReview(orderId: orderId, rating: rating, review: review);
              onStarted();
            }
            break;

          case _PaidInCash(:final orderId, :final amount):
            await _repository.paidInCash(orderId: orderId, amount: amount);
            emit(
              state.maybeMap(
                orElse: () => const HomeState.initial(),
                onTrip: (onTrip) => onTrip.copyWith(
                  page: const OnTripPage.rate(),
                ),
              ),
            );
            break;

          case _OnSummaryConfirmed():
            emit(
              state.maybeMap(
                orElse: () => throw Exception('Invalid state'),
                onTrip: (onTrip) => onTrip.copyWith(
                  page: const OnTripPage.rate(),
                ),
              ),
            );
            break;

          case _OnOrderRequestPageChanged(:final request):
            emit(
              state.maybeMap(
                orElse: () => throw Exception('Invalid state'),
                online: (online) => online.copyWith(
                  currentOrderRequest: request,
                ),
              ),
            );
            break;

          case _MessageSent(:final message):
            emit(
              state.maybeMap(
                onTrip: (inProgress) {
                  return inProgress.copyWith(
                    order: inProgress.order.copyWith(
                      chatMessages: [...inProgress.order.chatMessages, message],
                    ),
                  );
                },
                orElse: () => throw Exception("Invalid state"),
              ),
            );
          case _OnHideChat():
            emit(
              state.maybeMap(
                onTrip: (inProgress) {
                  return inProgress.copyWith(
                    page: const OnTripPage.overview(),
                  );
                },
                orElse: () => throw Exception("Invalid state"),
              ),
            );
            break;
          case _OnRadiusChanged(:final radius):
            final profile = await _repository.updateRadius(
              radius: radius,
            );
            await _onProfileUpdated(profile, emit);
        }
      },
    );
  }

  void onStarted() => add(const HomeEvent.onStarted());

  void onStatusChanged(DriverStatus status) => add(HomeEvent.onStatusChanged(status: status));

  void onLocationUpdated(DriverLocation location) => add(
        HomeEvent.onLocationUpdated(
          location: location,
        ),
      );

  void onAcceptOrder(OrderRequestEntity request) => add(HomeEvent.onAcceptOrder(request: request));

  void onRadiusChanged(int radius) => add(HomeEvent.onRadiusChanged(radius: radius));

  HomeState _orderToHomeState(Either<Failure, OrderEntity> order) {
    return order.fold(
      (l) => state.maybeMap(
        orElse: () => throw Exception('Invalid state'),
        onTrip: (onTrip) => onTrip.copyWith(error: l),
      ),
      (r) {
        switch (r.status.viewMode) {
          case (OrderStatusViewMode.waitingForPayment):
            return HomeState.onTrip(
              order: r,
              page: const OnTripPage.payment(),
            );

          case (OrderStatusViewMode.review):
          case (OrderStatusViewMode.finished):
            return const HomeState.initial();

          case (OrderStatusViewMode.inProgress):
            return HomeState.onTrip(
              order: r,
              page: const OnTripPage.overview(),
            );

          case OrderStatusViewMode.looking:
            throw Exception('Invalid state');
        }
      },
    );
  }

  Future<void> _onProfileUpdated(
    Either<Failure, ProfileEntity> profile,
    Emitter emit,
  ) async {
    await profile.fold(
      (l) async {
        final newState = state.maybeMap(
          orElse: () {
            if (l.errorMessage == 'GqlAuthGuard') {
              return const HomeState.accessDenied();
            } else {
              return null;
            }
          },
          online: (online) => online.copyWith(error: l.errorMessage),
          offline: (offline) => offline.copyWith(error: l.errorMessage),
        );
        if (newState != null) {
          emit(newState);
        }
      },
      (r) async {
        final driverLocation = state.mapOrNull(
          online: (value) => value.driverLocation,
          onTrip: (value) => value.driverLocation,
          offline: (value) => value.driverLocation,
        );
        await r.status.map(
          pendingSubmission: (pendingSubmission) async => locator<AppRouter>().replaceAll(
            [
              const AuthRoute(),
            ],
          ),
          pendingApproval: (pendingApproval) async => throw Exception("Pending approval"),
          online: (online) async {
            if (driverLocation != null) {
              add(
                HomeEvent.onLocationUpdated(
                  location: driverLocation,
                ),
              );
            }
            emit(
              HomeState.online(
                wallet: r.wallets.firstOrNull?.balance ?? 0,
                currency: r.wallets.firstOrNull?.currency ?? "USD",
                radiusFilter: r.searchRadius,
                orderRequests: state.maybeMap(
                  orElse: () => [],
                  online: (online) => online.orderRequests,
                ),
                driverLocation: driverLocation,
              ),
            );
            if (orderRequests == null) {
              orderRequests = _repository.startGettingOrderRequestUpdates();
              await emit.forEach(
                orderRequests!,
                onData: (data) {
                  return state.maybeMap(
                    orElse: () => throw Exception('Invalid state'),
                    online: (online) => online.copyWith(
                      orderRequests: data,
                    ),
                  );
                },
              );
            }
          },
          offline: (offline) async {
            _repository.stopGettingOrderRequestUpdates();
            _repository.stopOrderUpdatedSubscription();
            emit(
              HomeState.offline(
                wallet: r.wallets.firstOrNull?.balance ?? 0,
                currency: r.wallets.firstOrNull?.currency ?? "USD",
                driverLocation: driverLocation,
              ),
            );
          },
          onTrip: (onTrip) async {
            final newState = _orderToHomeState(Right(r.orders.first));
            emit(newState);
            await _startOrderUpdateSubscription(r.orders.first.id, emit);
          },
          blocked: (blocked) => throw Exception("Blocked"),
          softReject: (softReject) => throw Exception("Soft reject"),
          hardReject: (hardReject) => throw Exception("Hard reject"),
        );
      },
    );
  }

  Future<void> _startOrderUpdateSubscription(String orderId, Emitter emit) async {
    order = _repository.startOrderUpdatedSubscription(
      orderId: orderId,
    );
    await emit.forEach(
      order!,
      onData: (data) {
        final newState = _orderToHomeState(Right(data));
        return newState;
      },
    );
  }
}
