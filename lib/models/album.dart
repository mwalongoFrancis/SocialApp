import 'package:flutter/foundation.dart';

class Album {
  final String cover;
  final String tittle;
  final String subtittle;
  final String authorId;
  final bool isHot;

  Album(
      {@required this.cover,
      @required this.tittle,
      @required this.subtittle,
      @required this.authorId,
      @required this.isHot});

      Album.fromMap(Map<String, dynamic> map):

      assert(map['cover']!= null),
      assert(map['tittle']!= null),
      assert(map['subtittle']!= null),
      assert(map['author_id']!= null),
      assert(map['isHot']!= null),
      cover = map['cover'],
        tittle = map['tittle'],
        subtittle = map['subtittle'],
        authorId = map['authorId'],
        isHot = map['isHot'];
      
        
      
}

