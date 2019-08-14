import 'package:flutter/material.dart';

class SideDetailedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 4,
      margin: EdgeInsets.only(left: 20, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              height: height / 4,
              width: width * 2 / 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/images/chui.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'FASHION',
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mozilla has announced a new version of itd browser for',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/majumba.jpg'),
                      ),
                      Expanded(
                          child: Text(
                        'Elena Anka',
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Divider(color: Colors.black
                  )
                  ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
