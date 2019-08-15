import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/views/components/cards/album_card.dart';
import 'package:pt_project_1/views/components/cards/detailed_news_card.dart';
import 'package:pt_project_1/views/components/cards/image_text_card.dart';
import 'package:pt_project_1/views/components/cards/side_detailed_card.dart';
import 'package:pt_project_1/views/components/header/simple_header.dart';

class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          SimpleHeader(
            subTitle: 'Wed, 20, August, 2019',
            title: 'Today',
            padding: 20,
            showSubtitle: true,
            showButton: false,
          ),
        ])),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return index.isEven
                  ? AlbumCard(
                      album: albums[index],
                      showDetails: true,
                      //padding: 20,
                    )
                  : DetailedNewsCard(
                      album: albums[index],
                      padding: 20,
                    );
            },
            childCount: albums.length,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SimpleHeader(
            subTitle: 'Wed, 12, August, 2019',
            title: 'Monday',
            padding: 20,
            showSubtitle: true,
            showButton: false,
          ),
        ])),
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
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SimpleHeader(
            subTitle: 'Thu, 12, August, 2019',
            title: 'Sunday',
            padding: 20,
            showSubtitle: true,
            showButton: false,
          ),
        ])),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ImageTextCard(
              album: albums[index],
            ),
          );
        }, childCount: 1)),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return SideDetailedCard(
            //album: albums[index],
            //padding: 10,
          );
        }, childCount: 3)),
      ],
    );
  }
}
