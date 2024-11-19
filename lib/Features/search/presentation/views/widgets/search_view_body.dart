import 'package:bookly_app/Features/search/presentation/views/widgets/Custom_search_textfield.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/Search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextfield(),
          const SizedBox(height: 16,),
          const Text(
            'Search Result',
            style: Styles.textstyle18,
          ),
          const SizedBox(height: 16,),
          Expanded(
              child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

