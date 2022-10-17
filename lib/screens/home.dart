import 'package:flutter/material.dart';

import '../utils/laws.dart';
import '../utils/number_formatter.dart';
import '../widgets/input_numbers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ValueNotifier<String>('');
    final ac = <num>[0.35, 0.46, 0.68];
    final fc = <num>[45, 30, 15];
    final my = <num>[3.5, 5, 7.5];
    final controller = TextEditingController();
    final controller1 = InputNumbersController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Leis de Dosagem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                InputNumbers(
                  controller: controller1,
                  title: 'a/c',
                ),
                InputNumbers(
                  title: 'Fc (Mpa)',
                ),
                InputNumbers(
                  title: 'm (y)',
                ),
              ],
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: controller,
                inputFormatters: [
                  NumberFormatter(),
                ],
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.pin_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 80),
              ),
              onPressed: () {
                // print(controller1.v1);
                // final number =
                //     double.tryParse(controller.text.replaceFirst(',', '.'));
                // if (number != null) {
                //   final abrams = Abrams(ac: ac, fc: fc, lfc: number).calc;
                //   final lyse =
                //       Lyse(ac: ac, my: my, lac: abrams.toDouble()).calc;
                //   res.value =
                //       'Abrams: ${roundX(abrams, 3)}\nLyse: ${roundX(lyse, 3)}';
                // }
              },
              child: const Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ValueListenableBuilder<String>(
              valueListenable: res,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: const TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
