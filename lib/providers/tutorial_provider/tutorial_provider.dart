import 'package:flutter/material.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';

// TooltipTutorial provider to manage the current colors or effects of a TooltipTutorial been selected
class TooltipTutorialProvider extends ChangeNotifier {
  final tooltipControllerHelp = JustTheController();
  final tooltipControllerHighlight = JustTheController();
  final tooltipControllerResize = JustTheController();
  final tooltipControllerClick = JustTheController();
  final tooltipControllerWorkSpace = JustTheController();
  final tooltipControllerProfile = JustTheController();
  final tooltipControllerToolsEffects = JustTheController();
  final tooltipControllerLight = JustTheController();
  final tooltipController = JustTheController();

  bool showTutorial = false;
  Widget tutorial = Container();
  var direction = AxisDirection.down;
  double width = 300;
  String? toolTipToShow;

  void showTutorialTooltip({String? tipToShow}) {
    switch (tipToShow) {
      case Constants.app:
        tooltipController.showTooltip();
        break;
      case Constants.click:
        tooltipControllerClick.showTooltip();
        break;
      case Constants.resizable:
        tooltipControllerResize.showTooltip();
        break;
      case Constants.highlight:
        tooltipControllerHighlight.showTooltip();
        break;
      case Constants.light:
        tooltipControllerLight.showTooltip();
        break;
      case Constants.help:
        tooltipControllerHelp.showTooltip();
        break;
      case Constants.profile:
        tooltipControllerProfile.showTooltip();
        break;
      case 'Tools_Effects':
        tooltipControllerToolsEffects.showTooltip();
        break;
      case Constants.workspace:
        tooltipControllerWorkSpace.showTooltip();
        break;
      default:
    }
    toolTipToShow = tipToShow;
  }

  void hideTutorialTooltip({String? tipToHide}) {
    switch (tipToHide) {
      case Constants.app:
        tooltipController.hideTooltip();
        break;
      case Constants.click:
        tooltipControllerClick.hideTooltip();
        break;
      case Constants.resizable:
        tooltipControllerResize.hideTooltip();
        break;
      case Constants.highlight:
        tooltipControllerHighlight.hideTooltip();
        break;
      case Constants.light:
        tooltipControllerLight.hideTooltip();
        break;
      case 'Tools_Effects':
        tooltipControllerToolsEffects.hideTooltip();
        break;
      case Constants.help:
        tooltipControllerHelp.hideTooltip();
        break;
      case Constants.profile:
        tooltipControllerProfile.hideTooltip();
        break;
      case Constants.workspace:
        tooltipControllerWorkSpace.hideTooltip();
        break;
      default:
    }
    toolTipToShow = null;
    // notifyListeners()
  }
}

class CustomToolTip extends StatelessWidget {
  CustomToolTip(
      {Key? key,
      required this.tooltipController,
      required this.title,
      required this.height,
      required this.description,
      this.btn1Pressed,
      this.btn2Pressed,
      required this.btn1Txt,
      required this.btn2Txt,
      required this.widget})
      : super(key: key);

  double width = 300;
  final double height;
  final String title;
  final String description;
  final JustTheController tooltipController;
  final Function()? btn1Pressed;
  final Function()? btn2Pressed;
  final String btn1Txt;
  final String btn2Txt;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    TooltipTutorialProvider tutorialProvider =
        Provider.of<TooltipTutorialProvider>(context);

    return (tutorialProvider.showTutorial == false)
        ? Container(child: widget)
        : JustTheTooltip(
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            tailBaseWidth: 15.0,
            tailLength: 15.0,
            controller: tooltipController,
            isModal: true,
            triggerMode: TooltipTriggerMode.manual,
            barrierDismissible: false,
            preferredDirection: tutorialProvider.direction,
            content: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    Container(margin: const EdgeInsets.only(top: 10)),
                    Text(description,
                        style: const TextStyle(
                            height: 1.3, fontSize: 12, color: Colors.black)),
                    Container(margin: const EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Expanded(
                            flex: 2,
                            child: TextButton(
                                onPressed: btn1Pressed,
                                style: textBtnStyleWhite,
                                child: SizedBox(
                                  height: 20,
                                  child: Text(btn1Txt),
                                ))),
                        Expanded(
                            flex: 2,
                            child: TextButton(
                                onPressed: btn2Pressed,
                                style: textBtnStyleBlack,
                                child: SizedBox(
                                  height: 20,
                                  child: Text(btn2Txt),
                                )))
                      ],
                    )
                  ],
                ),
              ),
            ),
            child: widget,
          );
  }
}
