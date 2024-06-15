import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/main_button_component.dart';
import 'package:teach_assist_web/components/page_title_panel_component.dart';
import 'package:teach_assist_web/components/sidebar_component.dart';
import 'package:teach_assist_web/controllers/class_controller.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/routes/personal_route.dart';
import 'package:teach_assist_web/views/class_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SidebarXController _sidebarXController =
      SidebarXController(selectedIndex: 0, extended: true);

  late List<Class> _classes;

  @override
  void initState() {
    super.initState();
    _classes = ClassController.instance.getClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Teach Assist'),
      body: Row(
        children: [
          Sidebar(
            controller: _sidebarXController,
            currentPage: 'Home',
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    titlePanel(
                      context: context,
                      title: 'Página Inicial',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          mainButton(
                            buttonText: 'Todos',
                            horizontalPadding: 20,
                            verticalPadding: 10,
                            buttonColor: const Color(0xFF44bd32),
                            buttonFunction: () {
                              setState(() {
                                _classes =
                                    ClassController.instance.getClasses();
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          mainButton(
                            buttonText: '2024',
                            horizontalPadding: 20,
                            verticalPadding: 10,
                            buttonColor: const Color(0xFF44bd32),
                            buttonFunction: () {
                              setState(() {
                                _classes = ClassController.instance
                                    .getClassesByYear(2024);
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          mainButton(
                            buttonText: '2025',
                            horizontalPadding: 20,
                            verticalPadding: 10,
                            buttonColor: const Color(0xFF44bd32),
                            buttonFunction: () {
                              setState(() {
                                _classes = ClassController.instance
                                    .getClassesByYear(2025);
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: _classes.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              NoAnimationPageRoute(
                                page: ClassPage(actualClass: _classes[index]),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(10.0),
                          hoverColor: const Color(0xFF487eb0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: const Color(0xFF7f8fa6),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Turma: ${_classes[index].id}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Disciplina: ${_classes[index].discipline.name}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Professor: ${_classes[index].teacher.name}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Nº alunos: ${_classes[index].students.length}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Status: ${_classes[index].status}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
