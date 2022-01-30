class TemperatureData {
  static final List<String> tempList = [
    "Celsius",
    "Fahrenheit",
    "Kelvin",
    "Rankine",
    "Reaumur"
  ];
  static final Map<String, int> tempMap = {
    "Celsius": 0,
    "Fahrenheit": 1,
    "Kelvin": 2,
    "Rankine": 3,
    "Reaumur": 4
  };
  static final dynamic tempFormula = {
    "0": [1, 33.8, 274.15, 493.47, 0.8],
    "1": [-17.223, 1, 255.928, 460.67, -13.7778],
    "2": [-272.15, -457.87, 1, 1.8, -217.72],
    "3": [-272.6, -458.67, 0.56, 1, -218.07556],
    "4": [1.25, 34.25, 274.4, 493.92, 1]
  };
}
