import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';

class AlbumCard extends StatelessWidget {
  final Album album;

  const AlbumCard({Key key, @required this.album, bool showDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 10, left: 20),
        child: Container(
          height: 300,
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(album.cover), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton.icon(
                    color: Colors.redAccent,
                    icon: Icon(Icons.home, color: Colors.white),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    label: Text(
                      'HOT',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 100,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Soprano Announces',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'His New Album',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(album.cover),
                                    fit: BoxFit.cover),
                                color: Colors.redAccent[100],
                                border: Border.all(
                                  color: Colors.redAccent[100],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                album.authorId,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                                                      child: Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(Icons.comment, color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              album.tittle.toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
