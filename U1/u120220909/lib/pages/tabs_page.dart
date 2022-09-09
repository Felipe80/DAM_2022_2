import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u120220909/pages/tabs/tab1_page.dart';
import 'package:u120220909/pages/tabs/tab2_page.dart';
import 'package:u120220909/pages/tabs/tab3_page.dart';
import 'package:u120220909/pages/tabs/tab4_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs'),
            backgroundColor: Color(0xFF524C85),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Página 1',
                  icon: Icon(MdiIcons.earth),
                ),
                Tab(
                  text: 'Página 2',
                  icon: Icon(MdiIcons.rocketLaunch),
                ),
                Tab(
                  text: 'Página 3',
                  icon: Icon(MdiIcons.ufoOutline),
                ),
                Tab(
                  icon: Icon(MdiIcons.alienOutline),
                  text: 'Página 4',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab1Page(),
              Tab2Page(),
              Tab3Page(),
              Tab4Page(),
            ],
          ),
        ),
      ),
    );
  }
}
