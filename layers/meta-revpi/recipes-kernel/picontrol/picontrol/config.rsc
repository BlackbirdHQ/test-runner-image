{
  "Devices": [
    {
      "catalogNr": "RevPiCore",
      "GUID": "20c6848a-5077-f310-ae27-6b4878a21690",
      "id": "device_RevPiCore_20170404_1_2_001",
      "type": "BASE",
      "productType": "95",
      "position": "0",
      "name": "RevPi Core V1.2",
      "bmk": "RevPi Core V1.2",
      "inpVariant": 0,
      "outVariant": 0,
      "comment": "This is a RevPiCore Device",
      "offset": 0,
      "inp": {
        "0": ["RevPiStatus", "0", "8", "0", true, "0000", "", ""],
        "1": ["RevPiIOCycle", "0", "8", "1", true, "0001", "", ""],
        "2": ["RS485ErrorCnt", "0", "16", "2", false, "0002", "", ""],
        "3": ["Core_Temperatur", "0", "8", "4", false, "0003", "", ""],
        "4": ["Core_Frequency", "0", "8", "5", false, "0004", "", ""]
      },
      "out": {
        "0": ["RevPiLED", "0", "8", "6", true, "0005", "", ""],
        "1": ["RS485ErrorLimit1", "10", "16", "7", false, "0006", "", ""],
        "2": ["RS485ErrorLimit2", "1000", "16", "9", false, "0007", "", ""]
      },
      "mem": {},
      "extend": {}
    },
    {
      "catalogNr": "RevPiDIO",
      "GUID": "dd41b11a-fb0c-2ad6-4ad8-65b412c8f308",
      "id": "device_RevPiDIO_20160818_1_0_001",
      "type": "LEFT_RIGHT",
      "productType": "96",
      "position": "32",
      "name": "RevPi DIO",
      "bmk": "RevPi DIO",
      "inpVariant": 0,
      "outVariant": 0,
      "comment": "",
      "offset": 11,
      "inp": {
        "0": ["I_1", "0", "1", "0", true, "0000", "", "0"],
        "1": ["I_2", "0", "1", "0", true, "0001", "", "1"],
        "2": ["I_3", "0", "1", "0", true, "0002", "", "2"],
        "3": ["I_4", "0", "1", "0", true, "0003", "", "3"],
        "4": ["I_5", "0", "1", "0", true, "0004", "", "4"],
        "5": ["I_6", "0", "1", "0", true, "0005", "", "5"],
        "6": ["I_7", "0", "1", "0", true, "0006", "", "6"],
        "7": ["I_8", "0", "1", "0", true, "0007", "", "7"],
        "8": ["I_9", "0", "1", "0", true, "0008", "", "8"],
        "9": ["I_10", "0", "1", "0", true, "0009", "", "9"],
        "10": ["I_11", "0", "1", "0", true, "0010", "", "10"],
        "11": ["I_12", "0", "1", "0", true, "0011", "", "11"],
        "12": ["I_13", "0", "1", "0", true, "0012", "", "12"],
        "13": ["I_14", "0", "1", "0", true, "0013", "", "13"],
        "14": ["I_15", "0", "1", "0", true, "0014", "", "14"],
        "15": ["I_16", "0", "1", "0", true, "0015", "", "15"],
        "16": ["Output_Status", "0", "16", "2", false, "0016", "", ""],
        "17": ["Status", "0", "16", "4", false, "0017", "", ""],
        "18": ["Counter_1", "0", "32", "6", false, "0018", "", ""],
        "19": ["Counter_2", "0", "32", "10", false, "0019", "", ""],
        "20": ["Counter_3", "0", "32", "14", false, "0020", "", ""],
        "21": ["Counter_4", "0", "32", "18", false, "0021", "", ""],
        "22": ["Counter_5", "0", "32", "22", false, "0022", "", ""],
        "23": ["Counter_6", "0", "32", "26", false, "0023", "", ""],
        "24": ["Counter_7", "0", "32", "30", false, "0024", "", ""],
        "25": ["Counter_8", "0", "32", "34", false, "0025", "", ""],
        "26": ["Counter_9", "0", "32", "38", false, "0026", "", ""],
        "27": ["Counter_10", "0", "32", "42", false, "0027", "", ""],
        "28": ["Counter_11", "0", "32", "46", false, "0028", "", ""],
        "29": ["Counter_12", "0", "32", "50", false, "0029", "", ""],
        "30": ["Counter_13", "0", "32", "54", false, "0030", "", ""],
        "31": ["Counter_14", "0", "32", "58", false, "0031", "", ""],
        "32": ["Counter_15", "0", "32", "62", false, "0032", "", ""],
        "33": ["Counter_16", "0", "32", "66", false, "0033", "", ""]
      },
      "out": {
        "0": ["O_1", "0", "1", "70", true, "0034", "", "0"],
        "1": ["O_2", "0", "1", "70", true, "0035", "", "1"],
        "2": ["O_3", "0", "1", "70", true, "0036", "", "2"],
        "3": ["O_4", "0", "1", "70", true, "0037", "", "3"],
        "4": ["O_5", "0", "1", "70", true, "0038", "", "4"],
        "5": ["O_6", "0", "1", "70", true, "0039", "", "5"],
        "6": ["O_7", "0", "1", "70", true, "0040", "", "6"],
        "7": ["O_8", "0", "1", "70", true, "0041", "", "7"],
        "8": ["O_9", "0", "1", "70", true, "0042", "", "8"],
        "9": ["O_10", "0", "1", "70", true, "0043", "", "9"],
        "10": ["O_11", "0", "1", "70", true, "0044", "", "10"],
        "11": ["O_12", "0", "1", "70", true, "0045", "", "11"],
        "12": ["O_13", "0", "1", "70", true, "0046", "", "12"],
        "13": ["O_14", "0", "1", "70", true, "0047", "", "13"],
        "14": ["O_15", "0", "1", "70", true, "0048", "", "14"],
        "15": ["O_16", "0", "1", "70", true, "0049", "", "15"],
        "16": ["PWM_1", "0", "8", "72", false, "0050", "", ""],
        "17": ["PWM_2", "0", "8", "73", false, "0051", "", ""],
        "18": ["PWM_3", "0", "8", "74", false, "0052", "", ""],
        "19": ["PWM_4", "0", "8", "75", false, "0053", "", ""],
        "20": ["PWM_5", "0", "8", "76", false, "0054", "", ""],
        "21": ["PWM_6", "0", "8", "77", false, "0055", "", ""],
        "22": ["PWM_7", "0", "8", "78", false, "0056", "", ""],
        "23": ["PWM_8", "0", "8", "79", false, "0057", "", ""],
        "24": ["PWM_9", "0", "8", "80", false, "0058", "", ""],
        "25": ["PWM_10", "0", "8", "81", false, "0059", "", ""],
        "26": ["PWM_11", "0", "8", "82", false, "0060", "", ""],
        "27": ["PWM_12", "0", "8", "83", false, "0061", "", ""],
        "28": ["PWM_13", "0", "8", "84", false, "0062", "", ""],
        "29": ["PWM_14", "0", "8", "85", false, "0063", "", ""],
        "30": ["PWM_15", "0", "8", "86", false, "0064", "", ""],
        "31": ["PWM_16", "0", "8", "87", false, "0065", "", ""]
      },
      "mem": {
        "0": ["InputMode_1", "1", "8", "88", false, "0066", "", ""],
        "1": ["InputMode_2", "1", "8", "89", false, "0067", "", ""],
        "2": ["InputMode_3", "1", "8", "90", false, "0068", "", ""],
        "3": ["InputMode_4", "1", "8", "91", false, "0069", "", ""],
        "4": ["InputMode_5", "1", "8", "92", false, "0070", "", ""],
        "5": ["InputMode_6", "1", "8", "93", false, "0071", "", ""],
        "6": ["InputMode_7", "0", "8", "94", false, "0072", "", ""],
        "7": ["InputMode_8", "0", "8", "95", false, "0073", "", ""],
        "8": ["InputMode_9", "0", "8", "96", false, "0074", "", ""],
        "9": ["InputMode_10", "0", "8", "97", false, "0075", "", ""],
        "10": ["InputMode_11", "0", "8", "98", false, "0076", "", ""],
        "11": ["InputMode_12", "0", "8", "99", false, "0077", "", ""],
        "12": ["InputMode_13", "0", "8", "100", false, "0078", "", ""],
        "13": ["InputMode_14", "0", "8", "101", false, "0079", "", ""],
        "14": ["InputMode_15", "0", "8", "102", false, "0080", "", ""],
        "15": ["InputMode_16", "0", "8", "103", false, "0081", "", ""],
        "16": ["InputDebounce", "0", "16", "104", false, "0082", "", ""],
        "17": ["OutputPushPull", "0", "16", "106", false, "0083", "", ""],
        "18": ["OutputOpenLoadDetect", "0", "16", "108", false, "0084", "", ""],
        "19": ["OutputPWMActive", "0", "16", "110", false, "0085", "", ""],
        "20": ["OutputPWMFrequency", "1", "8", "112", false, "0086", "", ""]
      },
      "extend": {}
    },
    {
      "catalogNr": "RevPiAIO",
      "GUID": "821e54db-4563-d2a4-bc78-142422213299",
      "id": "device_RevPiAIO_20170301_1_0_001",
      "type": "LEFT_RIGHT",
      "productType": "103",
      "position": 33",
      "name": "RevPi AIO",
      "bmk": "RevPi AIO",
      "inpVariant": 0,
      "outVariant": 0,
      "comment": "",
      "offset": 0,
      "inp": {
        "0": ["InputValue_1", "0", "16", "0", false, "0000", "", ""],
        "1": ["InputValue_2", "0", "16", "2", false, "0001", "", ""],
        "2": ["InputValue_3", "0", "16", "4", false, "0002", "", ""],
        "3": ["InputValue_4", "0", "16", "6", false, "0003", "", ""],
        "4": ["InputStatus_1", "0", "8", "8", false, "0004", "", ""],
        "5": ["InputStatus_2", "0", "8", "9", false, "0005", "", ""],
        "6": ["InputStatus_3", "0", "8", "10", false, "0006", "", ""],
        "7": ["InputStatus_4", "0", "8", "11", false, "0007", "", ""],
        "8": ["RTDValue_1", "0", "16", "12", false, "0008", "", ""],
        "9": ["RTDValue_2", "0", "16", "14", false, "0009", "", ""],
        "10": ["RTDStatus_1", "0", "8", "16", false, "0010", "", ""],
        "11": ["RTDStatus_2", "0", "8", "17", false, "0011", "", ""],
        "12": ["OutputStatus_1", "0", "8", "18", false, "0012", "", ""],
        "13": ["OutputStatus_2", "0", "8", "19", false, "0013", "", ""]
      },
      "out": {
        "0": ["OutputValue_1", "0", "16", "20", false, "0014", "", ""],
        "1": ["OutputValue_2", "0", "16", "22", false, "0015", "", ""]
      },
      "mem": {
        "0": [
          "Input1Range",
          "6",
          "8",
          "24",
          false,
          "0016",
          "You must use wire bridges for current measurement!",
          ""
        ],
        "1": ["Input1Multiplier", "1", "16", "25", false, "0017", "", ""],
        "2": ["Input1Divisor", "1", "16", "27", false, "0018", "", ""],
        "3": ["Input1Offset", "0", "16", "29", false, "0019", "", ""],
        "4": [
          "Input2Range",
          "6",
          "8",
          "31",
          false,
          "0020",
          "You must use wire bridges for current measurement!",
          ""
        ],
        "5": ["Input2Multiplier", "1", "16", "32", false, "0021", "", ""],
        "6": ["Input2Divisor", "1", "16", "34", false, "0022", "", ""],
        "7": ["Input2Offset", "0", "16", "36", false, "0023", "", ""],
        "8": [
          "Input3Range",
          "6",
          "8",
          "38",
          false,
          "0024",
          "You must use wire bridges for current measurement!",
          ""
        ],
        "9": ["Input3Multiplier", "1", "16", "39", false, "0025", "", ""],
        "10": ["Input3Divisor", "1", "16", "41", false, "0026", "", ""],
        "11": ["Input3Offset", "0", "16", "43", false, "0027", "", ""],
        "12": [
          "Input4Range",
          "6",
          "8",
          "45",
          false,
          "0028",
          "You must use wire bridges for current measurement!",
          ""
        ],
        "13": ["Input4Multiplier", "1", "16", "46", false, "0029", "", ""],
        "14": ["Input4Divisor", "1", "16", "48", false, "0030", "", ""],
        "15": ["Input4Offset", "0", "16", "50", false, "0031", "", ""],
        "16": [
          "ADC_DataRate",
          "5",
          "8",
          "52",
          false,
          "0032",
          "Use lowest value for highest precision and a maximum 50 Hz suppression",
          ""
        ],
        "17": ["RTD1Type", "0", "8", "53", false, "0033", "", ""],
        "18": [
          "RTD1Wiring",
          "0",
          "8",
          "54",
          false,
          "0034",
          "You must use wire bridges for 2-wire sensors!",
          ""
        ],
        "19": ["RTD1Multiplier", "1", "16", "55", false, "0035", "", ""],
        "20": ["RTD1Divisor", "1", "16", "57", false, "0036", "", ""],
        "21": ["RTD1Offset", "0", "16", "59", false, "0037", "", ""],
        "22": ["RTD2Type", "0", "8", "61", false, "0038", "", ""],
        "23": [
          "RTD2Wiring",
          "0",
          "8",
          "62",
          false,
          "0039",
          "You must use wire bridges for 2-wire sensors!",
          ""
        ],
        "24": ["RTD2Multiplier", "1", "16", "63", false, "0040", "", ""],
        "25": ["RTD2Divisor", "1", "16", "65", false, "0041", "", ""],
        "26": ["RTD2Offset", "0", "16", "67", false, "0042", "", ""],
        "27": ["Output1Range", "2", "8", "69", false, "0043", "", ""],
        "28": [
          "Output1EnableSlew",
          "0",
          "8",
          "70",
          false,
          "0044",
          "Enable slew rate deceleration",
          ""
        ],
        "29": [
          "Output1SlewStepSize",
          "0",
          "8",
          "71",
          false,
          "0045",
          "Slew rate step size",
          ""
        ],
        "30": [
          "Output1SlewClock",
          "0",
          "8",
          "72",
          false,
          "0046",
          "lock rate of slew rate deceleration in kHz",
          ""
        ],
        "31": ["Output1Multiplier", "1", "16", "73", false, "0047", "", ""],
        "32": ["Output1Divisor", "1", "16", "75", false, "0048", "", ""],
        "33": ["Output1Offset", "0", "16", "77", false, "0049", "", ""],
        "34": ["Output2Range", "2", "8", "79", false, "0050", "", ""],
        "35": [
          "Output2EnableSlew",
          "0",
          "8",
          "80",
          false,
          "0051",
          "Enable slew rate deceleration",
          ""
        ],
        "36": [
          "Output2SlewStepSize",
          "0",
          "8",
          "81",
          false,
          "0052",
          "Slew rate step size",
          ""
        ],
        "37": [
          "Output2SlewClock",
          "0",
          "8",
          "82",
          false,
          "0053",
          "lock rate of slew rate deceleration in kHz",
          ""
        ],
        "38": ["Output2Multiplier", "1", "16", "83", false, "0054", "", ""],
        "39": ["Output2Divisor", "1", "16", "85", false, "0055", "", ""],
        "40": ["Output2Offset", "0", "16", "87", false, "0056", "", ""]
      },
      "extend": {}
    }
  ],
  "Connections": []
}