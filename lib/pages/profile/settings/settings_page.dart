
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_platform/common/routes/names.dart';
import 'package:learning_platform/common/values/colors.dart';
import 'package:learning_platform/common/values/constants.dart';
import 'package:learning_platform/global.dart';
import 'package:learning_platform/pages/application/bloc/app_blocs.dart';
import 'package:learning_platform/pages/application/bloc/app_events.dart';
import 'package:learning_platform/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_platform/pages/home/bloc/home_page_events.dart';
import 'package:learning_platform/pages/profile/settings/blocs/settings_bloc.dart';
import 'package:learning_platform/pages/profile/settings/blocs/settings_state.dart';
import 'package:learning_platform/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeuserdata() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.Sign_in, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsbutton(context, removeuserdata)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
