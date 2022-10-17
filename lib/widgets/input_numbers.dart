import 'package:flutter/material.dart';

import '../utils/number_formatter.dart';

class InputNumbers extends StatelessWidget {
  final String title;
  final InputNumbersController? controller;
  InputNumbers({
    super.key,
    this.title = '',
    this.controller,
  });

  final v1 = TextEditingController();
  final v2 = TextEditingController();
  final v3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller?._input = this;
    const sizedBox = SizedBox(height: 12);
    final formatter = NumberFormatter();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            sizedBox,
            TextFormField(
              controller: v1,
              textAlign: TextAlign.center,
              inputFormatters: [
                formatter,
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            sizedBox,
            TextFormField(
              controller: v2,
              textAlign: TextAlign.center,
              inputFormatters: [
                formatter,
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            sizedBox,
            TextFormField(
              controller: v3,
              textAlign: TextAlign.center,
              inputFormatters: [
                formatter,
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputNumbersController {
  //Colocar o acesso direto a:
  // Valor1 -> v1
  // Valor2 -> v2
  // Valor3 -> v3
  InputNumbers? _input;
}
