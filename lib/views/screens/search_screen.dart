import 'package:flutter/material.dart';
import 'package:pt_project_1/views/components/header/simple_header.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height / 8,
              // color: Colors.red,
              child: Column(
                children: <Widget>[
                  SimpleHeader(
                    padding: 20,
                    title: 'Search',
                    showButton: false,
                    showSubtitle: false,
                  ),
                ],
              ),
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Card(
                elevation: 6.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 1,
                    // controller: _searchControl,
                  ),
                ),
              ),
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeader(
              padding: 20,
              title: 'Popular Categories',
              showButton: false,
              showSubtitle: false,
            )
          ]),
        ),
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: index.isEven ? 20 : 0, right: index.isOdd ? 20 : 0),
              child: InkWell(
                onTap: () {
                  print('tapped');
                },
                child: Card(
                  elevation: 2.0,
                  color: Colors.grey[300],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sports',
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black26,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, childCount: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4.1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SimpleHeader(
              padding: 20,
              title: 'Popular tags',
              showButton: false,
              showSubtitle: false,
            ),
          ]),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ronaldo',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          }, childCount: 5),
        )
      ],
    );
  }
}
