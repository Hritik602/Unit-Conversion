import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> measure = [
    'meter',
    'kilometer',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds',
    'ounces'
  ];
  final Map<String, int> _measureMap = {
    'meter': 0,
    'kilometer': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds': 6,
    'ounces': 7,
  };
  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };
  void convert(double value, String from, String to) {
    int? numFrom = _measureMap[from];
    int? numTo = _measureMap[to];
    var multiplier = _formulas[numFrom.toString()][numTo];
    double result = value * multiplier;
    if (result == 0) {
      _result = 'This conversion cannot be performed';
    } else {
      _result =
          '${_numberfrom.toString()} ${_startMeasure.toString()} ${result} ${_convertedMeasure.toString()}';
    }
    setState(() {
      _result = _result;
    });
  }

  String? _startMeasure;
  String? _convertedMeasure;
  String? _result;
  double? _numberfrom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(
            //   flex: 1,
            // ),
            const CustomText(
              text: "Value",
              size: 28,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Enter the value",
                    border: UnderlineInputBorder()),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  setState(() {
                    _numberfrom = rv;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(text: "From"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                isExpanded: true,
                items: measure.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value as String?;
                  });
                },
                value: _startMeasure,
              ),
            ),
            const CustomText(text: "To"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                isExpanded: true,
                items: measure.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _convertedMeasure = value as String?;
                  });
                },
                value: _convertedMeasure,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  convert(_numberfrom!.toDouble(), _startMeasure!,
                      _convertedMeasure!);
                },
                child: Text("Convert")),
            CustomText(
              text: (_result == null ? "0" : _result.toString()),
              size: 30,
            )
          ],
        ),
      )),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.size}) : super(key: key);
  final String text;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 24,
      ),
    );
  }
}
