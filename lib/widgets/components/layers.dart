import 'package:flutter/material.dart';

Future<void> layerAlertDialog(BuildContext context) async {
  print("Alert dialod");
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Shortcut mode already available'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('You are about to create a new layer with shortcut color mode.'),
              const Text('You can rather create a sublayer from the existing shortcut color mode'),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"),
                      
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        
      );
    },
  );
}