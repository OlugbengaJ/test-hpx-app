import '../../apps/z_light/layers/widgets/resizable_widget_controller.dart';

class LayerItemModel {
  LayerItemModel({required this.id, required this.layerText, this.visible = true, required this.controller});
  final int id;
  final String layerText;
  final bool visible;
  ResizableWidgetController controller;

}
