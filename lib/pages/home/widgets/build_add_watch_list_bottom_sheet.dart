import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket_assignment/blocs/add_watch_list/add_watch_list_bloc.dart';
import 'package:websocket_assignment/resources/fonts_manager.dart';
import 'package:websocket_assignment/resources/strings_manager.dart';
import 'package:websocket_assignment/resources/values_manager.dart';
import 'package:websocket_assignment/utils/validations_mixin.dart';
import 'package:websocket_assignment/widgets/buttons/build_close_button.dart';
import 'package:websocket_assignment/widgets/buttons/build_custom_outlined_button.dart';
import 'package:websocket_assignment/widgets/text_form_field.dart';

class BuildAddWatchListBottomSheet extends StatefulWidget {
  const BuildAddWatchListBottomSheet({super.key});

  @override
  State<BuildAddWatchListBottomSheet> createState() =>
      _BuildAddWatchListBottomSheetState();
}

class _BuildAddWatchListBottomSheetState
    extends State<BuildAddWatchListBottomSheet> with ValidationsMixin {
  late final TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.addNewWatchlist,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                BuildCloseButton(
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: AppHeight.h20),
            Form(
              key: _formKey,
              child: BuildCustomTextFormField(
                textEditingController: controller,
                labelText: AppStrings.enterName,
                validator: validateWatchlistName,
              ),
            ),
            SizedBox(height: AppHeight.h30),
            BuildCustomOutlinedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AddWatchListBloc>().add(
                        AddNewWatchListEvent(
                          title: controller.text.trim(),
                        ),
                      );
                  Navigator.of(context).pop();
                  controller.clear();
                }
              },
              text: AppStrings.add,
            ),
            SizedBox(height: AppHeight.h30),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom + AppHeight.h10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
