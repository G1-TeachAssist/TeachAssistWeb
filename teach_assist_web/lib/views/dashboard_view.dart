import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/sidebar_component.dart';
import 'package:teach_assist_web/constants/app_constants.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final SidebarXController _sidebarXController =
      SidebarXController(selectedIndex: 1, extended: true);

  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(appConstants['dashboardUrl']),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Teach Assist'),
      body: Row(
        children: [
          Sidebar(
            controller: _sidebarXController,
            currentPage: 'Dashboard',
          ),
          Flexible(
            child: PlatformWebViewWidget(
              PlatformWebViewWidgetCreationParams(
                controller: _controller,
              ),
            ).build(context),
          ),
        ],
      ),
    );
  }
}
