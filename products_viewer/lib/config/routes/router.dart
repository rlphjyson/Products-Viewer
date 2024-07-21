import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_viewer/core/constants/routes.dart';
import 'package:products_viewer/features/products/presentation/pages/home/products_list_view.dart';
import 'package:products_viewer/features/products/presentation/pages/product_view/single_product_page.dart';

class AppRouter {
  AppRouter();
  static final goRouter = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ProductsListView());
        }),

    //ONBOARDING

    GoRoute(
        name: Routes.productViewPage.name,
        path: Routes.productViewPage.path,
        pageBuilder: (context, state) {
          Routes.productViewPage.addParams(state.extra.toString());
          return MaterialPage(
              child: SingleProductPage(
            id: state.extra as int,
          ));
        }),
  ]);
}
