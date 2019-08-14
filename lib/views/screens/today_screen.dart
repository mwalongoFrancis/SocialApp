import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/views/components/cards/album_card.dart';
import 'package:pt_project_1/views/components/cards/detailed_news_card.dart';
import 'package:pt_project_1/views/components/cards/image_text_card.dart';
import 'package:pt_project_1/views/components/cards/side_detailed_card.dart';
// import 'package:pt_project_1/views/components/cards/image_text_card.dart';

import 'package:pt_project_1/views/components/header/simple_header.dart';

class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: 'wed 20 August 2019',
            day: 'Today',
            padding: 20,
          ),
        ]),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return index.isEven ? AlbumCard(
            album: albums[index],
          ): DetailedNewsCard(album: albums[index], padding: 20,);
        }, childCount: albums.length),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: 'wed 20 August 2019',
            day: 'Monday',
            padding: 20,
          ),
        ]),
      ),
      SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding:  EdgeInsets.only(left: index.isEven?20:0, right: index.isOdd?20:0),
          child: ImageTextCard(album: albums[index]),
        );
      },
      childCount: albums.length,
      ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5
      ),),
      SliverList(
        delegate: SliverChildListDelegate([
          SimpleHeader(
            date: 'wed 20 August 2019',
            day: 'Sunday',
            padding: 20,
          ),
        ]),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.only(left: 20, right: 20),
            child: ImageTextCard(album: albums[index],),
          );
        },
        childCount: 1
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return SideDetailedCard();
        },
        childCount: 3 
        ),
      ),

    ]);


  }
}
