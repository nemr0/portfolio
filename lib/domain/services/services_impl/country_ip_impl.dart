import 'package:country_ip/country_ip.dart';
import 'package:phonecodes/phonecodes.dart';
import 'package:portfolio/data/models/country_details/country_details.dart';
import 'package:portfolio/domain/services/country_service.dart';

class CountryIpImpl implements CountryService {
  @override
  CountryDetails countryDetails = _defaultCountryDetails;
  static const CountryDetails _defaultCountryDetails =  CountryDetails(
    countryIsoCode: 'EG',
    countryName: 'Egypt',
    ip: '',
    countryCode: '+20',
  );
  @override
  Future<CountryDetails> getCountryCode() async {
    if (countryDetails == _defaultCountryDetails) {
      final countryIp = await CountryIp.find();
      if(countryIp!=null) {
        final countryCode = Countries.findByCode(
          countryIp.countryCode.toUpperCase(),
        );
        countryDetails = CountryDetails(
          countryIsoCode: countryIp.countryCode,
          countryName: countryIp.country,
          ip: countryIp.ip,
          countryCode: countryCode.dialCode,
        );
      }
    }
    return countryDetails;
  }


}
