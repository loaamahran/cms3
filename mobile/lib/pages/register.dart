import 'package:flutter/material.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);
  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Time Table',
      style: optionStyle,
    ),
    Text(
      'Index 2: Attendance',
      style: optionStyle,
    ),
    Text(
      'Index 3: Assignments',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profile',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar( backgroundColor:Color(0xff000000),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white70),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Registration',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: TabBar(   indicator: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff3D649F),
                                    width: 4.5,
                                  ),
                                ),
                              ),
                                labelColor: Colors.white,
                                labelStyle: TextStyle(fontSize: 20),
                                unselectedLabelColor: Color(0xffB2B2B2),
                                tabs: [
                                  Tab(text: 'Lectures'),
                                  Tab(text: 'Sections'),
                                ],
                              ),
                            ),
                            Container(
                                height: 400,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: <Widget>[
                                  Container(
                                      child: Column(children: <Widget>[
                                        Card( margin: const EdgeInsets.all(20),
                                            color: Color(0xff252525),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: Color(0xff252525),
                                              ),
                                              borderRadius: BorderRadius.circular(18.0),
                                            ),
                                            child: SizedBox(
                                                width:400,
                                                height: 150,
                                                child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      const ListTile(
                                                        leading: Icon( Icons.menu_book_sharp,
                                                            size: 30),
                                                        title:
                                                        Text('Web Programming',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),),
                                                        subtitle: Text(
                                                            'Nermine Ahmed'),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 250),
                                                        child: ElevatedButton(
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: const [
                                                              Text('Register', style: TextStyle(
                                                                fontSize: 10,
                                                              ),),
                                                              SizedBox(width: 3,),
                                                              Icon(Icons.add_circle_sharp,
                                                                size: 14, ),
                                                            ],
                                                          ),
                                                          onPressed: () {},
                                                          style: ElevatedButton.styleFrom(
                                                            primary: Color(0xff3D649F),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10)),
                                                            minimumSize: Size(26, 26),
                                                          ),
                                                        ),
                                                      )])
                                            ))]
                                      )
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(25),
                                        child: ElevatedButton(
                                          child: Text('Web Programming',  style: TextStyle(fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          ),),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff252525),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(18)),
                                            minimumSize: Size(400, 75),
                                          ),
                                        ),
                                      )],
                                  ),
                                ]))
                          ])),
                ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: 'Time Table',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_sharp),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit_document),
                label: 'Assignments',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff3d649f),
            unselectedItemColor: Color(0xff777777),
            onTap: _onItemTapped,
          ),
        ));
  }
}