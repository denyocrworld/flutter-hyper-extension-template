void main() {
  var r = 255.toRadixString(16).padLeft(2, '0');
  var g = 255.toRadixString(16).padLeft(2, '0');
  var b = 255.toRadixString(16).padLeft(2, '0');
  print(r + g + b);
}
