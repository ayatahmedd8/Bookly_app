import 'package:bookly_app/Features/home/presentation_layer/manager/newest_bboks_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/BestSellerListViewItem.dart';
import 'package:bookly_app/core/widgets/Custom_error.dart';
import 'package:bookly_app/core/widgets/Custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(bookModel: state.books[index],),
                );
              }
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return CustomLoadingIndicator();
        }
      }
    );
  }
}