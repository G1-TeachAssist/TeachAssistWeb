import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/main_button_component.dart';
import 'package:teach_assist_web/components/page_title_panel_component.dart';
import 'package:teach_assist_web/components/sidebar_component.dart';
import 'package:teach_assist_web/controllers/grade_controller.dart';
import 'package:teach_assist_web/enums/aval_enum.dart';
import 'package:teach_assist_web/models/grade.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final SidebarXController _sidebarXController =
      SidebarXController(selectedIndex: 2, extended: true);

  late List<Grade> _grades;

  @override
  void initState() {
    super.initState();
    _grades = GradeController.instance.getGrades();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Teach Assist'),
      body: Row(
        children: [
          Sidebar(
            controller: _sidebarXController,
            currentPage: 'Dados',
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
                      title: 'Dados',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mainButton(
                      buttonColor: const Color(0xFF718093),
                      buttonText: '⬆︎ Importar Dados',
                      horizontalPadding: 15,
                      verticalPadding: 15,
                      fontSize: 18,
                      buttonFunction: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    mainButton(
                      buttonColor: const Color(0xFF718093),
                      buttonText: '⬇ Exportar Dados',
                      horizontalPadding: 15,
                      verticalPadding: 15,
                      fontSize: 18,
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
                              DataColumn(label: Text('Professor')),
                              DataColumn(label: Text('Disciplina')),
                              DataColumn(label: Text('Ano')),
                              DataColumn(label: Text('Turma')),
                              DataColumn(label: Text('Aluno')),
                              DataColumn(label: Text('Avaliação')),
                              DataColumn(label: Text('Nota')),
                            ],
                            rows: _grades.map((grade) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(grade.turma.teacher.name)),
                                  DataCell(Text(grade.turma.discipline.name)),
                                  DataCell(Text(grade.turma.startAt.year.toString())),
                                  DataCell(Text(grade.turma.id.toString())),
                                  DataCell(Text(grade.student.name)),
                                  DataCell(Text(grade.aval.displayName)),
                                  DataCell(Text(grade.grade.toStringAsFixed(1))),
                                ],
                              );
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
