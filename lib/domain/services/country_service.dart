
import 'package:portfolio/data/models/country_details/country_details.dart';

abstract class CountryService{
late CountryDetails countryDetails;
  /// Returns the country code of the device.
  Future<CountryDetails> getCountryCode();
}
