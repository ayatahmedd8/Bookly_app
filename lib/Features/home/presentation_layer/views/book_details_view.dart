import 'package:bookly_app/Features/home/data_layer/models/Book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation_layer/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget{
  final BookModel bookModel;

  const BookDetailsView({super.key, required this.bookModel});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {

  @override
  void initState(){
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(bookModel: widget.bookModel,),
      ),
    );
  }
}