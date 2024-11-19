import 'package:bookly_app/Features/home/data_layer/models/Book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/BookDetailsSection.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/Similar_books_section.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar_ook_details.dart';

class BookDetailsViewBody extends StatelessWidget{

  final BookModel bookModel;

  const BookDetailsViewBody({super.key, required this.bookModel});
  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
          child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30),
           child: Column(
            children: [
              CustomAppBarBookDetails(),
              BookDeatilsSection(bookModel: bookModel,),
              const Expanded(
                child:SizedBox(height: 40,),
              ),
              SimilarBooksSection(),
              const SizedBox(height: 40,)
            ],
            ),
           ),
          ),
        ],
      );
  }
}