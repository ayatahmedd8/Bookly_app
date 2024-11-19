import 'package:bookly_app/Features/home/data_layer/models/Book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/custom_book_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget{

  final BookModel bookModel;

  const BestSellerListViewItem({super.key, required this.bookModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      GoRouter.of(context).push(AppRouter.KBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
          CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(width: 30,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width *.5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         style: Styles.textstyle20.copyWith(
                           fontFamily: KGTSectraFine
                         ),
                      ),
                  ),
                 const  SizedBox(height: 3,),
                   Text(
                      bookModel.volumeInfo.authors![0],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textstyle14,
                  ),
                  const  SizedBox(height: 3,),
                  Row(
                    children: [
                        Text(
                        'Free',
                        style: Styles.textstyle20.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Spacer(),
                       BookRating(
                         rating: bookModel.volumeInfo.averageRating ?? 0,
                         count: bookModel.volumeInfo.ratingsCount ?? 0,
                       ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}