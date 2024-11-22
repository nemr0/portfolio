import 'package:flutter/material.dart';
import 'package:portfolio_admin/presentation/root_screen/tabs/projects/projects_tab.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with SingleTickerProviderStateMixin{
  late TabController controller;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Projects'),
  ];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
     super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Admin'),
        bottom: TabBar(
          controller: controller,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [ProjectsTab()]
      ),
    );
  }
}
