import 'package:flutter/material.dart';

class SimpleHeader extends StatelessWidget {
  final String subTitle;
  final String title;
  final double padding;
  final bool showSubtitle;
  final bool showButton;

  const SimpleHeader(
      {Key key,
      this.subTitle,
      @required this.title,
      @required this.padding,
      this.showSubtitle,
      this.showButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          showSubtitle ? 
            Text(
              subTitle,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ) : Container(),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(title,
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
              ),
              showButton ?
              RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                color: Colors.deepPurple,
                onPressed: null,
                child: Text(
                  'SEE ALL',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ):Container(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}