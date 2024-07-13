enum Currency {
  EUR,
  TUR;

  String get name {
    switch (this) {
      case Currency.EUR:
        return 'EUR';
      case Currency.TUR:
        return 'TUR';
      default:
        return 'EUR';
    }
  }

  factory Currency.fromString(String value) {
    switch (value) {
      case 'EUR':
        return Currency.EUR;
      case 'TUR':
        return Currency.TUR;
      default:
        return Currency.EUR;
    }
  }
}
