import 'package:intl/intl.dart';

String toRupiah(int value, {bool withRp: true}) {
  var f = new NumberFormat.currency(
    symbol: (withRp) ? 'Rp ' : '',
    decimalDigits: 0,
    locale: 'id_ID',
  );
  return f.format(value);
}
