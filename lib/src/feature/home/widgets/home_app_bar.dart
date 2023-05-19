import 'package:flutter/material.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/core/ui/helpers/text_styles_helper.dart';

import '../../../core/ui/widgets/search_text_field.dart';
import 'user_button.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;
  const HomeAppBar({ super.key, required this.userName });

   @override
   Widget build(BuildContext context) {
       return SizedBox(
                  height: context.percentHeight(.3),
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: context.percentHeight(.06),
                              width: context.percentWidth(.13),
                              child: IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(
                                  Icons.notes_rounded,
                                  size: 40,
                                ),
                              ),
                            ),
                            UserButton(user_name: userName.characters.first)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 15, 0),
                        child: Text(
                          'Olá, $userName',
                          style: context.textStyles.textBold
                              .copyWith(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                        child: Text(
                          'Meus estoques',
                          style: context.textStyles.textRegular
                              .copyWith(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Center(
                          child: SizedBox(
                            height: context.percentHeight(.05),
                            width: context.percentWidth(.85),
                            child: const SearchTextField(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                        child: Divider(
                          height: 20,
                          color: Theme.of(context).colorScheme.outline
                        ),
                      )
                    ],
                  ),
                );
  }
}