class UnitConverter {
  static double convertLength(double value, String from, String to) {
    const conversionRates = {
      'm': 1.0,
      'km': 1000.0,
      'cm': 0.01,
      'mm': 0.001,
      'ft': 0.3048,
      'in': 0.0254,
      'mi': 1609.34,
    };

    return value * (conversionRates[from]! / conversionRates[to]!);
  }

  static double convertWeight(double value, String from, String to) {
    const conversionRates = {
      'kg': 1.0,
      'g': 0.001,
      'lb': 0.453592,
      'oz': 0.0283495,
    };

    return value * (conversionRates[from]! / conversionRates[to]!);
  }

  static double convertTemperature(double value, String from, String to) {
    if (from == to) return value;

    if (from == "C") {
      return to == "F" ? (value * 9 / 5 + 32) : (value + 273.15);
    } else if (from == "F") {
      return to == "C"
          ? ((value - 32) * 5 / 9)
          : ((value - 32) * 5 / 9 + 273.15);
    } else if (from == "K") {
      return to == "C" ? (value - 273.15) : ((value - 273.15) * 9 / 5 + 32);
    }

    throw Exception("Unsupported temperature conversion");
  }
}
