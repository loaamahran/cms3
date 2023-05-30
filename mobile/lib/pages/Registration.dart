import 'package:cms_final/data/state/providers/repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RegistrationView extends ConsumerStatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationViewState();
}

class _RegistrationViewState extends ConsumerState<RegistrationView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  PanelController showCourse = PanelController();
  TextEditingController email = TextEditingController();
  bool prerequisite = false;
  List courseNames = [
    "Web Programming",
    "Math 4",
    "Mobile Web Development",
    "HCI",
    "Operating Systems",
    "Mobile Web Development",
    "HCI",
    "Operating Systems"
  ];
  List lecturesNames = [
    "Web Programming",
    "Math 4",
    "Mobile Web Development",
    "HCI",
    "Operating Systems",
    "Mobile Web Development",
    "HCI",
    "Operating Systems"
  ];
  List sectionsNames = [
    "Web Programming",
    "Math 4",
    "Mobile Web Development",
    "HCI",
    "Operating Systems",
    "Mobile Web Development",
    "HCI",
    "Operating Systems"
  ];
  List doctorname = [
    "DR Rasha Montaser",
    "DR Hala Farouk",
    "DR Mohamed Elkholy",
    "DR Nermine ElKashef",
    "DR Ahmed Younis",
    "ay7aga",
    "ay7aga",
    "ay7aga"
  ];
  List time = [
    "3 Hours",
    "3 Hours",
    "2 Hours",
    "3 Hours",
    "3 Hours",
    "3 Hours",
    "ay7aga",
    "ay7aga"
  ];
  List pre = [
    "Prerequisite: OOP",
    "Prerequisite: Math 3",
    "Prerequisite: Operating Systems",
    "Prerequisite: None",
    "Prerequisite: None",
    "",
    "ay7aga",
    "ay7aga"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0b0b0b),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: Text(
          'Registration',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey[800]),
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Search ...',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.only(left: 15.0),
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TabBar(
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff3D649F),
                      width: 4.5,
                    ),
                  ),
                ),
                controller: _tabController,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 15),
                unselectedLabelColor: Color(0xffB2B2B2),
                tabs: [
                  Tab(text: 'Courses'),
                  Tab(text: 'Lectures'),
                  Tab(text: 'Sections'),
                ],
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SlidingUpPanel(
              controller: showCourse,
              maxHeight: MediaQuery.of(context).size.height * .3,
              minHeight: 0.0,
              borderRadius: BorderRadius.circular(20.0),
              panelBuilder: (panel) => Container(
                color: Colors.grey[500],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Color(0xff252525)),
                        width: 343,
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: 'Email address',
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Color(0xff252525)),
                        width: 343,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'ID',
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Color(0xff252525)),
                          width: 172,
                          child: Row(
                            children: [
                              Text('Prerequisite  '),
                              Checkbox(
                                  value: prerequisite,
                                  activeColor: Color(0xff333333),
                                  side: BorderSide(color: Color(0xff3D649F)),
                                  onChanged: (value) {
                                    setState(() {
                                      prerequisite = !prerequisite;
                                    });
                                  })
                            ],
                          )),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Registered"),
                                content: new Text(
                                    "Lecture registered successfully!"),
                                actions: <Widget>[
                                  new TextButton(
                                    child: new Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        color: Color(0xff3D649F),
                        child: Text('Done'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder(
                    future:
                        ref.read(repositoryProvider).getRegisteringCourses(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final courses = snapshot.requireData;
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[800]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.menu_book_sharp,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            courses[index]!.name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                  "Code: ${courses[index]!.code!}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.watch_later_outlined,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                "${courses[index]!.creditHours} Hours",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Perquisites: ${courses[index]!.perquisites.map((e) => e)}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    child: MaterialButton(
                                      onPressed: () {
                                        print("openPanel");
                                        (showCourse.isPanelClosed)
                                            ? showCourse.open()
                                            : showCourse.close();
                                      },
                                      color: const Color(0xff3D649F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: InkWell(
                                        onTap: () async {
                                          if (await ref
                                              .read(repositoryProvider)
                                              .registerCourse(
                                                  courses[index]!)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(
                                                    "Registered Successfuly"),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(
                                                    "Can't Register"),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text('Register',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                )),
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.add_circle_sharp,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10.0),
                          itemCount: courses.length,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
            SlidingUpPanel(
              controller: showCourse,
              maxHeight: MediaQuery.of(context).size.height * .3,
              minHeight: 0.0,
              borderRadius: BorderRadius.circular(20.0),
              panelBuilder: (panel) => Container(
                color: Colors.grey[500],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Color(0xff252525)),
                        width: 343,
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: 'Email address',
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Color(0xff252525)),
                        width: 343,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'ID',
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Color(0xff252525)),
                          width: 172,
                          child: Row(
                            children: [
                              Text('Prerequisite  '),
                              Checkbox(
                                  value: prerequisite,
                                  activeColor: Color(0xff333333),
                                  side: BorderSide(color: Color(0xff3D649F)),
                                  onChanged: (value) {
                                    setState(() {
                                      prerequisite = !prerequisite;
                                    });
                                  })
                            ],
                          )),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Registered"),
                                content: new Text(
                                    "Lecture registered successfully!"),
                                actions: <Widget>[
                                  new TextButton(
                                    child: new Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        color: Color(0xff3D649F),
                        child: Text('Done'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[800]),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.menu_book_sharp,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        courseNames[index],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(doctorname[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.watch_later_outlined,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 3),
                                          Text(time[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(pre[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .28,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: Color(0xff3D649F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text('Register',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          )),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.add_circle_sharp,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                    itemCount: courseNames.length),
              ),
            ),
            SlidingUpPanel(
              controller: showCourse,
              maxHeight: MediaQuery.of(context).size.height * .3,
              minHeight: 0.0,
              borderRadius: BorderRadius.circular(20.0),
              panelBuilder: (panel) => Container(
                color: Colors.grey[500],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Color(0xff252525)),
                          width: 343,
                          child: Row(
                            children: [
                              Text('Sunday, 5PM, Lab A  '),
                              Checkbox(
                                  value: prerequisite,
                                  activeColor: Color(0xff333333),
                                  side: BorderSide(color: Color(0xff3D649F)),
                                  onChanged: (value) {
                                    setState(() {
                                      prerequisite = !prerequisite;
                                    });
                                  })
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Color(0xff252525)),
                          width: 343,
                          child: Row(
                            children: [
                              Text('Monday, 5PM, Lab A  '),
                              Checkbox(
                                  value: prerequisite,
                                  activeColor: Color(0xff333333),
                                  side: BorderSide(color: Color(0xff3D649F)),
                                  onChanged: (value) {
                                    setState(() {
                                      prerequisite = !prerequisite;
                                    });
                                  })
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Color(0xff252525)),
                          width: 343,
                          child: Row(
                            children: [
                              Text('Tuesday, 5PM, Lab A   '),
                              Checkbox(
                                  value: prerequisite,
                                  activeColor: Color(0xff333333),
                                  side: BorderSide(color: Color(0xff3D649F)),
                                  onChanged: (value) {
                                    setState(() {
                                      prerequisite = !prerequisite;
                                    });
                                  })
                            ],
                          )),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Registered"),
                                content: new Text(
                                    "Section registered successfully!"),
                                actions: <Widget>[
                                  new TextButton(
                                    child: new Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        color: Color(0xff3D649F),
                        child: Text('Done'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[800]),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    courseNames[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .28,
                                child: MaterialButton(
                                  onPressed: () {
                                    print("openPanel");
                                    (showCourse.isPanelClosed)
                                        ? showCourse.open()
                                        : showCourse.close();
                                  },
                                  color: Color(0xff3D649F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text('Register',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          )),
                                      SizedBox(width: 5),
                                      Icon(Icons.add_circle_sharp,
                                          size: 18, color: Colors.white),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                    itemCount: courseNames.length),
              ),
            ),
          ]),
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
    );
  }
}
