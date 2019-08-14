import 'package:flutter/material.dart';
//import 'package:pt_project_1/views/components/complete_card/monday_card.dart';
import 'package:pt_project_1/views/screens/category_screen.dart';
import 'package:pt_project_1/views/screens/discover_screen.dart';
import 'package:pt_project_1/views/screens/profile_screen.dart';
import 'package:pt_project_1/views/screens/search_screen.dart';
import 'package:pt_project_1/views/screens/today_screen.dart';
//import 'package:pt_project_1/views/screens/today_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = <Widget>[
      TodayScreen(),
     CategoryScreen(),
     DiscoverScreen(),
     SearchScreen(),
     ProfileScreen()
    ];
    return Scaffold(
      
      body: DefaultTabController(child: _screens.elementAt(_currentindex),length: 5,

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,selectedItemColor: Colors.red,
        onTap: _selectedIndex, unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ac_unit,
                //color: Colors.grey[600],
              ),
              title: Text(
                "Today",
                //style: TextStyle(color: Colors.red),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                //color: Colors.grey[600],
              ),
              title: Text(
                "Category",
                //style: TextStyle(color: Colors.red),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                //color: Colors.grey[600],
              ),
              title: Text(
                "Discover",
                //style: TextStyle(color: Colors.red),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                //color: Colors.grey[600],
              ),
              title: Text(
                "Search",
                //style: TextStyle(color: Colors.red),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                //color: Colors.grey[600],
              ),
              title: Text(
                "Profile",
                //style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }

  void _selectedIndex(int index) {
    setState(() {
       _currentindex = index;
    });
   
  }
}
