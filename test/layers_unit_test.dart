// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/apps/zlightspace_providers/layers_provider/layers.dart';

void main() {
  final areaHeight = Get.height * 0.70;
  final areaWidth = Get.width * 0.70;

  ResizableWidgetController controller = ResizableWidgetController(
    initialPosition: Offset(areaWidth / 2, areaHeight / 2),
    areaHeight: areaHeight,
    areaWidth: areaWidth,
    height: areaHeight / 2,
    width: areaWidth / 2,
    minWidth: 50,
    minHeight: 50,
  );

  LayerItemModel itemModel =
      LayerItemModel(id: 1, layerText: "layerText", controller: controller);
  LayerItemModel itemModel2 =
      LayerItemModel(id: 2, layerText: "layerText 2", controller: controller);
  LayersProvider provider = LayersProvider();

  /// Create layer, using the [LayersProvider] and [LayerItemModel]. Keep track of all layers available
  ///
  /// A layer is added to the [layeritems] and inserted into the [stackedLayeritems]
  test('Create layers', () {
    // Add one layer so length should be 1
    provider.add(itemModel);
    expect(provider.layeritems.length, 1);
    expect(provider.stackedLayeritems.length, 1);

    // Add another one layer so length should be 2
    provider.add(itemModel2);
    expect(provider.layeritems.length, 2);
    expect(provider.stackedLayeritems.length, 2);

    // When adding a layer, the layer is added to the layeritems but inserted into the stackedLayeritems
    expect(
        provider.layeritems.last,
        provider.stackedLayeritems
            .first); // layeritems.first == stackedLayeritems.lasts
  });

  /// Rearrange layers, using the LayersProvider. Keep track of all layers available
  test('Update layer', () {});

  /// Delete layers, using the LayersProvider. Keep track of all layers available
  test('Delete layers', () {});

  /// Duplicate layers, using the LayersProvider. Keep track of all layers available
  test('Duplicate layers', () {});

  /// Rearrange layers, using the LayersProvider. Keep track of all layers available
  test('Rearrange layer', () {});
}
