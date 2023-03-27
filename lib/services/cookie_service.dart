import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:store/services/base_service.dart';
import 'package:store/services/log_service.dart';

class CookieService extends BaseService {
  static const _tag = "CookieService";
  final LogService _log = LogService.getInstance();
  static final CookieService _instance = CookieService._();
  late CookieManager _cookieManager;

  // constructor
  CookieService._() {
    _cookieManager = getCookieManager();
  }

  CookieManager getCookieManager() {
    _log.d("$_tag/getCookieManager");
    return CookieManager(CookieJar());
  }

  static CookieService getInstance() {
    return _instance;
  }

  CookieManager get cookieManager => _cookieManager;
}
