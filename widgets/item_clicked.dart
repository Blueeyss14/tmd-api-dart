import 'package:flutter/material.dart';
import 'package:tmdb_api_test/models/movie.dart';

class ItemClicked extends StatefulWidget {
  final Movie clicked;
  const ItemClicked({super.key, required this.clicked});

  @override
  State<ItemClicked> createState() => _ItemClickedState();
}

class _ItemClickedState extends State<ItemClicked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(widget.clicked.title),
          )
        ],
      ),
    );
  }
}
