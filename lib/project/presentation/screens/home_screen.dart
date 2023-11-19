import 'package:any_load/project/presentation/components/file_list_component.dart';
import 'package:any_load/project/presentation/components/search_url_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnyLoad 🌪'),
      ),
      body: ListView(
        children: const [
          SearchUrlComponent(),
          FileListComponent(),
        ],
      ),
    );
  }
}
