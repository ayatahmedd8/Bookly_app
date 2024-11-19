import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'Similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(
           'You can also like',
           style: Styles.textstyle14.copyWith(
             fontWeight: FontWeight.w600,),
         ),
       const SizedBox(height: 16,),
       SimilarBooksListView(),
     ],
   );
  }
}