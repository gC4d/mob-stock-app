// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';

class UserButton extends StatelessWidget {
  final String user_name;
  const UserButton({
    Key? key,
    required this.user_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight(.06),
      width: context.percentWidth(.13),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(7)),
      child: const Center(
        child: Text(
          "G",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
