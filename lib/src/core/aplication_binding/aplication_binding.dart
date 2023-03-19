import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/services/client/rest_client.dart';
import 'package:provider/provider.dart';

class AplicationBinding extends StatelessWidget {
  final Widget child;
  const AplicationBinding({ Key? key, required this.child }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MultiProvider(
      providers: [
        Provider(create: (context) => RestClient())
      ],
      child: child,
    );
  }
}