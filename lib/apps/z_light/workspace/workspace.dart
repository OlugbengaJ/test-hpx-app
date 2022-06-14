import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:hpx/apps/z_light/workspace/widgets/imports.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/utils/comparer.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/components/dropdown.dart';
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
  static const double _zoomScaleFactor = 0.4;

  static const double _zoomInThreshold = 250;
  static const double _zoomOutThreshold = 60;
  static const Duration _duration = Duration(milliseconds: 50);
  static const double _buttonSize = 32.0;

  Timer _timer = Timer.periodic(Duration.zero, ((t) {}));

  /// [zoomTextSubmitted] is called when user hits the Enter key.
  /// This updates the zoom value and resets the value when outside
  /// the acceptable thresholds [_zoomOutThreshold] and [_zoomInThreshold].
  void zoomTextSubmitted(String v) {
    debugPrint('pressed $v ${_zoomTextCtrl.text}');
    double? value = double.tryParse(v);
    if (value != null) {
      if (value < _zoomOutThreshold) {
        value = _zoomOutThreshold;
      } else if (value > _zoomInThreshold) {
        value = _zoomInThreshold;
      }

      setState(() {
        _zoomValue = value!;
        _zoomScale = _zoomValue / (60 / _zoomScaleFactor);
        updateZoomText();
      });
    }
  }

  /// [zoomEnd] terminates continuous zoom
  ///
  /// timer is canceled to stop zooming by the duration specified
  void zoomEnd() {
    _timer.cancel();
  }

  /// [updateZoomText] sets the zoom text (without fractions) and zoom scale.
  void updateZoomText() {
    _zoomTextCtrl.text = '${_zoomValue.ceil()}';
  }

  /// [zoomIn] increases the zoomValue only up to the zoomIn threshold
  /// preventing scenario where content is unnecessarily large.
  void zoomIn() {
    _timer = Timer.periodic(_duration, (t) {
      if (_zoomValue == _zoomInThreshold) {
        _timer.cancel();
        return;
      }

      zoomTextSubmitted('${_zoomValue + 1}');
    });
  }

  /// [zoomExpand] sets the zoomValue to half the zoomIn threshold.
  void zoomExpand() {
    zoomTextSubmitted('${_zoomInThreshold / 1.5}');
  }

  /// [zoomOut] decreases the zoomValue only up to the zoomOut threshold
  /// preventing scenario where content is completely not visible.
  void zoomOut() {
    _timer = Timer.periodic(_duration, (t) {
      if (_zoomValue == _zoomOutThreshold) {
        _timer.cancel();
        return;
      }

      zoomTextSubmitted('${_zoomValue - 1}');
    });
  }

  /// [zoomCollapse] sets the zoomValue to the zoomOut threshold.
  void zoomCollapse() {
    zoomTextSubmitted('$_zoomOutThreshold');
  }

  @override
  void initState() {
    super.initState();

    // initialize animation
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    // Initialize zoom value and scale.
    _zoomValue = 60;
    _zoomScale = _zoomScaleFactor;
    _zoomTextCtrl = TextEditingController(text: _zoomValue.ceil().toString());
  }

  @override
  void dispose() {
    _zoomTextCtrl.dispose();
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerH = ScrollController();
    final controllerV = ScrollController();
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);

    // initialize animation controller
    workspaceProvider.initAnimation(_controller);

    // initialize layers provider
    workspaceProvider.initLayersProvider(Provider.of<LayersProvider>(context));

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
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Tooltip(
                          message: 'Highlight selector',
                          child: RoundButton(
                            onTapDown: () {
                              workspaceProvider
                                  .toggleDragMode(WorkspaceDragMode.highlight);
                            },
                            size: _buttonSize,
                            icon: Icons.highlight_alt,
                            iconColor: workspaceProvider.isDragModeHighlight
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Tooltip(
                          message: 'Resizable selector',
                          child: RoundButton(
                            onTapDown: () {
                              workspaceProvider
                                  .toggleDragMode(WorkspaceDragMode.resizable);
                            },
                            onTapUp: () {},
                            size: _buttonSize,
                            icon: Icons.select_all,
                            iconColor: workspaceProvider.isDragModeResizable
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Tooltip(
                          message: 'Click selector',
                          child: RoundButton(
                            onTapDown: () {
                              workspaceProvider
                                  .toggleDragMode(WorkspaceDragMode.click);
                            },
                            size: _buttonSize,
                            icon: Icons.mouse,
                            iconColor: workspaceProvider.isDragModeClick
                                ? Theme.of(context).colorScheme.primary
                                : null,
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
            child: Stack(
              key: workspaceStackKey,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanDown: (details) {
                    workspaceProvider.onPanDown(details);
                  },
                  onPanUpdate: (details) =>
                      workspaceProvider.onPanUpdate(details),
                  onPanEnd: (details) => workspaceProvider.onPanEnd(details),
                  onPanCancel: () => workspaceProvider.onPanClear(),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    fit: StackFit.expand,
                    children: [
                      // Keyboard widget takes a zoom scale which is applied to all keys.
                      // This ensures seamless zooming of the entire keyboard.
                      Align(
                        alignment: Alignment.center,
                        child: Scrollbar(
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          controller: controllerH,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: controllerH,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            child: Scrollbar(
                              scrollbarOrientation: ScrollbarOrientation.left,
                              controller: controllerV,
                              thumbVisibility: true,
                              child: SingleChildScrollView(
                                controller: controllerV,
                                scrollDirection: Axis.vertical,
                                primary: false,
                                child: Keyboard(zoomScale: _zoomScale),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   color: Colors.blue,
                      //   width: 50,
                      // ),

                      const LayersStack(),

                      OverlaySelector(
                        showCrossHair: workspaceProvider.isDragModeResizable,
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ZoomToolbar(
                      onSubmitted: zoomTextSubmitted,
                      zoomTextController: _zoomTextCtrl,
                      zoomInHandler: zoomIn,
                      zoomExpandHandler: zoomExpand,
                      zoomOutHandler: zoomOut,
                      zoomCollapseHandler: zoomCollapse,
                      zoomEndHandler: zoomEnd,
                    ),
                  ),
                ),
              ],
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

// TODO: this may need to be refactored and retrieved from storage or an API.

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
