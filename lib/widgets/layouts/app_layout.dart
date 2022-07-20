import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/profile/profile_dropdown.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/contact_support_provider.dart';
import 'package:hpx/providers/tutorial_provider/tutorial_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final modeProvider = ModeProvider();
  int step = 0;
  List<String> walkthroughTitle = [
    "Workspace & Lightning option tabs",
    "Profiles",
    "Layers",
    "Tools & Effect Panel",
    "Learn more by using the help icon"
  ];
  List<String> walkthroughDesc = [
    'Workspace: Use this tab to rearrange your supported devices to match the layout of your physical workspace Lightning Options: Use this tab to create pprofiles and layers , select devices zones, and apply lighting tools and effects',
    "Use profiles to assign, edit and save the lighting configuration to be displayed when you open the application. When you don’t have an application profile, the default (All Application) profile will be applied to your hardware",
    "Create new layers or select an existing layers to edit the lighting configuration. You can reorder layers, which will determine the visibility of the configured lighting tools or effect",
    "Selecting a lighting tool or effect from the dropdown menu to apply to your hardware. Use Mood to create an ambience, Short Colors to color-code your application shortcuts, or production to create a more color-accurate workspace.",
    "Select the “Help” icon in the Navigation Menu to view this tutorial again, or visit our support website to learn more about Z Light Space’s feature"
  ];

  walkthroughTutorialWidget() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: const Color(0xff121212),
          contentPadding: const EdgeInsets.all(0),
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1)),
              width: 900,
              height: 500,
              child: Column(
                children: [
                  Text(
                    walkthroughTitle[step],
                    style: h1Style,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Text(
                      walkthroughDesc[step],
                      style: const TextStyle(
                          fontSize: 14, height: 1.5, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 600,
                    height: 250,
                    margin: const EdgeInsets.only(top: 40, bottom: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(Constants.walkthroughImagePng).image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    step -= 1;
                                  });
                                  Navigator.of(context).pop();
                                  if (step < 0) {
                                    generateDialogTutorial();
                                  }
                                  if (step >= 0) {
                                    walkthroughTutorialWidget();
                                  }
                                },
                                style: textBtnStyleWhite,
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Previous'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    step += 1;
                                  });
                                  Navigator.of(context).pop();
                                  if (step < 5) {
                                    walkthroughTutorialWidget();
                                  }
                                },
                                style: textBtnStyleWhite,
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Next'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: textBtnStyleBlack,
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Skip Tutorial'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  generateDialogTutorial() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: const Color(0xff121212),
          contentPadding: const EdgeInsets.all(0),
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
              ),
              width: 900,
              height: 500,
              child: Column(
                children: [
                  Text(
                    'Welcome to Z Light Space',
                    style: h1Style,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                  ),
                  Text(
                    'Personalize your workspace lighting to enhance your creative workflow',
                    style: pStyle,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.only(top: 70, bottom: 10),
                    child: Image.asset(
                      Constants.zLightIconPng,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    step = 0;
                                  });
                                  Navigator.of(context).pop();
                                  walkthroughTutorialWidget();
                                },
                                style: textBtnStyleWhite,
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Lets Go'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: textBtnStyleBlack,
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Skip Tutorial'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // this function creates the dialog width for the help icons
  void openDialogOption() {
    final tutorialProvider =
        Provider.of<TooltipTutorialProvider>(context, listen: false);
    final contacProvider =
        Provider.of<ContactSupportWidgetProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          insetPadding: EdgeInsets.only(
              bottom: 90, left: MediaQuery.of(context).size.width * 0.03),
          backgroundColor: Colors.white,
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                tutorialProvider.showTutorialTooltip(tipToShow: Constants.app);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Launch Tutorial',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                generateDialogTutorial();
              },
              child: const Text(
                'Reset Onboarding',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                contacProvider.showContactOptionsDialog(context);
              },
              child: const Text(
                'Visit Support Page',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text(
                'Request Help',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);
    TooltipTutorialProvider tutorialProvider =
        Provider.of<TooltipTutorialProvider>(context, listen: false);
    tutorialProvider.showTutorial = true;
    tutorialProvider.direction = AxisDirection.down;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomToolTip(
              height: 140,
              tooltipController: tutorialProvider.tooltipController,
              title: 'Take a quick tour of your Z Light Space application',
              description:
                  'See how to customize your physical keyboard using the Z Light Space app based on your mood, preferences and more',
              btn1Txt: Constants.close,
              btn2Txt: Constants.next,
              btn1Pressed: () {
                tutorialProvider.hideTutorialTooltip(tipToHide: Constants.app);
              },
              btn2Pressed: () {
                tutorialProvider.hideTutorialTooltip(tipToHide: Constants.app);
                tutorialProvider.showTutorialTooltip(
                    tipToShow: Constants.workspace);
              },
              widget: Container(
                margin: const EdgeInsets.only(top: 5),
                width: 123,
                height: 50,
                child: SvgPicture.memory(
                    File(Constants.zLightLogoSvg).readAsBytesSync()),
              ),
            ),
          ],
        ),
        actions: [
          Wrap(
            children: [
              CustomToolTip(
                height: 100,
                tooltipController: tutorialProvider.tooltipControllerProfile,
                title: Constants.selectedProfile,
                description:
                    'You can presave a lot of customizations as profiles for later use',
                btn1Txt: Constants.close,
                btn2Txt: Constants.next,
                btn1Pressed: () {
                  tutorialProvider.showTutorialTooltip(
                      tipToShow: Constants.light);
                  tutorialProvider.hideTutorialTooltip(
                      tipToHide: Constants.profile);
                },
                btn2Pressed: () {
                  tutorialProvider.hideTutorialTooltip(
                      tipToHide: Constants.profile);
                  tutorialProvider.showTutorialTooltip(
                      tipToShow: Constants.highlight);
                },
                widget: Container(
                  margin: const EdgeInsets.only(top: 23, right: 30),
                  child: Text(
                    Constants.selectedProfile,
                    textAlign: TextAlign.left,
                    style: h5Style,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: ProfileDropdown(),
          ),
          Container(
            margin: const EdgeInsets.only(right: 50),
          ),
          const WindowButtons(),
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
              child: CustomToolTip(
                height: 120,
                tooltipController: tutorialProvider.tooltipControllerHelp,
                title: "Help Option",
                description:
                    'Use the help otion to settle all your concerns about the Z Light space app. You can also speak to a live agent to onblock you',
                btn1Txt: Constants.close,
                btn2Txt: Constants.finish,
                btn1Pressed: () {
                  tutorialProvider.hideTutorialTooltip(
                      tipToHide: Constants.help);
                  tutorialProvider.showTutorialTooltip(
                      tipToShow: 'Tools_Effects');
                },
                btn2Pressed: () {
                  tutorialProvider.hideTutorialTooltip(
                      tipToHide: Constants.help);
                },
                widget: IconButton(
                  iconSize: 40,
                  color: Colors.white,
                  icon: const Icon(Ionicons.help_circle_outline),
                  onPressed: () {
                    openDialogOption();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AppBar(
                  toolbarHeight: 70.0,
                  backgroundColor: const Color(0xff1E1E1E),
                  bottomOpacity: 0.0,
                  elevation: 0.0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomToolTip(
                        height: 100,
                        tooltipController:
                            tutorialProvider.tooltipControllerWorkSpace,
                        title: Constants.workspace,
                        description:
                            'The workspace we allow you move your device around for later customization',
                        btn1Txt: Constants.close,
                        btn2Txt: Constants.next,
                        btn1Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: Constants.workspace);
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: Constants.app);
                        },
                        btn2Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: Constants.workspace);
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: Constants.light);
                        },
                        widget: TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: const Size(150, 50),
                              primary: workspaceProvider.isWorkspaceView
                                  ? Colors.white
                                  : Colors.grey,
                              backgroundColor: Colors.transparent,
                              textStyle: h5Style),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            fit: StackFit.passthrough,
                            children: [
                              const Positioned(
                                  top: 10, child: Text(Constants.workspace)),
                              Container(
                                height: 2,
                                margin: const EdgeInsets.only(top: 40.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: workspaceProvider.isWorkspaceView ==
                                            false
                                        ? [
                                            Colors.transparent,
                                            Colors.transparent
                                          ]
                                        : [
                                            Colors.lightBlue,
                                            Colors.blue.shade900,
                                            Colors.purple
                                          ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            workspaceProvider
                                .toggleView(WorkspaceView.workspace);
                          },
                        ),
                      ),
                      CustomToolTip(
                        height: 115,
                        tooltipController:
                            tutorialProvider.tooltipControllerLight,
                        title: Constants.lightingOptions,
                        description:
                            'Our lighting option allows you full customization of your keyboard with a dazzling stack of ama- zing effects to help your productivity',
                        btn1Txt: Constants.close,
                        btn2Txt: Constants.next,
                        btn1Pressed: () {
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: Constants.workspace);
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: Constants.light);
                        },
                        btn2Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: Constants.light);
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: Constants.profile);
                        },
                        widget: TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: const Size(150, 50),
                            primary: workspaceProvider.isLightingView
                                ? Colors.white
                                : Colors.grey,
                            backgroundColor: Colors.transparent,
                            textStyle: h5Style,
                          ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            fit: StackFit.passthrough,
                            children: [
                              const Positioned(
                                  top: 10,
                                  child: Text(Constants.lightingOptions)),
                              Container(
                                height: 2,
                                margin: const EdgeInsets.only(top: 40.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: workspaceProvider.isLightingView ==
                                            false
                                        ? [
                                            Colors.transparent,
                                            Colors.transparent
                                          ]
                                        : [
                                            Colors.lightBlue,
                                            Colors.blue.shade900,
                                            Colors.purple
                                          ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            workspaceProvider
                                .toggleView(WorkspaceView.lighting);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Wrapper(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb &&
        (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
      return Row(
        children: [
          MinimizeWindowButton(),
          MaximizeWindowButton(),
          CloseWindowButton()
        ],
      );
    }

    return Container();
  }
}
