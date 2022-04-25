import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:ionicons/ionicons.dart';

import '../layers/widgets/layer_stack_item.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key, required this.layers, required this.currentIndex})
      : super(key: key);
  final List<LayerStackItem> layers;
  final int currentIndex;

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  double zoomValue = 1.0;
  TextEditingController zoomController = TextEditingController();

  void _zoomWorkspaceIn() {
    setState(() {
      zoomValue -= 0.01;
      zoomController.text = (zoomValue * 100).toString() + "%";
    });
  }

  void _zoomWorkspaceOut() {
    setState(() {
      zoomValue += 0.01;
      zoomController.text = (zoomValue * 100).toString() + "%";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Transform.scale(
              scale: zoomValue,
              child: LayersStack(
                layers: widget.layers,
                currentIndex: widget.currentIndex,
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 15.0),
                width: 300,
                height: 60,
                color: Colors.grey.shade900,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.transparent),
                          child: const Icon(
                            Ionicons.add_circle,
                            size: 30.0,
                          ),
                          onPressed: () {
                            _zoomWorkspaceOut();
                          },
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Column(children: [
                        SizedBox(
                            width: 300,
                            height: 30,
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              obscureText: false,
                              controller: zoomController,
                              // maxLength: 3,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ))
                      ]),
                    ),
                    Expanded(
                      child: Column(children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.transparent),
                          child: const Icon(
                            Ionicons.remove_circle,
                            size: 30.0,
                          ),
                          onPressed: () {
                            _zoomWorkspaceIn();
                          },
                        ),
                      ]),
                    ),
                    Container(margin: const EdgeInsets.only(right: 20.0)),
                    Expanded(
                      child: Column(children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.transparent),
                          child: const Icon(
                            Ionicons.scan_outline,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        )
                      ]),
                    ),
                    Expanded(
                      child: Column(children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.transparent),
                          child: const Icon(
                            Ionicons.expand_outline,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        )
                      ]),
                    ),
                  ],
                ),
              )),
        ],
      ),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backdrop.png"),
              repeat: ImageRepeat.repeat)),
    );
  }
}
