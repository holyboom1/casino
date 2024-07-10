extension StringExtensions on String {
  bool isValidEmail() => RegExp(
    '(?=[^\\.])(?=^[^\\.]*(\\.[^\\.]+)*\$)(?=^[^@]*@[^@]*\$)(^(["\']?[a-zA-Z0-9.!#\$%&\'*+-/=?^_`{|}~-]+["\']?)([^\\.])+@[a-zA-Z0-9-]+\\.+(?:.[a-zA-Z0-9-]+)*\$)',
  ).hasMatch(this);

  bool isValidPassword() =>
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])[0-9A-Za-z!?,.\-+=»]{8,30}$').hasMatch(this);

  bool containsLowercase() => contains(RegExp('[a-z]'));

  bool containsUppercase() => contains(RegExp('[A-Z]'));

  bool isDigit() => RegExp(r'\d').hasMatch(this);

  bool isSvg() => endsWith('.svg');

  bool isNetworkImage() => startsWith('http');

  bool isPicture() =>
      toLowerCase().endsWith('.svg') ||
          toLowerCase().endsWith('.png') ||
          toLowerCase().endsWith('.jpg') ||
          toLowerCase().endsWith('.jpeg') ||
          toLowerCase().endsWith('.gif') ||
          toLowerCase().endsWith('.webp');

  bool isVideo() =>
      toLowerCase().endsWith('.mp4') ||
          toLowerCase().endsWith('.mov') ||
          toLowerCase().endsWith('.avi') ||
          toLowerCase().endsWith('.flv') ||
          toLowerCase().endsWith('.wmv');
}
