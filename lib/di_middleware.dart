import 'package:get_it/get_it.dart';
import 'package:portfolio/domain/remote_source/database/pocket_base/pocket_base.dart';

import 'domain/remote_source/database/baas_database_abstract.dart';

class DIMiddleware{
  static T get<T extends Object>(){
    return GetIt.I.get(type: T);
  }
  static void init(){
    GetIt.I.registerSingleton<BAASService>(PocketBaseService());
  }
}