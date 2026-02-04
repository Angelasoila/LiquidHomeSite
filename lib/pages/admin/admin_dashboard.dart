import 'package:flutter/material.dart';
import '../../widgets/admin_sidebar.dart';
import '../../widgets/admin_topbar.dart';
import 'Dashboard/dashboard_cards.dart';
import 'Dashboard/installations_table.dart';
class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          const AdminSidebar(),
          Expanded(
            child: Column(
              children: [
                const AdminTopBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          DashboardCards(),
                          InstallationsTable(),
                        ],
                      ),
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
