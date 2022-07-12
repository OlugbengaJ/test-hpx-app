import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/tutorial_provider/tutorial_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/utils/os_file_utility.dart';
import 'package:hpx/widgets/components/dropdown.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final _modeProvider = ModeProvider();

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);
    TooltipTutorialProvider tutorialProvider =
        Provider.of<TooltipTutorialProvider>(context, listen: false);
    tutorialProvider.showTutorial = true;
    tutorialProvider.direction = AxisDirection.down;

    workspaceProvider
        .initProfile(_modeProvider.getPickerModes('profile').first);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: 123,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: Svg(
                        'assets/images/zlight_logo.svg',
                      ),
                      fit: BoxFit.fill),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                OSFileUtility.appsDir;
                OSFileUtility.path;
                OSFileUtility.osApps();
                OSFileUtility.filePicker();
              },
              child: const Text('Click me'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 23, right: 10),
              child: Text(
                "Selected Profile",
                textAlign: TextAlign.left,
                style: h5Style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 50),
              child: tutorialProvider.generateTooltipTutorial(
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  // width: 150,
                  child: DropDown<PickerModel>(
                    hint: 'Select profile...',
                    hintStyle: pStyle,
                    dropdownValue: workspaceProvider.getProfile,
                    isExpanded: false,
                    items: [
                      ..._modeProvider.getPickerModes('profile').map(
                            (e) => DropdownMenuItem(
                              enabled: e.enabled,
                              value: e,
                              child: GetProfileList(profile: e),
                            ),
                          )
                    ],
                    onChangedHandler: (o) => workspaceProvider.setProfile(o),
                  ),

                  //  PickerDropdown(
                  //   onChange: (PickerModel? returnValue) {},
                  //   pickerList: _modeProvider.getPickerModes('profile'),
                  //   defaultPicker: profileList.first,
                  // ),
                ),
                'Selected Profile',
                'You can presave a lot of customizations as profiles for later use',
                'Close',
                'Next',
                100,
              ),
            ),
            WindowTitleBarBox(
              child: Row(
                children: const [WindowButtons()],
              ),
            )
          ],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 60,
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                padding: const EdgeInsets.only(bottom: 50.0),
                color: const Color.fromRGBO(18, 18, 18, 1),
                child: tutorialProvider.generateTooltipTutorial(
                    const IconButton(
                      iconSize: 40,
                      color: Colors.white,
                      icon: Icon(Ionicons.help_circle_outline),
                      onPressed: null,
                    ),
                    'Help Option',
                    'Use the help otion to settle all your concerns about the Z Light space app. You can also speak to a live agent to onblock you',
                    'Close',
                    'Finish',
                    115),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                AppBar(
                  bottomOpacity: 0.0,
                  elevation: 0.0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      tutorialProvider.generateTooltipTutorial(
                          TextButton(
                            style: TextButton.styleFrom(
                                fixedSize: const Size(150, 50),
                                primary: workspaceProvider.isWorkspaceView
                                    ? Colors.white
                                    : Colors.grey,
                                backgroundColor: Colors.transparent,
                                textStyle: h5Style),
                            child: const Text('Workspace'),
                            onPressed: () {
                              workspaceProvider
                                  .toggleView(WorkspaceView.workspace);
                            },
                          ),
                          'Workspace',
                          'The workspace we allow you move your device around for later customization',
                          'No Thanks',
                          'Let`s Go',
                          100.0),
                      tutorialProvider.generateTooltipTutorial(
                          TextButton(
                            style: TextButton.styleFrom(
                                fixedSize: const Size(150, 50),
                                primary: workspaceProvider.isLightingView
                                    ? Colors.white
                                    : Colors.grey,
                                backgroundColor: Colors.transparent,
                                textStyle: h5Style),
                            child: const Text('Lighting Options'),
                            onPressed: () {
                              workspaceProvider
                                  .toggleView(WorkspaceView.lighting);
                            },
                          ),
                          'Take a quick tour of your Z Light space application',
                          'See how to customize your physical keyboard using the Z Light space app based on your mood, preferences and more',
                          'Close',
                          'Next',
                          130.0),
                    ],
                  ),
                ),
                const Wrapper(),
              ],
            ))
          ],
        ));
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
        CloseWindowButton()
      ],
    );
  }
}
