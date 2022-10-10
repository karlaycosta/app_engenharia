import 'package:app_engenharia/utils/number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/laws.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ValueNotifier<String>('');
    final ac = <num>[0.35, 0.46, 0.68];
    final fc = <num>[45, 30, 15];
    final my = <num>[3.5, 5, 7.5];
    const lfc = 13.695;
    final abrams = Abrams(ac: ac, fc: fc, lfc: lfc).calc;
    final lyse = Lyse(ac: ac, my: my, lac: abrams.toDouble()).calc;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Leis de Dosagem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: TextFormField(
                inputFormatters: [
                  NumberFormatter(),
                ],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
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
                res.value = roundX(Abrams(ac: ac, fc: fc, lfc: lfc).calc, 3);
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
            ValueListenableBuilder(
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
