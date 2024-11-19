import 'package:bookly_app/Features/home/data_layer/repo/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/presentation_layer/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation_layer/manager/newest_bboks_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Features/Splash/presentation_layer/views/splash_view.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>
        FeaturedBooksCubit(
          // HomeRepoImplementation(
          //   ApiService(Dio(),
          //   ),
          // ),
          getIt.get<HomeRepoImplementation>()
        )..fetchFeaturedBooks(),
        ),
        BlocProvider(create: (context)=>
            NewestBooksCubit(
                getIt.get<HomeRepoImplementation>()
            )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),
      ),
    );
  }
}

