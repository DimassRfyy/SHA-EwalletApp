import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sha/models/payment_method_model.dart';
import 'package:flutter_sha/services/payment_method_service.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is FetchPaymentMethod) {
        try {
          emit(PaymentMethodLoading());
          final res = await PaymentMethodService().getPaymentMethods();
          emit(PaymentMethodSuccess(res));
        } catch (e) {
          emit(PaymentMethodFailed(e.toString()));
        }
      }
    });
  }
}
