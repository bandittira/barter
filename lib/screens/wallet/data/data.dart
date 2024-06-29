import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String fantomApiUrl = 'https://api.diadata.org/v1/assetQuotation/Fantom/0x0000000000000000000000000000000000000000';
  static const String exchangeRateApiUrl = 'https://api.exchangerate-api.com/v4/latest/USD';

  Future<double> getFantomPriceInUsd() async {
    final response = await http.get(Uri.parse(fantomApiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['Price'];
    } else {
      throw Exception('Failed to load Fantom price');
    }
  }

  Future<double> getExchangeRate(String toCurrency) async {
    final response = await http.get(Uri.parse(exchangeRateApiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['rates'][toCurrency];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }

  Future<double> getFantomPriceInCurrency(String toCurrency) async {
    final priceUsd = await getFantomPriceInUsd();
    final exchangeRate = await getExchangeRate(toCurrency);
    return priceUsd * exchangeRate;
  }
}

