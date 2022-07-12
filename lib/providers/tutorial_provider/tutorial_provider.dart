import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

// TooltipTutorial provider to manage the current colors or effects of a TooltipTutorial been selected
class TooltipTutorialProvider extends ChangeNotifier {
  final tooltipController = JustTheController();
  bool showTutorial = false;
  var direction = AxisDirection.down;
  double width = 300;

  void showTutorialTooltip() {
    if (showTutorial == true) {
      tooltipController.showTooltip();
    }
  }

  Widget generateTooltipTutorial(Widget widget, String title, String text,
      String btn1Txt, String btn2Txt, double height) {
    return (showTutorial == false)
        ? Container(child: widget)
        : JustTheTooltip(
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            tailBaseWidth: 15.0,
            tailLength: 15.0,
            controller: tooltipController,
            barrierDismissible: false,
            preferredDirection: direction,
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "Metropolis")),
                    Container(margin: const EdgeInsets.only(top: 10)),
                    Text(text,
                        style: const TextStyle(
                            height: 1.3,
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: "Metropolis")),
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
                                onPressed: () {},
                                style: textBtnStyleWhite,
                                child: SizedBox(
                                  height: 20,
                                  child: Text(btn1Txt),
                                ))),
                        Expanded(
                            flex: 2,
                            child: TextButton(
                                onPressed: () {},
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
