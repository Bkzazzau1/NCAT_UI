import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../models/demo_models.dart';
import '../screens/ai_academic_assistant_page.dart';
import '../screens/ai_handbook_page.dart';
import '../screens/ai_logbook_studio_page.dart';
import '../screens/command_centre_page.dart';
import '../screens/document_vault_page.dart';
import '../screens/flight_history_page.dart';
import '../screens/infrastructure_page.dart';
import '../screens/login_page.dart';
import '../screens/missing_file_page.dart';
import '../screens/report_generator_page.dart';
import '../screens/student_ai_app_page.dart';
import '../screens/student_profile_page.dart';
import '../screens/student_service_desk_page.dart';
import '../screens/workflow_approval_page.dart';
import 'side_nav.dart';
import 'top_bar.dart';

class ResponsiveShell extends StatefulWidget {
  const ResponsiveShell({super.key});

  @override
  State<ResponsiveShell> createState() => _ResponsiveShellState();
}

class _ResponsiveShellState extends State<ResponsiveShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  final _items = const <NavItem>[
    NavItem(title: 'Login & Roles', icon: Icons.login_rounded),
    NavItem(
        title: 'AI Command Centre', icon: Icons.dashboard_customize_rounded),
    NavItem(title: 'Student AI Summary', icon: Icons.badge_rounded),
    NavItem(title: 'Missing File Intelligence', icon: Icons.folder_off_rounded),
    NavItem(title: 'Digital Document Vault', icon: Icons.inventory_2_rounded),
    NavItem(title: 'Workflow & Approvals', icon: Icons.account_tree_rounded),
    NavItem(title: 'Flight History Intelligence', icon: Icons.flight_rounded),
    NavItem(title: 'AI Infrastructure', icon: Icons.hub_rounded),
    NavItem(title: 'AI Student Management', icon: Icons.psychology_alt_rounded),
    NavItem(title: 'AI Student Service Desk', icon: Icons.support_agent_rounded),
    NavItem(title: 'AI Handbook Knowledge Base', icon: Icons.menu_book_rounded),
    NavItem(title: 'AI Academic Assistant', icon: Icons.school_rounded),
    NavItem(title: 'AI Logbook Studio', icon: Icons.edit_note_rounded),
    NavItem(title: 'AI Report Generator', icon: Icons.summarize_rounded),
  ];

  List<Widget> get _pages => <Widget>[
        LoginPage(onContinue: () => setState(() => _selectedIndex = 1)),
        const CommandCentrePage(),
        const StudentProfilePage(),
        const MissingFilePage(),
        const DocumentVaultPage(),
        const WorkflowApprovalPage(),
        const FlightHistoryPage(),
        const InfrastructurePage(),
        const StudentAIAppPage(),
        const StudentServiceDeskPage(),
        const AIHandbookPage(),
        const AIAcademicAssistantPage(),
        const AILogbookStudioPage(),
        const ReportGeneratorPage(),
      ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width >= 900;
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.2,
          colors: [Color(0xFF123E68), NCATTheme.navy],
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: isDesktop
            ? null
            : Drawer(
                backgroundColor: NCATTheme.navy,
                child: SafeArea(
                  child: SideNav(
                    items: _items,
                    selectedIndex: _selectedIndex,
                    onSelected: (index) {
                      setState(() => _selectedIndex = index);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
        body: SafeArea(
          child: Row(
            children: [
              if (isDesktop)
                SideNav(
                  items: _items,
                  selectedIndex: _selectedIndex,
                  onSelected: (index) => setState(() => _selectedIndex = index),
                ),
              Expanded(
                child: Column(
                  children: [
                    TopBar(
                      title: _items[_selectedIndex].title,
                      onMenu: () => _scaffoldKey.currentState?.openDrawer(),
                    ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 220),
                        child: KeyedSubtree(
                          key: ValueKey(_selectedIndex),
                          child: _pages[_selectedIndex],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
