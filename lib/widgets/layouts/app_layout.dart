import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/profile/profile_dropdown.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import 'package:hpx/providers/tools_effect_provider/widget/contact_support_provider.dart';
import 'package:hpx/providers/tutorial_provider/tutorial_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/utils/constants.dart';
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
                Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      tutorialProvider.showTutorialTooltip(tipToShow: 'App');
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
                ),
                Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      tutorialProvider.generateDialogTutorial(context);
                    },
                    child: const Text(
                      'Reset Onboarding',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 40,
                  child: InkWell(
                    onTap: () {
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
                ),
                Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 40,
                  child: const Text(
                    'Request Help',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    WorkspaceProvider workspaceProvider =
        Provider.of<WorkspaceProvider>(context);
    TooltipTutorialProvider tutorialProvider =
        Provider.of<TooltipTutorialProvider>(context, listen: false);
    tutorialProvider.showTutorial = true;
    tutorialProvider.direction = AxisDirection.down;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomToolTip(
                  height: 130,
                  tooltipController: tutorialProvider.tooltipController,
                  title: 'Take a quick tour of your Z Light space application',
                  description:
                      'See how to customize your physical keyboard using the Z Light space app based on your mood, preferences and more',
                  btn1Txt: "Close",
                  btn2Txt: "Next",
                  btn1Pressed: () {
                    tutorialProvider.hideTutorialTooltip(tipToHide: 'App');
                  },
                  btn2Pressed: () {
                    tutorialProvider.hideTutorialTooltip(tipToHide: 'App');
                    tutorialProvider.showTutorialTooltip(
                        tipToShow: 'WorkSpace');
                  },
                  widget: Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: 123,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: Svg(
                            Constants.zLightLogoSvg,
                          ),
                          fit: BoxFit.cover),
                    ),
                  )),
            ],
          ),
          actions: [
            CustomToolTip(
              height: 100,
              tooltipController: tutorialProvider.tooltipControllerProfile,
              title: "Selected Profile",
              description:
                  'You can presave a lot of customizations as profiles for later use',
              btn1Txt: "Close",
              btn2Txt: "Next",
              btn1Pressed: () {
                tutorialProvider.showTutorialTooltip(tipToShow: 'Light');
                tutorialProvider.hideTutorialTooltip(tipToHide: 'Profile');
              },
              btn2Pressed: () {
                tutorialProvider.hideTutorialTooltip(tipToHide: 'Profile');
                tutorialProvider.showTutorialTooltip(tipToShow: 'Highlight');
              },
              widget: Container(
                margin: const EdgeInsets.only(top: 23),
                child: Text(
                  "Selected Profile",
                  textAlign: TextAlign.left,
                  style: h5Style,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: ProfileDropdown(),
            ),
            Container(
              margin: const EdgeInsets.only(right: 50),
            ),
            (TargetPlatform.macOS == true ||
                    TargetPlatform.linux == true ||
                    TargetPlatform.windows == true ||
                    TargetPlatform.android == false ||
                    !kIsWeb)
                ? WindowTitleBarBox(
                    child: Row(
                      children: const [WindowButtons()],
                    ),
                  )
                : Container()
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
                  btn1Txt: "Close",
                  btn2Txt: "Finish",
                  btn1Pressed: () {
                    tutorialProvider.hideTutorialTooltip(tipToHide: 'Help');
                    tutorialProvider.showTutorialTooltip(
                        tipToShow: 'Tools_Effects');
                  },
                  btn2Pressed: () {
                    tutorialProvider.hideTutorialTooltip(tipToHide: 'Help');
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
                          title: "WorkSpace",
                          description:
                              'The workspace we allow you move your device around for later customization',
                          btn1Txt: "Close",
                          btn2Txt: "Next",
                          btn1Pressed: () {
                            tutorialProvider.hideTutorialTooltip(
                                tipToHide: 'WorkSpace');
                            tutorialProvider.showTutorialTooltip(
                                tipToShow: 'App');
                          },
                          btn2Pressed: () {
                            tutorialProvider.hideTutorialTooltip(
                                tipToHide: 'WorkSpace');
                            tutorialProvider.showTutorialTooltip(
                                tipToShow: 'Light');
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
                                      top: 10, child: Text('Workspace')),
                                  Container(
                                      height: 2,
                                      margin: const EdgeInsets.only(top: 40.0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: workspaceProvider
                                                        .isWorkspaceView ==
                                                    false
                                                ? [
                                                    Colors.transparent,
                                                    Colors.transparent
                                                  ]
                                                : [
                                                    Colors.lightBlue,
                                                    Colors.blue.shade900,
                                                    Colors.purple
                                                  ]),
                                      ))
                                ]),
                            onPressed: () {
                              workspaceProvider
                                  .toggleView(WorkspaceView.workspace);
                            },
                          )),
                      CustomToolTip(
                        height: 115,
                        tooltipController:
                            tutorialProvider.tooltipControllerLight,
                        title: "Lighting Options",
                        description:
                            'Our lighting option allows you full customization of your keyboard with a dazzling stack of ama- zing effects to help your productivity',
                        btn1Txt: "Close",
                        btn2Txt: "Next",
                        btn1Pressed: () {
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'WorkSpace');
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Light');
                        },
                        btn2Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Light');
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'Profile');
                        },
                        widget: TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: const Size(150, 50),
                              primary: workspaceProvider.isLightingView
                                  ? Colors.white
                                  : Colors.grey,
                              backgroundColor: Colors.transparent,
                              textStyle: h5Style),
                          child: Stack(
                              alignment: Alignment.topCenter,
                              fit: StackFit.passthrough,
                              children: [
                                const Positioned(
                                    top: 10, child: Text('Lighting Options')),
                                Container(
                                    height: 2,
                                    margin: const EdgeInsets.only(top: 40.0),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: workspaceProvider
                                                      .isLightingView ==
                                                  false
                                              ? [
                                                  Colors.transparent,
                                                  Colors.transparent
                                                ]
                                              : [
                                                  Colors.lightBlue,
                                                  Colors.blue.shade900,
                                                  Colors.purple
                                                ]),
                                    ))
                              ]),
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
