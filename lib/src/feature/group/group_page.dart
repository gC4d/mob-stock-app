import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_storage_app/src/core/ui/helpers/size_helper.dart';
import 'package:mob_storage_app/src/feature/group/group_controller.dart';
import 'package:mob_storage_app/src/feature/group/widgets/Bottom_Add_Or_Acess_Groups.dart';
import 'package:mob_storage_app/src/feature/group/widgets/groups_app_bar.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/helpers/text_styles_helper.dart';
import 'group_state.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends BaseState<GroupPage, GroupController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupController, GroupState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              success: () => hideLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? "Erro não informado");
              });
        },
        buildWhen: (previous, current) => current.status.matchAny(
              any: () => false,
              initial: () => false,
              success: () => true,
            ),
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 40, 8, 10),
                    child: GroupAppBar(userName: 'Guilherme'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                              alignment: Alignment.center,
                              height: context.screenheight,
                              width: context.percentWidth(.8),
                              child: state.groups.isEmpty
                                  ? Text("Nenhum grupo encontrado", style: TextStyles.i.textRegular.copyWith(fontSize: 15),)
                                  : ListView.builder(
                                      itemCount: state.groups.length,
                                      itemBuilder: (context, index) {
                                        final group = state.groups[index];
                                        return SizedBox(
                                          child: Text(group.descripton),
                                        );
                                      },
                                    )),
                        ),
                      ],
                    ),
                  ),
                  const BottomAddOrAcessGroups()
                ],
              ),
            ),
          );
        });
  }
}
