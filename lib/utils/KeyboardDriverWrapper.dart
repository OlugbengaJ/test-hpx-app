import 'dart:io';

class KeyboardDriverWrapper {
  static const _outputFilePath = "/dev/usb/rgb_kbd2";

  ///Singleton design pattern, so that this class cannot be instantiated
  KeyboardDriverWrapper._();

  static final KeyboardDriverWrapper instance = KeyboardDriverWrapper._();
  static late File _outputFile;

  ///Open a file in write mode and returns it
  static File get outputFile {
    _outputFile = File(_outputFilePath);
    return _outputFile;
  }

  ///Turns the keyboard light on
  static powerKeyboardOn() async {
    await outputFile.writeAsString("SPO", flush: true);
  }

  ///Turns the keyboard light off
  static powerKeyboardOff() async {
    await outputFile.writeAsString("SPF", flush: true);
  }

  static writeCombinedCommand(command) {
    outputFile.writeAsBytes(command);
  }
}