import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';

class DetailedNewsCard extends StatelessWidget {
  final Album album;
  final double padding;

  const DetailedNewsCard({Key key, @required this.album, @required this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(album.cover), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                        ),
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text('GAMING'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text(
                        'Soprano Announces His New',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text(
                        'Mozilla has announced a new version of its browser for argumrnt reality',
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
