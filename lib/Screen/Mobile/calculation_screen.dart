import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  CalculationScreen(
      {Key? key,
      required this.mapConversion,
      required this.conversionList,
      required this.headerName,
      required this.calculationformula})
      : super(key: key);
  /*It determine from which of type to which type should be converted */
  Map<String, int> mapConversion;
  List<String> conversionList;
  String? headerName;
  dynamic calculationformula;

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  void convert(double value, String from, String to) {
    print(widget.mapConversion[from]);
    int? numFrom = widget.mapConversion[from];
    int? numTo = widget.mapConversion[to];
    var multiplier = widget.calculationformula[numFrom.toString()][numTo];
    double result = value * multiplier;
    if (result == 0) {
      _result = 'This conversion cannot be performed';
    } else {
      _result =
          '${_numberfrom.toString()} ${_startMeasure.toString()} $result ${_convertedMeasure.toString()}';
    }
    setState(() {
      _result = _result;
    });
  }

  String? _startMeasure;
  String? _convertedMeasure;
  double? _numberfrom;
  String? _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.headerName.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    constraints: BoxConstraints(
                      maxWidth: 200,
                    ),
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
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      elevation: 10,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      isExpanded: true,
                      items: widget.conversionList.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _startMeasure = (value as String?)!;
                        });
                      },
                      value:
                          _startMeasure ?? widget.conversionList[0].toString(),
                    ),
                  ),
                ),
                Text(
                  "To",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      elevation: 0,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      isExpanded: true,
                      items: widget.conversionList.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _convertedMeasure = (value as String?)!;
                        });
                      },
                      value: _convertedMeasure ??
                          widget.conversionList[0].toString(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomText(
              text: (_result == null ? "0" : _result.toString()),
              size: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  convert(_numberfrom!.toDouble(), _startMeasure!,
                      _convertedMeasure!);
                },
                child: const Text("Convert")),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  CustomText({Key? key, this.size, this.text}) : super(key: key);
  String? text;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(fontSize: size ?? 24),
    );
  }
}
