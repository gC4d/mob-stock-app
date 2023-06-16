import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          textAlign: TextAlign.justify,
          textAlignVertical: TextAlignVertical.center,
          onChanged: (value) {},
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.background.withOpacity(.5),
            filled: true,
            focusColor: Theme.of(context).colorScheme.primaryContainer,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
