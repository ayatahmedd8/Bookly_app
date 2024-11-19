import 'package:bookly_app/Features/home/data_layer/models/Book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'BooksButtonAction.dart';
import 'book_rating.dart';
import 'custom_book_item.dart';

class BookDeatilsSection extends StatelessWidget{
 final BookModel bookModel;

  const BookDeatilsSection({super.key, required this.bookModel});
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width *.17),
          child:  CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??''
          ),
        ),
        const SizedBox(height: 18,),
        Text(
            bookModel.volumeInfo.title!,
            style: Styles.textstyle30.copyWith(
              fontWeight: FontWeight.bold
            ),
           textAlign: TextAlign.center,
                   ),
        const SizedBox(height: 2,),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textstyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        const SizedBox(height: 14,),
         BookRating(
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,),
        const SizedBox(height: 30,),
        BooksButtonAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}