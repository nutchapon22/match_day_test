import 'package:flutter/material.dart';
import 'package:match_day_test/page/done_page.dart';
import 'package:match_day_test/page/inprogress_page.dart';
import 'package:match_day_test/page/todo_page.dart';

class TabMenuPage extends StatelessWidget {
  const TabMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('📃Todos List'),
          bottom: const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'ทั้งหมด'),
              Tab(text: 'กำลังดำเนินการ'),
              Tab(text: 'เสร็จแล้ว'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [TodoPage(), InprogressPage(), DonePage()],
        ),
      ),
    );
  }
}
