import 'package:bookly_app/Features/home/presentation_layer/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/widgets/Custom_error.dart';
import 'package:bookly_app/core/widgets/Custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccess){
        return SizedBox(
          height: MediaQuery.of(context).size.height * .14,
          child: ListView.builder(
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(imageUrl:
                  state.books[index].volumeInfo.imageLinks?.thumbnail ?? ''),
                );
              }),
        );
       }else if(state is SimilarBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return CustomLoadingIndicator();
        }
      }
    );
  }
}