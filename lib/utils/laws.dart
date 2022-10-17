import 'dart:math';

num logX(num value, num base) => log(value) / log(base);
num average(List<num> list) => list.reduce((a, b) => a + b) / list.length;
num sum(List<num> list) => list.reduce((a, b) => a + b);
String roundX(num value, int precision) => value.toStringAsFixed(precision);

abstract class Laws {
  late final List<num> xi, yi, xiXm, xiXm2, yiYm, end;
  late final double xm, ym, k1, k2;
  num get calc;
  Laws(this.xi, this.yi) {
    xm = average(xi).toDouble();
    ym = average(yi).toDouble();
    xiXm = xi.map((e) => e - xm).toList();
    xiXm2 = xiXm.map((e) => pow(e, 2)).toList();
    yiYm = yi.map((e) => e - ym).toList();
    end = <num>[];
    for (var i = 0; i < xiXm.length; i++) {
      end.add(xiXm[i] * yiYm[i]);
    }
    k2 = sum(end) / sum(xiXm2);
    k1 = ym - k2 * xm;
  }
}

class Abrams extends Laws {
  final double lfc;
  late final double lk1, lk2;
  @override
  num get calc => lfc <= 0 ? 0 : logX(lk1 / lfc, lk2);
  Abrams({
    required List<num> ac,
    required List<num> fc,
    required this.lfc,
  }) : super(ac, fc.map((e) => logX(e, 10)).toList()) {
    lk1 = pow(10, k1).toDouble();
    lk2 = pow(0.1, k2).toDouble();
  }
}

class Lyse extends Laws {
  final double lac;
  @override
  num get calc => lac <= 0 ? 0 : k2 * lac + k1;
  Lyse({
    required List<num> ac,
    required List<num> my,
    required this.lac,
  }) : super(ac, my);
}
