import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/providers/key_model.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class KeyboardKey extends StatelessWidget {
  /// [KeyboardKey] draws a key based on [KeyModel] specification.
  ///
  /// Zoom scale impacts the size of the key.
  const KeyboardKey({
    Key? key,
    this.onTapHandler,
    required this.zoomScale,
  }) : super(key: key);

  final VoidCallback? onTapHandler;
  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    // Gets access to the widget's position (offset) in the widget tree.
    final box = context.findRenderObject() as RenderBox?;
    final modeProvider = Provider.of<ModeProvider>(context, listen: false);

    return Stack(
      children: [
        Material(
          child: Consumer<WorkspaceProvider>(
            builder: (context, workspaceProvider, child) {
              return InkWell(
                onTap: onTapHandler,
                // onTap: () => workspaceProvider.toggleStripNotification('yes'),
                // onTap: () => workspaceProvider.toggleModal([
                //   const Text('yes we got something going'),
                // ]),

                // listens to key changes and allows updating this key instance
                child: Consumer<KeyModel>(
                  builder: (context, keyModel, child) => KeyRRect(
                    keyModel: _updateKeyInfo(
                        workspaceProvider, modeProvider, keyModel, box),
                    zoomScale: zoomScale,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

KeyModel _updateKeyInfo(
  WorkspaceProvider provider,
  ModeProvider modeProvider,
  KeyModel keyModel,
  RenderBox? renderBox,
) {
  final isWidgetInZone = provider.isWidgetInZone(renderBox);

  final currentMode = modeProvider.currentMode;
  List<Color> colors = [Colors.orange];

  if (currentMode.currentColor.runtimeType.toString() == 'List<Color>') {
    colors = currentMode.currentColor as List<Color>;
  }

  if (provider.isDragModeZone || provider.isDragModeResizable) {
    keyModel.selectKey(isWidgetInZone);
    // if (isWidgetInZone == true && provider.isDragModeZone) {
    if (isWidgetInZone == true) {
      keyModel.setPathColors(colors);
      //(provider.animColors);
    }
  }

  if (provider.isDragModeClick &&
      isWidgetInZone == true &&
      !keyModel.isSelected) {
    keyModel.selectKey(isWidgetInZone);
  } else if (provider.isDragModeClick &&
      isWidgetInZone == true &&
      keyModel.isSelected) {
    keyModel.unSelectKey();
  }

  return keyModel;
}
