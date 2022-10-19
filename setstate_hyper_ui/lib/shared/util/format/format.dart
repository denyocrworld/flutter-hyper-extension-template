import 'package:example/core.dart';

class Format {}

extension TimeStampExtension on DateTime {
  get dMMMy {
    var value = this;
    return DateFormat("d MMM y").format(value);
  }
}

extension ParserExtension on dynamic {
  double toDouble() {
    var value = this;
    return double.parse("$value");
  }
}

extension NumberFormatExtension on double {
  get idr {
    var value = this;
    var formatter = NumberFormat.currency(locale: 'id');
    return formatter.format(value);
  }
}
