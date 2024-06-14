import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatelessWidget {
  final SidebarXController controller;
  final String currentPage;

  const Sidebar({
    super.key,
    required this.controller,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: controller,
      showToggleButton: false,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF2f3640),
          borderRadius: BorderRadius.circular(10),
        ),
        selectedTextStyle: const TextStyle(
          color: Colors.white,
        ),
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        hoverTextStyle: const TextStyle(
          color: Color(0xFF487eb0),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        hoverIconTheme: const IconThemeData(
          color: Color(0xFF487eb0),
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        itemTextPadding: const EdgeInsets.only(
          left: 20,
        ),
        selectedItemTextPadding: const EdgeInsets.only(
          left: 20,
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF718093),
            ),
          ],
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        margin: EdgeInsets.all(10),
      ),
      footerDivider: const Divider(
        height: 1,
      ),
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            if (currentPage != 'Home') {
              Navigator.of(context).pushNamed('/home');
            }
          },
        ),
        SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
          onTap: () {
            if (currentPage != 'Dashboard') {
              Navigator.of(context).pushNamed('/dashboard');
            }
          },
        ),
        SidebarXItem(
          icon: Icons.school_rounded,
          label: 'Dados',
          onTap: () {
            if (currentPage != 'Dados') {
              Navigator.of(context).pushNamed('/data');
            }
          },
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Configurações',
          onTap: () {
            if (currentPage != 'Configurações') {
              Navigator.of(context).pushNamed('/settings');
            }
          },
        )
      ],
    );
  }
}
