import 'package:bookly_app/Features/home/presentation_layer/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/widgets/Custom_error.dart';
import 'package:bookly_app/core/widgets/Custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class FeaturedBooksListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state){
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.KBookDetailsView, extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',),
                  ),
                );
              }),
        );
      }else if(state is FeaturedBooksFailure){
        return CustomErrorWidget(errMessage: state.errMessage);
      }else{
        return CustomLoadingIndicator();
      }
     },
    );
  }
}