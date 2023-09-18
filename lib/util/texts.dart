import 'package:get/get.dart';

class Texts extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'overview': 'O V E R V I E W',
          'report': 'R E P O R T S',
        },
        'es_US': {
          'hello': 'Hola',
          'overview': 'D E S C R I P C I Ó N   G E N E R A L',
          'report': 'I N F O R M E S',
        },
      };
}
