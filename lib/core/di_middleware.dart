import 'package:get_it/get_it.dart';
import 'package:portfolio/domain/local_source/database/get_storage_service.dart';
import 'package:portfolio/domain/local_source/local_database_abstract.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';
import 'package:portfolio/domain/remote_source/database/pocket_base/pocket_base.dart';
import 'package:portfolio/domain/services/country_service.dart';
import 'package:portfolio/domain/services/services_impl/country_ip_impl.dart' show CountryIpImpl;

class DIMiddleware{
  static T get<T extends Object>(){
    return GetIt.I.get(type: T);
  }
  static Future<void> registerAndInit() async {
    GetIt.I.registerSingleton<BAASService>(PocketBaseService());
   await GetIt.I.registerSingleton<LocalDatabase>(GetStorageService()).init();
   GetIt.I.registerSingleton<CountryService>(CountryIpImpl());
  }
}