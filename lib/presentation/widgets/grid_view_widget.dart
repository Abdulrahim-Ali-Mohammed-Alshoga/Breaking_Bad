import 'package:breaking_bad/data/models/actors.dart';
import 'package:flutter/material.dart';
import 'package:breaking_bad/presentation/widgets/grid_title_widget.dart';

class GridViewWidget extends StatelessWidget {
  List<Actors> actors;

  GridViewWidget({Key? key, required this.actors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    actors.removeWhere((element) => element.name=="Skyler White");
    return GridView.builder(
        itemCount: actors.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return GridTitleWidget(
            actors: actors[index],
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1));
  }
}
