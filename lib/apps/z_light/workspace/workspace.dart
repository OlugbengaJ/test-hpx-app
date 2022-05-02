import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';
import 'package:hpx/apps/z_light/workspace/widgets/zoom_toolbar.dart';
import 'package:hpx/providers/keyboard/keys_provider.dart';
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
  final _duration = const Duration(milliseconds: 100);

  final double _buttonSize = 24.0;

  /// zoomTextChanged ensure user enters only digits
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

  /// zoomEnd terminates continuous zoom
  ///
  /// timer is canceled to stop zooming by the duration specified
  void _zoomEnd() {
    _timer.cancel();
  }

  /// updateZoom sets the zoom text (without fractions) and zoom scale.
  void _updateZoom() {
    _zoomTextCtrl.text = '${_zoomValue.ceil()}';
  }

  /// zoomIn increases the zoomValue only up to the zoomIn threshold
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

  /// zoomExpanded sets the zoomValue to half the zoomIn threshold.
  void _zoomExpand() {
    setState(() {
      _zoomValue = _zoomInThreshold / 2;
      _updateZoom();
    });
  }

  _keysSelection() {
    context.read<KeySelectorProvider>().toggleKeySelector(true);
  }

  _selectDraggable() {
    context.read<KeySelectorProvider>().toggleKeySelector(false);
  }

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
    return Column(
      children: [
        /// Workspace area must be constrained to avoid width/height overflow
        /// i.e. unconstrained error, and ultimately unexpected view behavior.
        ///
        /// Setting width/height with double.infinity is not recommended,
        /// instead we want to keep the view constrained and have excessive
        /// sub-widgets cliped only to the view.
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => (value.showLighting)
              ? ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 90, //MediaQuery.of(context).size.height * 0.12
                  ),
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 20, right: 10, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Zone Selection',
                            textAlign: TextAlign.left,
                            style: h4Style,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: RoundButton(
                                onTapDown: _keysSelection,
                                onTapUp: () {},
                                size: _buttonSize,
                                icon: Icons.select_all,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: RoundButton(
                                onTapDown: _selectDraggable,
                                onTapUp: () {},
                                size: _buttonSize,
                                icon: Icons.highlight_alt,
                              ),
                            ),
                            RoundButton(
                              onTapDown: () {},
                              onTapUp: () {},
                              size: _buttonSize,
                              icon: Icons.mouse,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => (value.showStripNotification)
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
          child: Stack(
            alignment: Alignment.bottomLeft,
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/backdrop.png"),
                    repeat: ImageRepeat.repeat,
                  ),
                ),
                child: LayersStack(
                  layers: widget.layers,
                ),
              ),

              /// Keyboard widget takes a zoom scale which is applied to all keys.
              ///
              /// This ensures seamless zooming of the entire keyboard.
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return InteractiveViewer(
                    onInteractionUpdate: (details) {
                      // debugPrint('max height ${constraints.maxHeight}');
                      // debugPrint('iv update=> scale: ${details.scale}');
                      // final v = _zoomScale * details.scale;
                    },
                    minScale: 0.8,
                    maxScale: 4,
                    child: Keyboard(zoomScale: _zoomScale),
                  );
                },
              ),
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
      ],
    );
  }
}
