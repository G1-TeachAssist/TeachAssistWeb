import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/page_title_panel_component.dart';
import 'package:teach_assist_web/components/sidebar_component.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                          rows: const [
                            DataRow(
                              cells: [
                                DataCell(Text('1')),
                                DataCell(Text('BIO01')),
                                DataCell(Text('Biologia')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text('2')),
                                DataCell(Text('MAT01')),
                                DataCell(Text('Matemática')),
                              ],
                            ),
                          ],
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
                          rows: const [
                            DataRow(
                              cells: [
                                DataCell(Text('1')),
                                DataCell(Text('John Lee')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text('2')),
                                DataCell(Text('Barbara Rodriguez')),
                              ],
                            ),
                          ],
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
                          rows: const [
                            DataRow(
                              cells: [
                                DataCell(Text('1')),
                                DataCell(Text('Olivia Alves')),
                                DataCell(Text('olivia.alves@email.com')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text('2')),
                                DataCell(Text('Denis Moreira')),
                                DataCell(Text('denis.moreira@email.com')),
                              ],
                            ),
                          ],
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
                          rows: const [
                            DataRow(
                              cells: [
                                DataCell(Text('2024001')),
                                DataCell(Text('Olivia Alves')),
                                DataCell(Text('Biologia')),
                                DataCell(Text('02/02/2024')),
                                DataCell(Text('Semestral')),
                                DataCell(Text('Em andamento')),
                                DataCell(Text('70.0')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text('2024001')),
                                DataCell(Text('Olivia Alves')),
                                DataCell(Text('Biologia')),
                                DataCell(Text('02/02/2024')),
                                DataCell(Text('Semestral')),
                                DataCell(Text('Em andamento')),
                                DataCell(Text('70.0')),
                              ],
                            ),
                          ],
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
