import 'package:flutter/material.dart';

import '../utils/activator.dart';
import '../utils/laws.dart';
import '../utils/number_formatter.dart';
import '../widgets/input_numbers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ValueNotifier<String>('');
    final controller = TextEditingController();
    final controller1 = InputNumbersController();
    final controller2 = InputNumbersController();
    final controller3 = InputNumbersController();
    final ativar = Activator(list: [
      controller1,
      controller2,
      controller3,
    ]);
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
                  controller: controller2,
                  title: 'Fc (Mpa)',
                ),
                InputNumbers(
                  controller: controller3,
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
                  label: Text('Fc'),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: ativar,
              child: const Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              builder: (context, value, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 80),
                  ),
                  onPressed: value
                      ? () {
                          // Colocar os valores do InputNumbers(a/c)
                          // dentro da lista "listaAc"
                          final listaAc = <num>[];
                          // Colocar os valores do InputNumbers(Fc (Mpa))
                          // dentro da lista "listaFc"
                          final listaFc = <num>[];
                          // Colocar os valores do InputNumbers(my (y))
                          // dentro da lista "listaMy"
                          final listaMy = <num>[];
                          final number = double.tryParse(
                              controller.text.replaceFirst(',', '.'));
                          // Só irá calcular se 
                          if (number != null) {
                            final abrams = Abrams(
                              ac: listaAc,
                              fc: listaFc,
                              lfc: number,
                            ).calc;
                            final lyse = Lyse(
                              ac: listaAc,
                              my: listaMy,
                              lac: abrams.toDouble(),
                            ).calc;
                            res.value =
                                'Abrams: ${roundX(abrams, 3)}\nLyse: ${roundX(lyse, 3)}';
                          }
                        }
                      : null,
                  child: child,
                );
              },
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
