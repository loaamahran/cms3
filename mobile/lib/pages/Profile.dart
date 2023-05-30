import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const ListTile(
            leading: Icon(Icons.arrow_back),
            trailing: Icon(Icons.menu),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 65,
                  backgroundImage: AssetImage(""),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yassin Mohamed Awed',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Student',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("a"),
                    ),
                    Text(
                      '88/132',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Total Hours'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("a"),
                    ),
                    Text(
                      '3.6',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('CGPA'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("a"),
                    ),
                    Text(
                      'Fourth',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Level'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Accounts',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Card(
                      child: const ListTile(
                        title: Text(
                          'Personal Information',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'General',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Card(
                      child: const ListTile(
                        title: Text(
                          'About Us',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ),
                    Card(
                      child: const ListTile(
                        title: Text(
                          'Help and Support',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ),
                    Card(
                      child: const ListTile(
                        title: Text(
                          'Logout',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}