import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/apps/z_light/workspace/widgets/imports.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/scrollbar_provider.dart';
import 'package:hpx/providers/tutorial_provider/tutorial_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/utils/comparer.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/components/dropdown.dart';
import 'package:hpx/widgets/components/scrollbar/custom_h_scrollbar.dart';
import 'package:hpx/widgets/components/scrollbar/custom_v_scrollbar.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key}) : super(key: key);

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late TextEditingController _zoomTextCtrl;
  late double _zoomValue;
  late double _zoomScale;
  late double _zoomScaleFactor;

  static const double _zoomInThreshold = 250;
  static const double _zoomOutThreshold = 60;
  static const double _buttonSize = 32.0;

  bool _resetZoom = false;

  /// [zoomTextSubmitted] is called when user hits the Enter key.
  /// This updates the zoom value and resets the value when outside
  /// the acceptable thresholds [_zoomOutThreshold] and [_zoomInThreshold].
  void zoomTextSubmitted(String v) {
    double? value = double.tryParse(v);

    if (value != null) {
      if (value < _zoomOutThreshold) {
        value = _zoomOutThreshold;
        _resetZoom = true;
      } else if (value > _zoomInThreshold) {
        value = _zoomInThreshold;
      }

      setState(() {
        _zoomValue = value!;
        _zoomScale = _zoomScaleFactor * _zoomValue / 100;
        updateZoomText();
      });
    }
  }

  /// [zoomEnd] terminates continuous zoom
  void zoomEnd() {
    // _timer.cancel();
  }

  /// [updateZoomText] sets the zoom text (without fractions) and zoom scale.
  void updateZoomText() {
    _zoomTextCtrl.text = '${_zoomValue.ceil()}%';
  }

  /// [zoomIn] increases the zoomValue only up to the zoomIn threshold
  /// preventing scenario where content is unnecessarily large.
  void zoomIn() {
    if (_zoomValue == _zoomInThreshold) return;

    _resetZoom = false;
    zoomTextSubmitted('${_zoomValue + 10}');
  }

  /// [zoomExpand] sets the zoomValue to half the zoomIn threshold.
  void zoomExpand() {
    _resetZoom = false;
    zoomTextSubmitted('${_zoomInThreshold / 1.5}');
  }

  /// [zoomOut] decreases the zoomValue only up to the zoomOut threshold
  /// preventing scenario where content is completely not visible.
  void zoomOut() {
    if (_zoomValue == _zoomOutThreshold) return;

    _resetZoom = false;
    zoomTextSubmitted('${_zoomValue - 10}');
  }

  /// [recenterView] sets the zoomValue to the zoomOut threshold.
  void recenterView() {
    _resetZoom = true;
    zoomTextSubmitted('100');
  }

  @override
  void initState() {
    super.initState();

    // initialize animation
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    // Initialize zoom value and scale.
    _zoomValue = 100;
    _zoomScaleFactor = 0.5;
    _zoomScale = _zoomScaleFactor * _zoomValue / _zoomValue;
    _zoomTextCtrl = TextEditingController(text: '${_zoomValue.ceil()}%');
  }

  @override
  void dispose() {
    _zoomTextCtrl.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);
    final tutorialProvider =
        Provider.of<TooltipTutorialProvider>(context, listen: false);
    tutorialProvider.direction = AxisDirection.down;

    final themeData = Theme.of(context);

    // initialize animation controller
    workspaceProvider.initAnimation(_controller);

    // initialize layers provider
    workspaceProvider.initLayersProvider(Provider.of<LayersProvider>(context));

    // initialize scroll offset
    workspaceProvider.scrollOffset = 12.0;

    return Column(
      children: [
        /// Workspace area must be constrained to avoid width/height overflow
        /// i.e. unconstrained error, and ultimately unexpected view behavior.
        ///
        /// Setting width/height with double.infinity is not recommended,
        /// instead we want to keep the view constrained and have excessive
        /// sub-widgets cliped only to the view.
        if (workspaceProvider.isLightingView)
          ConstrainedBox(
            key: workspaceZoneToolsKey,
            constraints: const BoxConstraints(
              maxHeight: 85,
            ),
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('Zone Selection', style: h5Style),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomToolTip(
                        height: 100,
                        tooltipController:
                            tutorialProvider.tooltipControllerHighlight,
                        title: 'Highlight selector',
                        description:
                            'The highlight selector allows you to select multiple keys by dragging ...',
                        btn1Txt: "Close",
                        btn2Txt: "Next",
                        btn1Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Highlight');
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'Profile');
                        },
                        btn2Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Highlight');
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'Resizable');
                        },
                        widget: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Tooltip(
                            message: 'Highlight selector',
                            child: RoundButton(
                              onTapDown: workspaceProvider.zoneHighlightFnc,
                              size: _buttonSize,
                              icon: Icons.highlight_alt,
                              iconColor: workspaceProvider.isDragModeHighlight
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      CustomToolTip(
                        height: 100,
                        tooltipController:
                            tutorialProvider.tooltipControllerResize,
                        title: 'Resizable selector',
                        description:
                            'The resizable selector allows you to select multiple keys over an area using a resizable overlay box',
                        btn1Txt: "Close",
                        btn2Txt: "Next",
                        btn1Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Resizable');
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'Highlight');
                        },
                        btn2Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Resizable');
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'Click');
                        },
                        widget: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Tooltip(
                            message: 'Resizable selector',
                            child: RoundButton(
                              onTapDown: workspaceProvider.zoneResizableFnc,
                              size: _buttonSize,
                              icon: Icons.select_all,
                              iconColor: workspaceProvider.isDragModeResizable
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      CustomToolTip(
                        height: 100,
                        tooltipController:
                            tutorialProvider.tooltipControllerClick,
                        title: 'Click selector',
                        description:
                            'The resizable selector allows you to select multiple keys over an area using a resizable overlay box',
                        btn1Txt: "Close",
                        btn2Txt: "Next",
                        btn1Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Click');
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'Resizable');
                        },
                        btn2Pressed: () {
                          tutorialProvider.hideTutorialTooltip(
                              tipToHide: 'Click');
                          tutorialProvider.showTutorialTooltip(
                              tipToShow: 'Tools_Effects');
                        },
                        widget: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Tooltip(
                            message: 'Click selector',
                            child: RoundButton(
                              onTapDown: workspaceProvider.zoneClickFnc,
                              size: _buttonSize,
                              icon: Icons.mouse,
                              iconColor: workspaceProvider.isDragModeClick
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: DropDown(
                          enabled: workspaceProvider.isDragModeClick,
                          hint: 'Select by devices...',
                          hintStyle: pStyle,
                          items: getDropdownMenuItems(
                            Theme.of(context).colorScheme.primary,
                            devices(),
                          ),
                          onChangedHandler: (o) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        if (workspaceProvider.isStripNotify)
          StripNotification(
            message: workspaceProvider.stripNotificationText,
            closeHandler: workspaceProvider.toggleStripNotification,
          ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constants.backdropImage),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: LayoutBuilder(
              builder: (_, constraints) {
                // set the keyboard center
                workspaceProvider.recenter(constraints, _resetZoom);

                return Stack(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanDown: (details) {
                        workspaceProvider.onPanDown(details);
                      },
                      onPanUpdate: (details) =>
                          workspaceProvider.onPanUpdate(details),
                      onPanEnd: (details) =>
                          workspaceProvider.onPanEnd(details),
                      onPanCancel: () => workspaceProvider.onPanClear(),
                      child: Stack(
                        key: workspaceStackKey,
                        alignment: Alignment.bottomLeft,
                        fit: StackFit.expand,
                        children: [
                          // Keyboard widget takes a zoom scale which is applied to all keys.
                          // This ensures seamless zooming of the entire keyboard.
                          Positioned(
                            left: workspaceProvider.keyboardPosLeft,
                            top: workspaceProvider.keyboardPosTop,
                            // alignment: Alignment.center,
                            child: Keyboard(zoomScale: _zoomScale),
                          ),

                          OverlaySelector(
                            showCrossHair:
                                workspaceProvider.isDragModeResizable,
                            onPanDown: workspaceProvider.onPanDown,
                            onPanUpdate: workspaceProvider.onPanUpdate,
                            onPanEnd: workspaceProvider.onPanEnd,
                            isVisible: workspaceProvider.selectorVisible,
                          ),

                          if (workspaceProvider.isModalNotify)
                            ModalNotification(
                              closeHandler: workspaceProvider.toggleModal,
                              children: workspaceProvider.modalWidgets,
                            ),
                        ],
                      ),
                    ),

                    // Vertical custom scrollbar
                    Consumer<ScrollbarProvider>(
                        builder: (context, scrollProvider, child) {
                      // initialize vertical scroll offset
                      scrollProvider.initVerticalScroll(
                          constraints,
                          workspaceProvider.scrollOffset,
                          _zoomValue,
                          _zoomOutThreshold,
                          _zoomInThreshold,
                          reset: _resetZoom);

                      return CustomVScrollbar(
                        top: 0,
                        end: 0,
                        bottom: workspaceProvider.scrollOffset,
                        buttonSize: workspaceProvider.scrollOffset,
                        thumbSize: scrollProvider.thumbSizeV,
                        thumbOffset: scrollProvider.top,
                        primaryColor: themeData.primaryColor,
                        secondaryColor: themeData.primaryColorLight,
                        onPanVertical: (details, name) {
                          _resetZoom = false;

                          // update scrollbar and keyboard top position
                          final isScroll =
                              scrollProvider.onPanVertical(details);
                          workspaceProvider.updateKeyboardPosTop(
                              isScroll, details, _zoomScale / _zoomScaleFactor);
                        },
                        onTapMinus: () {
                          _resetZoom = false;

                          final scrollDetails = scrollProvider.onTapUp();
                          workspaceProvider.updateKeyboardPosTop(
                              scrollDetails.scrolling,
                              scrollDetails.details,
                              _zoomScale / _zoomScaleFactor);
                        },
                        onTapPlus: () {
                          _resetZoom = false;

                          final scrollDetails = scrollProvider.onTapDown();
                          workspaceProvider.updateKeyboardPosTop(
                              scrollDetails.scrolling,
                              scrollDetails.details,
                              _zoomScale / _zoomScaleFactor);
                        },
                      );
                    }),

                    // Horizontal custom scrollbar
                    Consumer<ScrollbarProvider>(
                        builder: (context, scrollProvider, child) {
                      // initialize horizontal scroll offset
                      scrollProvider.initHorizontalScroll(
                          constraints,
                          workspaceProvider.scrollOffset,
                          _zoomValue,
                          _zoomOutThreshold,
                          _zoomInThreshold,
                          reset: _resetZoom);

                      return CustomHScrollbar(
                        start: 0,
                        end: workspaceProvider.scrollOffset,
                        bottom: 0,
                        buttonSize: workspaceProvider.scrollOffset,
                        thumbSize: scrollProvider.thumbSizeH,
                        thumbOffset: scrollProvider.left,
                        primaryColor: themeData.primaryColor,
                        secondaryColor: themeData.primaryColorLight,
                        onPanHorizontal: (details, name) {
                          _resetZoom = false;

                          // update scrollbar and keyboard left position
                          final isScroll =
                              scrollProvider.onPanHorizontal(details);
                          workspaceProvider.updateKeyboardPosLeft(
                              isScroll, details, _zoomScale / _zoomScaleFactor);
                        },
                        onTapMinus: () {
                          _resetZoom = false;

                          final scrollDetails = scrollProvider.onTapLeft();
                          workspaceProvider.updateKeyboardPosLeft(
                              scrollDetails.scrolling,
                              scrollDetails.details,
                              _zoomScale / _zoomScaleFactor);
                        },
                        onTapPlus: () {
                          _resetZoom = false;

                          final scrollDetails = scrollProvider.onTapRight();
                          workspaceProvider.updateKeyboardPosLeft(
                              scrollDetails.scrolling,
                              scrollDetails.details,
                              _zoomScale / _zoomScaleFactor);
                        },
                      );
                    }),

                    // zoom toolbar
                    Positioned(
                      bottom: workspaceProvider.scrollOffset,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ZoomToolbar(
                          onSubmitted: zoomTextSubmitted,
                          zoomTextController: _zoomTextCtrl,
                          zoomInHandler: zoomIn,
                          zoomExpandHandler: zoomExpand,
                          zoomOutHandler: zoomOut,
                          zoomCollapseHandler: recenterView,
                          zoomEndHandler: zoomEnd,
                        ),
                      ),
                    ),

                    // TODO: previous overlay location
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class Device extends Comparer {
  /// [Device] is a type of HP supported device.
  ///
  /// It is used in the zone selection to allow users to select devices.
  Device(this.name, this.enabled, {this.devices}) : super(name);

  final String name;
  late final List<Device>? devices;
  bool enabled;
}

// TODO: devices may be refactored and retrieved from storage or an API.

/// [devices] returns the list of supported devices and their sub devices.
List<Device> devices() {
  return [
    Device('All devices', false),
    Device('OMEN devices', false),
    Device('Z by HP device', true, devices: [Device('ZBook Studio G9', true)]),
    Device('Other devices', false),
  ];
}

/// [getDropdownMenuItems] returns a list of [Device] dropdown menu items.
///
/// Recursively adds sub items as well.
List<DropdownMenuItem<Device>>? getDropdownMenuItems(
    Color activeColor, List<Device>? devices,
    [int index = 0]) {
  if (devices == null) return null;

  List<DropdownMenuItem<Device>> c = [];

  for (var element in devices) {
    c.add(dropdownMenuItem(element, activeColor, index));
    if (element.devices != null && element.devices!.isNotEmpty) {
      final g = getDropdownMenuItems(activeColor, element.devices, index + 1);

      // add sub menu items if they exist
      if (g != null) c.addAll(g);
    }
  }

  return c;
}

DropdownMenuItem<Device> dropdownMenuItem(Device e, Color activeColor,
    [index = 0]) {
  const double paddingLeft = 20;

  return DropdownMenuItem(
    value: e,
    child: Padding(
      padding: EdgeInsets.only(left: paddingLeft * index),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: activeColor,
            value: e.enabled,
            onChanged: (x) {
              e.enabled = true;
            },
          ),
          Text(
            e.name,
            style: pStyle,
          ),
          if (e.devices != null && e.devices!.isNotEmpty)
            const Icon(Icons.arrow_drop_down)
        ],
      ),
    ),
  );
}
