import 'package:cms_final/components/components.dart';
import 'package:cms_final/data/models/semester.dart';
import 'package:cms_final/data/state/providers/repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Semesters extends ConsumerStatefulWidget {
  const Semesters({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SemestersState();
}

class _SemestersState extends ConsumerState<Semesters> {
  List<Semester> semesters = [];

  bool isCGPA = false;
  bool iconChange = false;
  int panelIndex = 0;
  ScrollController semester1 = ScrollController();
  PanelController panelController = PanelController();

  @override
  void initState() {
    super.initState();
    getSemesters();
  }

  void getSemesters() async {
    semesters = await ref.read(repositoryProvider).getAllSemesters();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return semesters.isEmpty
        ? Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SafeArea(
            child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff0b0b0b),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white70),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'Semesters',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: SlidingUpPanel(
              onPanelClosed: () {
                print(isCGPA);
                isCGPA = false;
              },
              minHeight: 0.0,
              controller: panelController,
              defaultPanelState: PanelState.CLOSED,
              body: Container(
                padding: const EdgeInsets.all(20),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black38, Colors.black38])),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.separated(
                          // controller: ,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                iconChange = !iconChange;
                                panelIndex = index;
                                (panelController.isPanelOpen)
                                    ? panelController.close()
                                    : panelController.open();
                              });
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: const Color(0xff252525)),
                                child: Row(
                                  children: [
                                    Text(
                                      semesters[index].name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const Spacer(),
                                    Icon(
                                        (iconChange)
                                            ? Icons.keyboard_arrow_down
                                            : Icons.chevron_right,
                                        color: Colors.white),
                                  ],
                                )),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: semesters.length,
                        ),
                        const SizedBox(height: 20),
                        cGPAButton()
                      ]),
                ),
              ),
              color: Colors.transparent,
              panelBuilder: (scrollController) => Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  color: Colors.grey[700],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                        (isCGPA) ? buildSlidingPanel(1) : buildSlidingPanel(0)),
              ),
            ),
          ));
  }

  Widget buildSlidingPanel(int index) {
    List<Widget> panel = [
      //semester panel
      SingleChildScrollView(
        child: Column(
          children: [
            //front grey line
            Container(
              width: MediaQuery.of(context).size.width * .3,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
            ),
            const SizedBox(height: 20),
            //semester title
            subTitleText(text: semesters[panelIndex].name),
            const SizedBox(height: 20),
            //table titles
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[800]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    subTitleText(text: "#"),
                    subTitleText(text: "Courses"),
                    subTitleText(text: "Grades"),
                    subTitleText(text: "Credits"),
                  ],
                ),
              ),
            ),
            //table content
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        paragraphText(
                          text: semesters[panelIndex].courses[i].code ?? "",
                        ),
                        const Spacer(),
                        paragraphText(
                          text: semesters[panelIndex].courses[i].name,
                        ),
                        const Spacer(),
                        paragraphText(
                          text: semesters[panelIndex].courses[i].grade +
                              (semesters[panelIndex].courses[i].grade.length ==
                                      1
                                  ? " "
                                  : ""),
                        ),
                        const SizedBox(width: 10),
                        paragraphText(
                          text: semesters[panelIndex]
                              .courses[i]
                              .creditHours
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (_, i) => const SizedBox(height: 5),
              itemCount: semesters[panelIndex].courses.length,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      //cgpa panel
      SingleChildScrollView(
        child: Column(
          children: [
            //front grey line
            Container(
              width: MediaQuery.of(context).size.width * .3,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
            ),
            const SizedBox(height: 20),
            //semester title
            subTitleText(text: "CGPA"),
            const SizedBox(height: 20),
            //table titles
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[800]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    subTitleText(text: "Semesters"),
                    subTitleText(text: "Grades"),
                    subTitleText(text: "GPA"),
                    subTitleText(text: "Credits"),
                  ],
                ),
              ),
            ),
            //table content
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      paragraphText(
                        text: semesters[i].name,
                      ),
                      paragraphText(
                        text: semesters[i].grade,
                      ),
                      paragraphText(
                        text: semesters[i].gpa.toString(),
                      ),
                      paragraphText(
                        text: semesters[i]
                            .courses
                            .fold(0, (a, b) => a + b.creditHours)
                            .toString(),
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (_, i) => const SizedBox(height: 5),
              itemCount: semesters.length,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ];
    return panel[index];
  }

  String getGrade(double gpa) {
    if (gpa >= 4.0) {
      return "A";
    } else if (gpa >= 3.7) {
      return "A-";
    } else if (gpa >= 3.3) {
      return "B+";
    } else if (gpa >= 3.0) {
      return "B";
    } else if (gpa >= 2.7) {
      return "B-";
    } else if (gpa >= 2.3) {
      return "C+";
    } else if (gpa >= 2.0) {
      return "C";
    } else if (gpa >= 1.7) {
      return "C-";
    } else if (gpa >= 1.3) {
      return "D+";
    } else if (gpa >= 1.0) {
      return "D";
    } else {
      return "F";
    }
  }

//save button
  Widget cGPAButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCGPA = true;
        });
        print(isCGPA);
        (panelController.isPanelOpen)
            ? panelController.close()
            : panelController.open();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Clicked')));
      },
      child: Container(
        height: 70,
        width: 170,
        margin: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Color(0xff3d649f)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/img1.png',
              height: 48,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Cgpa',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
