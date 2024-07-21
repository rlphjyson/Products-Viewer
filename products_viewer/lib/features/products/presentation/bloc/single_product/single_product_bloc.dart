import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/core/resources/data_state.dart';
import 'package:products_viewer/features/products/domain/usecases/get_product.dart';
import 'package:products_viewer/features/products/presentation/bloc/single_product/single_product_event.dart';
import 'package:products_viewer/features/products/presentation/bloc/single_product/single_product_state.dart';

class SingleProductBloc extends Bloc<SingleProductEvent, SingleProductState> {
  final GetProductUseCase _getProductUseCase;

  SingleProductBloc(this._getProductUseCase)
      : super(const SingleProductLoadingState()) {
    on<GetSingleProduct>(onGetSingleProduct);
  }

  void onGetSingleProduct(
      GetSingleProduct event, Emitter<SingleProductState> emit) async {
    final dataState = await _getProductUseCase(params: event.id);

    if (dataState is DataSuccess && dataState.data != null) {
      print('successed');
      print(dataState.data);
      emit(SingleProductLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      print('successed');
      print(dataState.exception);
      emit(SingleProductErrorState(dataState.exception!));
    }
  }
}
