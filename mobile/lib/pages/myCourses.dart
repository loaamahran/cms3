// ignore_for_file: use_build_context_synchronously

import 'package:cms_final/components/components.dart';
import 'package:cms_final/data/models/course.dart';
import 'package:cms_final/data/state/providers/repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCourses extends ConsumerWidget {
  const MyCourses({super.key});

  Future<bool> deleteCourse(WidgetRef ref, Course course) async {
    return await ref.read(repositoryProvider).deleteCourse(course);
  }

  void addCourse(WidgetRef ref, Course course) {
    ref.read(repositoryProvider).registerCourse(course);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white70),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Courses',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    subTitleText(text: "Deadline for deletion"),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 8.0),
                        subTitleText(text: "${DateTime.now().year}")
                      ],
                    )
                  ],
                ),
                const SizedBox(width: 15.0),
                const Icon(Icons.timer, size: 40)
              ],
            ),
            const SizedBox(height: 20),
            FutureBuilder<List<Course?>>(
              future: ref.watch(repositoryProvider).getCourses(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final courses = snapshot.requireData;
                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                                      const Icon(Icons.menu_book_outlined),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          titleText(
                                            text: courses[index]!.name,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.person),
                                              paragraphText(text: "Name")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.timer),
                                              paragraphText(
                                                  text:
                                                      "${courses[index]!.creditHours} hours")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  button(
                                      borderRadius: 10,
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      isSmallButton: true,
                                      text: "Remove",
                                      function: () async {
                                        if (await deleteCourse(
                                            ref, courses[index]!)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text("Deleted Successfully"),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text("Can't Delete"),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      })
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: courses.length);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
