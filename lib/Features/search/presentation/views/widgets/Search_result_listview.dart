import 'package:flutter/material.dart';

import '../../../../home/presentation_layer/views/widgets/BestSellerListViewItem.dart';

class SearchResultListView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
           // child: BookListViewItem(),
            child: Text('data')
          );
        }
    );
  }
}