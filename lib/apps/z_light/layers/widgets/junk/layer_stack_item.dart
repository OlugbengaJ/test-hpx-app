// import 'package:flutter/material.dart';
// import 'package:hpx/apps/z_light/layers/widgets/junk/stateful_resizable.dart';
// import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
// import 'package:hpx/providers/layers_provider/layers.dart';
// import 'package:provider/provider.dart';

// class LayerStackItem extends StatefulWidget {
//   const LayerStackItem({Key? key, required this.layerItemModel})
//       : super(key: key);
//   final LayerItemModel layerItemModel;

//   @override
//   State<LayerStackItem> createState() => _LayerStackItemState();
// }

// class _LayerStackItemState extends State<LayerStackItem> {
//   double dragWidgetSize = 5;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LayersProvider>(builder: (context, provider, child) {
//       return Visibility(
//         visible: widget.layerItemModel.visibleOnStack,
//         child: Container(
//           color: Colors.transparent,
//           child: StatefulResizableWidget(
//             dragWidgetHeight: dragWidgetSize,
//             dragWidgetWidth: dragWidgetSize,
//             controller: widget.layerItemModel.controller,
//             dragWidget: Container(
//               height: dragWidgetSize,
//               width: dragWidgetSize,              
//               decoration: const BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: Colors.white,
//               ),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
