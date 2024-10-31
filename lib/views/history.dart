import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/calculator_provider.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {

    const History({super.key});
    
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xff343131),
        child: Column(
          children: [
            const DrawerHeader(
                child: Text(
              "Calculation History",
              style: TextStyle(color: Colors.white),
            )),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                  child: ListView.builder(
                      itemCount:
                          context.watch<CalculatorProvider>().history.length,
                      itemBuilder: (context, index) {
                        List<String> history =
                            context.watch<CalculatorProvider>().history;
                        return Padding(
                            padding: const EdgeInsets.all(8),
                            child:Card(
                          key: ValueKey(index),
                          child: ListTile(
                            title: Text(history[index]),
                          ),
                        ));
                      })),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                        context.read<CalculatorProvider>().clearHistory();
                      }, child: const Text("Clear History")),
            )
          ],
        ));
  }
}
