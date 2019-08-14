import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/views/components/cards/image_text_card.dart';
//import 'package:pt_project_1/views/components/cards/detailed_news_card.dart';
//import 'package:pt_project_1/views/components/cards/image_text_card.dart';

class MondayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Text(
                '18 MARCH',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Monday',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: index.isEven ? 20 : 0, right: index.isOdd ? 20 : 0),
              child: ImageTextCard(
                album: albums[index],
              ),
            );
          }, childCount: albums.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
        )
      ],
    );
  }
}