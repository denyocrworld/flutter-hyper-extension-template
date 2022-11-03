extension StringExtension on String {
  String toTitleCase() {
    return replaceAllMapped(RegExp(r'^([a-z])|[A-Z]'),
        (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase()).trim();
  }

  String toRouterCase() {
    var value = this;
    value = value.trim().toTitleCase().trim();
    value = value.replaceAll(" ", "-");
    value = value.replaceAll("_", "-");
    value = value.toLowerCase();
    print("VALUE IS $value");
    return value;
  }

  String toCamelCase() {
    var value = this;
    value = value.toTitleCase().trim();
    value = value[0].toLowerCase() + value.substring(1, value.length);
    value = value.replaceAll(" ", "");
    value = value.replaceAll("_", "");
    return value;
  }
}
