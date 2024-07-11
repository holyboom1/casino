extension StringExtensions on String {
  bool get isValidEmail => RegExp(
        r'(?=.{5,50}$)[^\s@]+[._+-]?[^\s@]+@[^\s@]+\.[^\s@]{2,}$',
      ).hasMatch(this);

  bool get containsLowercase => contains(RegExp('[a-z]'));

  bool get containsUppercase => contains(RegExp('[A-Z]'));

  bool get containsDigits => contains(RegExp('[0-9]'));

  bool isSvg() => endsWith('.svg');

  bool isNetworkImage() => startsWith('http');
}
