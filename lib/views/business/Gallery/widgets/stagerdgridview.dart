import 'package:bciweb/constant/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4, // The number of columns in the grid
      itemCount: 10, // The total number of items in the grid
      itemBuilder: (BuildContext context, int index) => Container(
        // Create a widget for each item in the grid
        color: kblue,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.count(
          2, index.isEven ? 2 : 1), // Define the size of each tile
      mainAxisSpacing: 4.0, // Spacing between rows
      crossAxisSpacing: 4.0, // Spacing between columns
    );
  }
}
