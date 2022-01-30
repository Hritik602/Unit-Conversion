import 'package:flutter/material.dart';
import 'package:unit_conversion/Logic/length_logic.dart';
import 'package:unit_conversion/Logic/mass_logic.dart';
import 'package:unit_conversion/Logic/temp_logic.dart';
import 'package:unit_conversion/Screen/Mobile/calculation_screen.dart';

class MobileView extends StatelessWidget {
  MobileView({Key? key}) : super(key: key);
  final List<String> _unit = [
    "Length",
    "Mass",
    "Temperature",
  ];
  final List<IconData> _iconList = [
    Icons.straighten_outlined,
    Icons.monitor_weight_sharp,
    Icons.thermostat_outlined,
    Icons.attach_money_outlined,
  ];

  void moveToCalculationScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute<String>(
                builder: (context) => CalculationScreen(
                      calculationformula: LengthCalculation.lengthConversion,
                      headerName: _unit[index].toString(),
                      mapConversion: LengthCalculation.mapList,
                      conversionList: LengthCalculation.lengthList,
                    )));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute<String>(
                builder: (context) => CalculationScreen(
                    calculationformula: MassData.massFormula,
                    headerName: _unit[index].toString(),
                    mapConversion: MassData.massMap,
                    conversionList: MassData.massList)));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute<String>(
                builder: (context) => CalculationScreen(
                      calculationformula: TemperatureData.tempFormula,
                      headerName: _unit[index].toString(),
                      mapConversion: TemperatureData.tempMap,
                      conversionList: TemperatureData.tempList,
                    )));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Unit Conversion"),
        ),
        body: SafeArea(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: _unit.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () => moveToCalculationScreen(index, context),
                      child: Card(
                        elevation: 5.0,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  _iconList[index],
                                  size: 50,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  _unit[index].toString(),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })));
  }
}
