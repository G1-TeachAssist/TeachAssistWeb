import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/main_button_component.dart';
import 'package:teach_assist_web/components/page_title_panel_component.dart';
import 'package:teach_assist_web/components/sidebar_component.dart';
import 'package:teach_assist_web/controllers/class_controller.dart';
import 'package:teach_assist_web/controllers/discipline_controller.dart';
import 'package:teach_assist_web/controllers/student_controller.dart';
import 'package:teach_assist_web/controllers/teacher_controller.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/models/discipline.dart';
import 'package:teach_assist_web/models/student.dart';
import 'package:teach_assist_web/models/teacher.dart';
import 'package:teach_assist_web/utils/services.dart';
import 'package:teach_assist_web/views/forms/class_form_view.dart';
import 'package:teach_assist_web/views/forms/discipline_form_view.dart';
import 'package:teach_assist_web/views/forms/student_form_view.dart';
import 'package:teach_assist_web/views/forms/teacher_form_view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  final SidebarXController _sidebarXController =
      SidebarXController(selectedIndex: 3, extended: true);

  late TabController _tabController;
  late List<Discipline> _disciplines;
  late List<Teacher> _teachers;
  late List<Student> _students;
  late List<Class> _classes;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _disciplines = DisciplineController.instance.getDisciplines();
    _teachers = TeacherController.instance.getTeachers();
    _students = StudentController.instance.getStudents();
    _classes = ClassController.instance.getClasses();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateDisciplines() {
    setState(() {
      _disciplines = DisciplineController.instance.getDisciplines();
    });
  }

  void _updateTeachers() {
    setState(() {
      _teachers = TeacherController.instance.getTeachers();
    });
  }

  void _updateStudents(){
    setState(() {
      _students = StudentController.instance.getStudents();
    });
  }

  void _updateClasses(){
    setState(() {
      _classes = ClassController.instance.getClasses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Teach Assist'),
      body: Row(
        children: [
          Sidebar(
            controller: _sidebarXController,
            currentPage: 'Configurações',
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
                      title: 'Configurações',
                    ),
                  ],
                ),
                Row(
                  children: [
                    TabBar(
                      controller: _tabController,
                      padding: const EdgeInsets.only(top: 15),
                      tabs: const [
                        Tab(text: 'Disciplina'),
                        Tab(text: 'Aluno'),
                        Tab(text: 'Professor'),
                        Tab(text: 'Turma'),
                      ],
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    mainButton(
                      buttonColor: const Color(0xFF44bd32),
                      buttonText: '+ Adicionar',
                      horizontalPadding: 15,
                      verticalPadding: 15,
                      buttonFunction: () {
                        switch (_tabController.index) {
                          case 0:
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FormDisciplineDialog(
                                  onFormSubmit: _updateDisciplines,
                                );
                              },
                            );
                          case 1:
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FormStudentDialog(
                                  onFormSubmit: _updateStudents,
                                );
                              },
                            );
                          case 2:
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FormTeacherDialog(
                                  onFormSubmit: _updateTeachers,
                                );
                              },
                            );
                          case 3:
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FormClassDialog(
                                  onFormSubmit: _updateClasses,
                                );
                              },
                            );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    mainButton(
                      buttonColor: const Color(0xFFe84118),
                      buttonText: '- Remover',
                      horizontalPadding: 15,
                      verticalPadding: 15,
                      buttonFunction: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          headingRowColor:
                              const MaterialStatePropertyAll<Color>(
                            Color(0xFFdcdde1),
                          ),
                          columns: const [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Código')),
                            DataColumn(label: Text('Nome'))
                          ],
                          rows: _disciplines.map((discipline) {
                            return DataRow(cells: [
                              DataCell(Text(discipline.id.toString())),
                              DataCell(Text(discipline.code)),
                              DataCell(Text(discipline.name)),
                            ]);
                          }).toList(),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          headingRowColor:
                              const MaterialStatePropertyAll<Color>(
                            Color(0xFFdcdde1),
                          ),
                          columns: const [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Nome'))
                          ],
                          rows: _students.map((student) {
                            return DataRow(cells: [
                              DataCell(Text(student.id.toString())),
                              DataCell(Text(student.name)),
                            ]);
                          }).toList(),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          headingRowColor:
                              const MaterialStatePropertyAll<Color>(
                            Color(0xFFdcdde1),
                          ),
                          columns: const [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Nome')),
                            DataColumn(label: Text('E-mail'))
                          ],
                          rows: _teachers.map((teacher) {
                            return DataRow(cells: [
                              DataCell(Text(teacher.id.toString())),
                              DataCell(Text(teacher.name)),
                              DataCell(Text(teacher.email)),
                            ]);
                          }).toList(),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          headingRowColor:
                              const MaterialStatePropertyAll<Color>(
                            Color(0xFFdcdde1),
                          ),
                          columns: const [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Professor')),
                            DataColumn(label: Text('Disciplina')),
                            DataColumn(label: Text('Início em')),
                            DataColumn(label: Text('Tipo')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Média Final Mínima'))
                          ],
                          rows: _classes.map((classe){
                            return DataRow(cells: [
                              DataCell(Text(classe.id.toString())),
                              DataCell(Text(classe.teacher.name)),
                              DataCell(Text(classe.discipline.name)),
                              DataCell(Text(Services.instance.convertDateToString(classe.startAt))),
                              DataCell(Text(classe.type)),
                              DataCell(Text(classe.status)),
                              DataCell(Text(classe.minFinalMedia.toStringAsFixed(1))),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ],
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
