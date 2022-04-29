import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_constants.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard.dart';
import 'package:hpx/apps/z_light/workspace/widgets/zoom_toolbar.dart';
import 'package:hpx/widgets/theme.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key, required this.layers, required this.currentView})
      : super(key: key);

  final List<LayerStackItem> layers;
  final AppConstants currentView;

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

  /// updateZoom sets the zoom text (without fractions) and zoom scale.
  void _updateZoom() {
    _zoomTextCtrl.text = '${_zoomValue.ceil()}';
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
        // TODO: toggle visibility based on Workspace/Lighting Options

        /// Workspace area must be constrained to avoid width/height overflow
        /// i.e. unconstrained error, and ultimately unexpected view behavior.
        ///
        /// Setting width/height with double.infinity is not recommended,
        /// instead we want to keep the view constrained and have excessive
        /// sub-widgets cliped only to the view.
        if (widget.currentView == AppConstants.lighting)
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 80),
            child: Container(
              margin:
                  const EdgeInsets.only(right: 5.0, top: 20.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Zone Selection',
                    textAlign: TextAlign.left,
                    style: h4Style,
                  ),
                ],
              ),
            ),
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
                  currentIndex: 0,
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
                    child: Draggable<bool>(
                        data: true,
                        feedback: Container(
                          color: Colors.white.withOpacity(0.4),
                          height: 100,
                          width: 100,
                        ),
                        child: Keyboard(zoomScale: _zoomScale)),
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
                    // zoomTextChangedHandler: _zoomTextChanged,
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
