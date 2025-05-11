
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/businessLogic/category_bloc/category_bloc.dart';
import 'package:flutter_project/businessLogic/category_details_provider/category_details_bloc.dart';
import 'package:flutter_project/businessLogic/favourites_bloc/favourite_bloc.dart';
import 'package:flutter_project/businessLogic/main_screen_bloc/main_screen_bloc.dart';
import 'package:flutter_project/businessLogic/product_details_bloc/product_details_bloc.dart';
import 'package:flutter_project/dataProvider/models/response/category.dart';
import 'package:flutter_project/presentation/router/routes.dart';
import 'package:flutter_project/presentation/screen/category/category_details_screen.dart';
import 'package:flutter_project/presentation/screen/main_screen/main_screen.dart';
import 'package:flutter_project/presentation/screen/products/product_details_screen.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../businessLogic/all_product_bloc/all_products_bloc.dart';
import '../../dataProvider/network/interceptor.dart';
import '../../dataProvider/network/mock_api_client.dart';
import '../../dataProvider/network/network_api_client.dart';
import '../../helper/constant/constants_resource.dart';
import '../../repository/data_manager.dart';
import '../screen/splash/splash_screen.dart';

class AppRouter {
  AppRouter() {
    Dio dio = Dio(
      (BaseOptions(
          contentType: ConstantsResource.CONTENT_TYPE,
          headers: {
            "Accept": ConstantsResource.CONTENT_TYPE,
            "api-key": '',
          },
          baseUrl: 'https://dummyjson.com/')),
    );
    dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    dio.interceptors.add(TokenInterceptor());
    dataManager = DataManager(
        mockApiClient: MockApiClient(),
        networkApiClient: NetworkApiClient(dio));
  }

  late DataManager dataManager;

  Route? generateRoute(RouteSettings routeSettings) {
    String route = routeSettings.name ?? "";
    switch (route) {
      case SPLASH_SCREEN_ROUTE:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case MAIN_SCREEN_ROUTE:
        {
          {
            return MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => MainScreenBloc(dataManager),
                    ),
                    BlocProvider(
                      create: (context) => AllProductsBloc(dataManager),
                    ),
                    BlocProvider(
                      create: (context) => CategoryBloc(dataManager),
                    ),
                    BlocProvider(
                      create: (context) => FavouriteBloc(),
                    ),
                  ],
                  child: MainScreen(),
                ));
          }
        }

      case CATEGORY_DETAILS_SCREEN:
        {

          var arguments = routeSettings.arguments as Category;
          var category = arguments;
          
          return MaterialPageRoute(
              builder: (_)=>BlocProvider(
                  create: (context)=>CategoryDetailsBloc(dataManager),
                child: CategoryDetailsScreen(category: category),

              ),
          );
        }

      case PRODUCT_DETAILS_SCREEN:
        {

          var arguments = routeSettings.arguments as int;
          var productId = arguments;

          return MaterialPageRoute(
            builder: (_)=>BlocProvider(
              create: (context)=>ProductDetailsBloc(dataManager),
              child: ProductDetailsScreen(productId: productId),

            ),
          );
        }






      default:
        return null;
    }
  }

  void dispose() {}
}
