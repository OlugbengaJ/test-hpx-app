import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard_selector.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';
import 'package:hpx/apps/z_light/workspace/widgets/zoom_toolbar.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key, required this.layers}) : super(key: key);

  final List<LayerStackItem> layers;

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  final _zoomTextCtrl = TextEditingController(text: '100');
  final double _zoomInThreshold = 400;
  final double _zoomOutThreshold = 60;
  double _zoomValue = 100;
  double _zoomScale = 1;

  Timer _timer = Timer.periodic(Duration.zero, ((t) {}));
  final _duration = const Duration(milliseconds: 50);

  final double _buttonSize = 32.0;

  /// [_zoomTextChanged] ensure user enters only digits
  /// that are within the acceptable zoom threshold.
  void _zoomTextChanged() {
    double? value = double.tryParse(_zoomTextCtrl.text);

    if (value != null) {
      if (value >= _zoomOutThreshold && value <= _zoomInThreshold) {
        setState(() {
          _zoomValue = value;
          _zoomScale = _zoomValue / 100;
        });
      }
    }
  }

  /// [_zoomEnd] terminates continuous zoom
  ///
  /// timer is canceled to stop zooming by the duration specified
  void _zoomEnd() {
    _timer.cancel();
  }

  /// [_updateZoom] sets the zoom text (without fractions) and zoom scale.
  void _updateZoom() {
    _zoomTextCtrl.text = '${_zoomValue.ceil()}';
  }

  /// [_zoomIn] increases the zoomValue only up to the zoomIn threshold
  /// preventing scenario where content is unnecessarily large.
  void _zoomIn() {
    _timer = Timer.periodic(_duration, (t) {
      if (_zoomValue == _zoomInThreshold) {
        _timer.cancel();
        return;
      }

      setState(() {
        _zoomValue += 1;
        _updateZoom();
      });
    });
  }

  /// [_zoomExpand] sets the zoomValue to half the zoomIn threshold.
  void _zoomExpand() {
    setState(() {
      _zoomValue = _zoomInThreshold / 3.1;
      _updateZoom();
    });
  }

  // _keysSelection() {
  //   context.read<KeySelectorProvider>().toggleKeySelector(true);
  // }

  // _selectDraggable() {
  //   context.read<KeySelectorProvider>().toggleKeySelector(false);
  // }

  /// zoomOut decreases the zoomValue only up to the zoomOut threshold
  /// preventing scenario where content is completely not visible.
  void _zoomOut() {
    _timer = Timer.periodic(_duration, (t) {
      if (_zoomValue == _zoomOutThreshold) {
        _timer.cancel();
        return;
      }

      setState(() {
        _zoomValue -= 1;
        _updateZoom();
      });
    });
  }

  /// zoomCollapse sets the zoomValue to the zoomOut threshold.
  void _zoomCollapse() {
    setState(() {
      _zoomValue = _zoomOutThreshold;
      _updateZoom();
    });
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _zoomTextCtrl.addListener(_zoomTextChanged);
  }

  @override
  void dispose() {
    _timer.cancel();
    _zoomTextCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);

    return Column(
      children: [
        /// Workspace area must be constrained to avoid width/height overflow
        /// i.e. unconstrained error, and ultimately unexpected view behavior.
        ///
        /// Setting width/height with double.infinity is not recommended,
        /// instead we want to keep the view constrained and have excessive
        /// sub-widgets cliped only to the view.
        Consumer<WorkspaceProvider>(
          builder: (context, provider, child) => (provider.isLightingView)
              ? ConstrainedBox(
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
                                message: 'Resizable selector',
                                child: RoundButton(
                                  onTapDown: () {
                                    // _keysSelection,
                                    provider.toggleDragMode(
                                        WorkspaceDragMode.resizable);
                                  },
                                  onTapUp: () {},
                                  size: _buttonSize,
                                  icon: Icons.select_all,
                                  iconColor: provider.isDragModeResizable
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Tooltip(
                                message: 'Highlight selector',
                                child: RoundButton(
                                  onTapDown: () {
                                    //_selectDraggable,
                                    provider
                                        .toggleDragMode(WorkspaceDragMode.zone);
                                  },
                                  size: _buttonSize,
                                  icon: Icons.highlight_alt,
                                  iconColor: provider.isDragModeZone
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
                                    provider.toggleDragMode(
                                        WorkspaceDragMode.click);
                                  },
                                  size: _buttonSize,
                                  icon: Icons.mouse,
                                  iconColor: provider.isDragModeClick
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColorLight,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DropdownButton(
                                    menuMaxHeight: 400,
                                    hint: Text(
                                      'Select by devices...',
                                      style: pStyle,
                                    ),
                                    underline: const SizedBox(),
                                    items: <String>[]
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e, style: pStyle),
                                            ))
                                        .toList(),
                                    onChanged: (o) {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 0),
                  child: Container(),
                ),
        ),
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => (value.isStripNotify)
              ? Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(0),
                        child: Text(
                          value.stripNotificationText,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ),
                      Tooltip(
                        message: 'Close',
                        child: RoundButton(
                          onTapDown: () {
                            value.toggleStripNotification();
                          },
                          onTapUp: () {},
                          size: 24,
                          icon: Icons.close,
                          iconColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backdrop.png"),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanDown: (details) => workspaceProvider.onPanDown(details),
              onPanUpdate: (details) => workspaceProvider.onPanUpdate(details),
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        child: Keyboard(zoomScale: _zoomScale),
                      ),
                    ),
                  ),
                  LayersStack(
                    layers: widget.layers,
                  ),
                  if (workspaceProvider.isPanning) const KeyboardSelector(),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ZoomToolbar(
                        zoomTextController: _zoomTextCtrl,
                        zoomInHandler: _zoomIn,
                        zoomExpandHandler: _zoomExpand,
                        zoomOutHandler: _zoomOut,
                        zoomCollapseHandler: _zoomCollapse,
                        zoomEndHandler: _zoomEnd,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
