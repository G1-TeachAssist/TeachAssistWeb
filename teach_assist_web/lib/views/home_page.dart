import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/page_title_panel_component.dart';
import 'package:teach_assist_web/components/sidebar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SidebarXController _sidebarXController =
      SidebarXController(selectedIndex: 0, extended: true);

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
            flex: 10,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
