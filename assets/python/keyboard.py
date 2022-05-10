import usb.core
import usb.util

class Keyboard :

    keys = {
        "escape": {
            "page": 0,
            "index": [4, 5],
            "redOpacity" : 0,
            "greenOpacity" : 0,
            "blueOpacity" : 0
        },
        "f1": {
            "page": 0,
            "index": [6],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f2": {
            "page": 0,
            "index": [7],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f3": {
            "page": 0,
            "index": [8],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f4": {
            "page": 0,
            "index": [9],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f5": {
            "page": 0,
            "index": [10],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f6": {
            "page": 0,
            "index": [11],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f7": {
            "page": 0,
            "index": [12],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f8": {
            "page": 0,
            "index": [13],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f9": {
            "page": 0,
            "index": [14],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f10": {
            "page": 0,
            "index": [15],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f11": {
            "page": 0,
            "index": [],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f12": {
            "page": 0,
            "index": [17],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "print screen": {
            "page": 0,
            "index": [18],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "power": {
            "page": 0,
            "index": [19],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "delete": {
            "page": 0,
            "index": [20, 21],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "backquote": {
            "page": 0,
            "index": [22, 23],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "1": {
            "page": 0,
            "index": [24],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "2": {
            "page": 0,
            "index": [25],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "3": {
            "page": 0,
            "index": [26],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "4": {
            "page": 0,
            "index": [27],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "5": {
            "page": 0,
            "index": [28],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "6": {
            "page": 0,
            "index": [29],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "7": {
            "page": 0,
            "index": [30],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "8": {
            "page": 0,
            "index": [31],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "9": {
            "page": 0,
            "index": [32],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "0": {
            "page": 0,
            "index": [33],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "dash": {
            "page": 0,
            "index": [34],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "equal": {
            "page": 0,
            "index": [35],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "backspace": {
            "page": 0,
            "index": [36, 37, 38, 39],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "tab": {
            "page": 0,
            "index": [40, 41, 42, 43],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "q": {
            "page": 0,
            "index": [44],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "w": {
            "page": 0,
            "index": [45],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "e": {
            "page": 0,
            "index": [46],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "r": {
            "page": 0,
            "index": [47],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "t": {
            "page": 0,
            "index": [48],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "y": {
            "page": 0,
            "index": [49],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "u": {
            "page": 0,
            "index": [50],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "i": {
            "page": 0,
            "index": [51],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "o": {
            "page": 0,
            "index": [52],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "p": {
            "page": 0,
            "index": [53],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "open bracket": {
            "page": 0,
            "index": [54],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "close bracket": {
            "page": 0,
            "index": [55],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "back slash": {
            "page": 0,
            "index": [56, 57],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "caps lock": {
            "page": 0,
            "index": [58, 59],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "a": {
            "page": 0,
            "index": [60],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "s": {
            "page": 0,
            "index": [61],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "d": {
            "page": 0,
            "index": [62],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "f": {
            "page": 0,
            "index": [63],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "g": {
            "page": 1,
            "index": [4],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "h": {
            "page": 1,
            "index": [5],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "j": {
            "page": 1,
            "index": [6],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "k": {
            "page": 1,
            "index": [7],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "l": {
            "page": 1,
            "index": [8],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "semi-colon": {
            "page": 1,
            "index": [9],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "single quote": {
            "page": 1,
            "index": [10],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "enter": {
            "page": 1,
            "index": [11, 12, 13, 14],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "left shift": {
            "page": 1,
            "index": [15, 16, 17, 18],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "z": {
            "page": 1,
            "index": [19],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "x": {
            "page": 1,
            "index": [20],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "c": {
            "page": 1,
            "index": [21],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "v": {
            "page": 1,
            "index": [22],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "b": {
            "page": 1,
            "index": [23],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "n": {
            "page": 1,
            "index": [24],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "m": {
            "page": 1,
            "index": [25],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "comma": {
            "page": 1,
            "index": [26],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "dot": {
            "page": 1,
            "index": [27],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "forward slash": {
            "page": 1,
            "index": [28],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "right shift": {
            "page": 1,
            "index": [29, 30, 31, 32],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "left ctrl": {
            "page": 1,
            "index": [33],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "fn": {
            "page": 1,
            "index": [34],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "left window key": {
            "page": 1,
            "index": [35],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "left alt": {
            "page": 1,
            "index": [36],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "space": {
            "page": 1,
            "index": [37, 38, 39, 40, 41, 42],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "right alt": {
            "page": 1,
            "index": [43],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "right ctrl": {
            "page": 1,
            "index": [44],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "left arrow": {
            "page": 1,
            "index": [45],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "up arrow": {
            "page": 1,
            "index": [46],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "down arrow": {
            "page": 1,
            "index": [47],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        },
        "right arrow": {
            "page": 1,
            "index": [48],
            "redOpacity": 0,
            "greenOpacity": 0,
            "blueOpacity": 0
        }
    }

    def __init__(self):
        # reference to keyboard hardware
        self.hardwareHandle = usb.core.find(idVendor=0x04ca, idProduct=0x00be)
        try:
            self.hardwareHandle.reset()
        except Exception as e:
            print('error resetting hardware', e)

        # reference to rgb light input and output stream from the keyboard hardware
        self.rgbLightInputStream = self.hardwareHandle[0][(2, 0)][0]
        self.rgbLightOutputStream = self.hardwareHandle[0][(2, 0)][1]

    def composePacket(self, color):
        colorCode = 0x05 if color == "red" else 0x06 if color == "green" else 0x07
        applicationId = 0x04
        packet = [None, None, None]

        page1ByteArray = bytearray(64)
        page1ByteArray[0] = colorCode
        page1ByteArray[1] = 0x00 #page number set to 1
        page1ByteArray[2] = 0x00 #index set to 0 since not required
        page1ByteArray[3] = applicationId # application id set to 1, this needs to be consistent

        page2ByteArray = bytearray(64)
        page2ByteArray[0] = colorCode
        page2ByteArray[1] = 0x01  # page number set to 2
        page2ByteArray[2] = 0x00  # index set to 0 since not required
        page2ByteArray[3] = applicationId  # application id set to 1, this needs to be consistent

        page3ByteArray = bytearray(64)
        page3ByteArray[0] = colorCode
        page3ByteArray[1] = 0x02  # page number set to 3
        page3ByteArray[2] = 0x00  # index set to 0 since not required
        page3ByteArray[3] = applicationId  # application id set to 1, this needs to be consistent

        packet[0] = page1ByteArray
        packet[1] = page2ByteArray
        packet[2] = page3ByteArray

        for key, value in self.keys.items():
            for idx in value["index"]:
                # packet[value["page"] returns the bytearray for the first page
                 packet[value["page"]][idx] = value["redOpacity"] if color == "red" \
                     else value["greenOpacity"] if color == "green" \
                     else value["blueOpacity"]
        return packet

    def sendRGBPackets(self):
        rPacketArray = self.composePacket("red")
        gPacketArray = self.composePacket("green")
        bPacketArray = self.composePacket("blue")

        allPackets = [rPacketArray, gPacketArray, bPacketArray]
        for pagedPacket in allPackets:
            for page in pagedPacket:
                self.sendPacketToHardware(page)

    def sendPacketToHardware(self, page):
        self.rgbLightOutputStream.write(page)

    def lightUpOneKey(self, keyName, red, green, blue):
        self.keys[keyName]["redOpacity"] = red
        self.keys[keyName]["greenOpacity"] = green
        self.keys[keyName]["blueOpacity"] = blue
        self.sendRGBPackets()

    def lightUpAllKeys(self, red, green, blue):
        for key in self.keys.values():
            key["redOpacity"] = red
            key["greenOpacity"] = green
            key["blueOpacity"] = blue

        self.sendRGBPackets()

    def lightUpSomeKeys(self, keys, red, green, blue):
        for key in keys:
            self.lightUpOneKey(key, red, green, blue)

    def lightningEffect(self, color):
        page1ByteArray = bytearray(64)
        page1ByteArray[0] = 0x03 #command
        page1ByteArray[1] = 0x00 #index
        page1ByteArray[2] = 0x00 #data length can be ignored
        page1ByteArray[3] = 0x01 #user id
        page1ByteArray[4] = 0x02 #effect type set to breathing (4 - 25 contains effect data)
        page1ByteArray[5] = 0x01 #show mode set to single color
        page1ByteArray[6] = 0x01 #number of colors set to single
        page1ByteArray[7] = 0x01 #speed - set to medium
        page1ByteArray[8] = 0x00 #brightness
        page1ByteArray[24] = 255
        self.sendPacketToHardware(page1ByteArray)

class Key:
    def __init__(self, name, page, index):
        self.name = name
        self.page = page
        self.index = index
        self.redOpacity = 0
        self.greenOpacity = 0
        self.blueOpacity = 0

    def setRGBColor(self, red = 0, green = 0, blue = 0):
        self.redOpacity = red
        self.greenOpacity = green
        self.blueOpacity = blue
