import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:products_viewer/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:products_viewer/features/products/data/repository/product_repository_impl.dart';
import 'package:products_viewer/features/products/domain/repository/product_repository.dart';
import 'package:products_viewer/features/products/domain/usecases/get_product.dart';
import 'package:products_viewer/features/products/domain/usecases/get_productList.dart';
import 'package:products_viewer/features/products/presentation/bloc/product_list/product_list_bloc.dart';
import 'package:products_viewer/features/products/presentation/bloc/single_product/single_product_bloc.dart';

final instance = GetIt.instance;

Future<void> registerDependencies() async {
  //Dio
  instance.registerSingleton<Dio>(Dio());
  //Dependencies
  instance
      .registerSingleton<ProductsApiService>(ProductsApiService(instance()));

  instance
      .registerSingleton<ProductRepository>(ProductRepositoryImpl(instance()));
  //Use cases
  instance.registerSingleton<GetProductListUseCase>(
      GetProductListUseCase(instance()));
  instance.registerSingleton<GetProductUseCase>(GetProductUseCase(instance()));
  //Blocs
  instance
      .registerFactory<SingleProductBloc>(() => SingleProductBloc(instance()));
  instance.registerFactory<ProductListBloc>(() => ProductListBloc(instance()));
}
