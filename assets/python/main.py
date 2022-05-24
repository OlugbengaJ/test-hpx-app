import argparse
from keyboard import Keyboard

keyboard = Keyboard()
#keyboard.lightningEffect(100)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    actionsGroup = parser.add_mutually_exclusive_group()
    actionsGroup.add_argument("-o", "--lightUpOneKey",
                        help="Lights up the specified key with the specified color", nargs=4
                        )

    actionsGroup.add_argument("-s", "--lightUpSomeKeys",
                              help="Lights up the specified keys with the specified color",
                              nargs='+')

    actionsGroup.add_argument("-a", "--lightUpAllKeys",
                              nargs=3, type=int,
                              help="Lights up all the keys on the keyboard with the specified color")
    arguments = parser.parse_args()

    if arguments.lightUpOneKey:
        keyName, red, green, blue = arguments.lightUpOneKey
        keyboard.lightUpOneKey(keyName, int(red), int(green), int(blue))
    elif arguments.lightUpSomeKeys:
        if len(arguments.lightUpSomeKeys) > 3:
            blue = arguments.lightUpSomeKeys.pop()
            green = arguments.lightUpSomeKeys.pop()
            red = arguments.lightUpSomeKeys.pop()

            keyboard.lightUpSomeKeys(arguments.lightUpSomeKeys, int(red), int(green), int(blue))
    elif arguments.lightUpAllKeys:
        red, green, blue = arguments.lightUpAllKeys
        keyboard.lightUpAllKeys(red, green, blue)