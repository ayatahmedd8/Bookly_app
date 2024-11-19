import 'package:bookly_app/Features/home/presentation_layer/views/widgets/BestSellerListViewItem.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/BestSellerListview.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30),
                  child:  CustomAppBar(),
                ),
                FeaturedBooksListView(),
                const SizedBox(height: 50,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Newest Books',
                    style: Styles.textstyle18,
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
