import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
          child: Center(
        child: SizedBox(
          height: context.percentHeight(.3),
          width: context.percentWidth(.3),
          child: Image.asset('assets/images/waiting.png'),
        ),
      )),
    );
  }
}
