import 'package:bookly_app/Features/Splash/presentation_layer/views/splash_view.dart';
import 'package:bookly_app/Features/home/data_layer/models/Book_model/book_model.dart';
import 'package:bookly_app/Features/home/data_layer/repo/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/presentation_layer/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KBookDetailsView = '/BookDetails';
  static const KSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => SearchView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(
                  getIt.get<HomeRepoImplementation>(),
              ),
              child: BookDetailsView(
               bookModel: state.extra as BookModel,
            ),
      ),
      ),
    ],
  );
}
