import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/tutorial_provider/tutorial_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
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
    final tutorialProvider = Provider.of<TooltipTutorialProvider>(context);
    // tutorialProvider.showTutorial = true;
    tutorialProvider.showTutorialTooltip();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
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
            Container(
              margin: const EdgeInsets.only(top: 23, right: 10),
              child: Text(
                "Selected Profile",
                textAlign: TextAlign.left,
                style: h5Style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0, right: 10),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                width: 250,
                child: PickerDropdown(
                  onChange: (PickerModel? returnValue) {
                    // if (modeProvider.currentMode.value == EnumModes.shortcut &&
                    //     returnValue?.value != EnumModes.shortcut) {
                    //   shortcutAlertDialogOnChangeMode(returnValue!);
                    // } else {
                    //   setState(() {
                    //     modeProvider.changeModeComponent(
                    //         returnValue, context, false,
                    //         changeComp: true);
                    //   });
                    // }
                  },
                  pickerHintText: "Picker a tool or effect mode ....",
                  pickerList: _modeProvider.getPickerModes('profile'),
                  defaultPicker: profileList.first,
                ),
              ),
            ),
            // WindowButton(iconBuilder: iconBuilder)
          ],
        ),
        body: Row(
          children: [
            SizedBox(
              width: 60,
              child: Container(
                color: const Color.fromRGBO(18, 18, 18, 1),
                // child: Positioned(child: Container())
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
