import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
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
            isModal: false,
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

  generateDialogTurorial(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(backgroundColor: Color(0xff121212),
              // contentPadding: const EdgeInsets.only(
              //     top: 40, left: 20, right: 20, bottom: 30),
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1)),
                  width: 900,
                  height: 500,
                  child: Column(children: [
                    Text(
                      'Welcome to Z Light Space',
                      style: h1Style,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Text(
                      'Personalize your workspace lightning to enhance your creative workflow',
                      style: pStyle,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      margin: const EdgeInsets.only(top: 70, bottom: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: Svg(
                              'assets/images/tutorial_z.svg',
                            ),
                            fit: BoxFit.fill),
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
                                      Navigator.of(context).pop();
                                    },
                                    style: textBtnStyleWhite,
                                    child: SizedBox(
                                        height: 40,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text('Lets Go'))
                                            ]))),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text('Skip Tutorial'))
                                            ]))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]);
        });
  }
}
