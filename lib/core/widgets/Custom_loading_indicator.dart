import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator()
    );
  }
}