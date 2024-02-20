import 'package:driver_flutter/features/payout_methods/domain/repositories/payout_methods_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entitites/payout_account.dart';

part 'payout_accounts.state.dart';
part 'payout_accounts.freezed.dart';

@lazySingleton
class PayoutAccountsBloc extends Cubit<PayoutAccountsState> {
  final PayoutMethodsRepository _repository;

  PayoutAccountsBloc(this._repository) : super(const PayoutAccountsState.initial());

  void load() {
    emit(const PayoutAccountsState.loading());
    _repository.getPayoutAccounts().then((result) {
      result.fold(
        (failure) => emit(PayoutAccountsState.error(failure.errorMessage)),
        (methods) {
          if (methods.isEmpty) {
            emit(const PayoutAccountsState.empty());
          } else {
            emit(PayoutAccountsState.loaded(
              defaultMethod: methods.firstWhere((element) => element.isDefault),
              linkedMethods: methods.where((element) => !element.isDefault).toList(),
            ));
          }
        },
      );
    });
  }
}
