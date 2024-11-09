class PinModel {
  final int maxLength;
  String _pin = "";

  PinModel({this.maxLength = 4});

  String get pin => _pin;

  bool get isFull => _pin.length == maxLength;

  void addDigit(String digit) {
    if (_pin.length < maxLength) {
      _pin += digit;
    }
  }

  void removeLastDigit() {
    if (_pin.isNotEmpty) {
      _pin = _pin.substring(0, _pin.length - 1);
    }
  }

  void clearPin() {
    _pin = "";
  }
}
