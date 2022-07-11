import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

// TooltipTutorial provider to manage the current colors or effects of a TooltipTutorial been selected
class TooltipTutorialProvider extends ChangeNotifier {
  final tooltipControllerHelp = JustTheController();
  final tooltipControllerWorkSpace = JustTheController();

  final tooltipController = JustTheController();

  bool showTutorial = false;
  var direction = AxisDirection.down;
  double width = 300;
  String? toolTipToShow;
  void showTutorialTooltipHelp({String? tipToShow}) {
    if(tipToShow == "Help"){
  tooltipControllerHelp.showTooltip();
  toolTipToShow = 'Help';

    }else if(tipToShow == "WorkSpace"){
tooltipControllerWorkSpace.showTooltip();
  toolTipToShow = 'WorkSpace';

    }
  // notifyListeners()
  }
    void hideTutorialTooltipHelp({String? tipToHide}) {
      if(tipToHide == "Help"){
  tooltipControllerHelp.hideTooltip();

      }else if(tipToHide == "WorkSpace"){
        tooltipControllerWorkSpace.hideTooltip();
      }else{
  toolTipToShow = null;

      }
  // notifyListeners()
  }
    void showTutorialTooltip(){
    notifyListeners();
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
            isModal: true,
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
                                onPressed: () {
                                  if(btn1Txt=='Close'){
                                    tooltipController.hideTooltip();
                                  }
                                  debugPrint('close pressed');
                                },
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

class CustomToolTip extends StatelessWidget {
   CustomToolTip({Key? key,required this.tooltipController,required this.title,required this.description,this.btn1Pressed,this.btn2Pressed, required this.btn1Txt,required this.btn2Txt, required this.widget}) : super(key: key);
  var direction = AxisDirection.down;
  double width = 300;
 final String title;
 final String description;
  final JustTheController tooltipController ;
  final Function()? btn1Pressed;
  final Function()? btn2Pressed;
  final String btn1Txt;
  final String btn2Txt;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            tailBaseWidth: 15.0,
            tailLength: 15.0,
            controller: tooltipController,
            isModal: true,
            barrierDismissible: false,
            preferredDirection: direction,
            content: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: width,
                height: 200,
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
                    Text(description,
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