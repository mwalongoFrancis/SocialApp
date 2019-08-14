import 'package:flutter/material.dart';
import 'package:pt_project_1/models/album.dart';

class ImageTextCard extends StatelessWidget {
  final Album album;

  const ImageTextCard({Key key, @required this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.pink,
      ),
      height: height / 3,
      child: Stack(
        children: <Widget>[
          Container(
              height: height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(album.cover), fit: BoxFit.cover),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(15),
              height: height / 10,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.black26,
              ),
              child: Text(
                album.tittle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
