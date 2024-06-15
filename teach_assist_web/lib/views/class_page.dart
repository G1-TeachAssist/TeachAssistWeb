import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/main_button_component.dart';
import 'package:teach_assist_web/components/page_title_panel_component.dart';
import 'package:teach_assist_web/components/sidebar_component.dart';
import 'package:teach_assist_web/controllers/class_controller.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/views/forms/grade_form_view.dart';
import 'package:teach_assist_web/views/forms/student_class_form_view.dart';

class ClassPage extends StatefulWidget {
  final Class actualClass;

  const ClassPage({super.key, required this.actualClass});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final SidebarXController _sidebarXController =
      SidebarXController(selectedIndex: 0, extended: true);

  void _updateClass() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Teach Assist'),
      body: Row(
        children: [
          Sidebar(
            controller: _sidebarXController,
            currentPage: 'Turma',
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
                        title: 'Turma: ${widget.actualClass.id}',
                        subtitle:
                            'Professor: ${widget.actualClass.teacher.name} | Disciplina: ${widget.actualClass.discipline.name} | Tipo: ${widget.actualClass.type} | Status: ${widget.actualClass.status} | Total de Alunos: ${widget.actualClass.students.length}'),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    mainButton(
                      buttonColor: const Color(0xFF44bd32),
                      buttonText: '+ Adicionar Aluno',
                      horizontalPadding: 15,
                      verticalPadding: 15,
                      buttonFunction: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FormStudentClassDialog(
                              onFormSubmit: _updateClass,
                              actualClass: widget.actualClass,
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    mainButton(
                      buttonColor: const Color(0xFFe84118),
                      buttonText: '- Remover Aluno',
                      horizontalPadding: 15,
                      verticalPadding: 15,
                      buttonFunction: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: constraints.maxWidth),
                          child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            headingRowColor:
                                const MaterialStatePropertyAll<Color>(
                              Color(0xFFdcdde1),
                            ),
                            columns: const [
                              DataColumn(label: Text('ID Aluno')),
                              DataColumn(label: Text('Nome do Aluno')),
                              DataColumn(label: Text('Notas')),
                              DataColumn(label: Text('Ações')),
                            ],
                            rows: widget.actualClass.students.map((student) {
                              return DataRow(cells: [
                                DataCell(Text(student.id.toString())),
                                DataCell(Text(student.name)),
                                DataCell(Text(ClassController.instance.getGradesFromStudent(widget.actualClass, student))),
                                DataCell(
                                  mainButton(
                                    buttonText: '+ Nota',
                                    buttonColor: const Color(0xFF44bd32),
                                    verticalPadding: 10,
                                    horizontalPadding: 10,
                                    fontSize: 15,
                                    buttonFunction: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FormGradeClassDialog(
                                            onFormSubmit: _updateClass,
                                            actualClass: widget.actualClass,
                                            student: student,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ]);
                            }).toList(),
                          ),
                        ),
                      );
                    },
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
