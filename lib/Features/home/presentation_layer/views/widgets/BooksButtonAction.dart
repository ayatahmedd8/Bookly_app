
import 'package:bookly_app/Features/home/data_layer/models/Book_model/book_model.dart';
import 'package:bookly_app/core/utils/functions/launcher_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksButtonAction extends StatelessWidget {
    final BookModel bookModel;

  const BooksButtonAction({super.key, required this.bookModel});
  @override
  Widget build(BuildContext context) {

     return Padding(
       padding: EdgeInsets.symmetric(horizontal: 8),
       child:  Row(
         children: [
           const Expanded(
               child: CustomButton(
                 text: 'Free',
                   backgroundColor: Colors.white,
                   textColor: Colors.black,
                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(16),
                       bottomLeft: Radius.circular(16),
                   ),
               ),
           ),
           Expanded(
             child: CustomButton(
               onpressed: (){
                 launchCustomurl(context, bookModel.volumeInfo.previewLink);
               },
               fontSize: 16,
               text: getText(bookModel),
               backgroundColor: const Color(0xffEF8262),
               textColor: Colors.white,
               borderRadius: const BorderRadius.only(
                 topRight: Radius.circular(16),
                 bottomRight: Radius.circular(16),
               ),
             ),
           ),
         ],
       ),
     );
  }
String getText(BookModel bookmodel){
    if(bookModel.volumeInfo.previewLink == null){
      return 'Not Available';
    }else{
      return 'Preview';
    }
 }

}