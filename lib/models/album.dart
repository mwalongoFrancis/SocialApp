import 'package:flutter/foundation.dart';

class Album {
  final String cover;
  final String tittle;
  final String subtittle;
  final String avatar;
  final String author;
  final int comments;
  final bool isHot;

  Album(
      {@required this.cover,
      @required this.tittle,
      @required this.subtittle,
      @required this.avatar,
      @required this.author,
      @required this.comments,
      @required this.isHot});
}

List<Album> albums = <Album>[
  Album(
      author: 'Developer',
      avatar: 'assets/images/chui.jpg',
      comments: 2,
      cover: 'assets/images/majumba.jpg',
      isHot: true,
      subtittle: 'coded Francis',
      tittle: 'here we go'),
  Album(
      author: 'Developer',
      avatar: 'assets/images/ocean.jpg',
      comments: 34,
      cover: 'assets/images/mlima.jpg',
      isHot: false,
      subtittle: 'coded Francis',
      tittle: 'here we go'),
  Album(
      author: 'Developer',
      avatar: 'assets/images/tyger.jpg',
      comments: 10,
      cover: 'assets/images/apple.jpg',
      isHot: true,
      subtittle: 'coded Francis',
      tittle: 'here we go'),
];
