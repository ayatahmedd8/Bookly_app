import 'package:bookly_app/Features/home/data_layer/repo/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt=GetIt.instance;

void setupServiceLocator() {
  //singlton of api service
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

 //create services
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<ApiService>()
    ),
  );
}