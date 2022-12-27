// ignore_for_file: constant_identifier_names

import '../../../core/error/error_handler.dart';
import '../../responses/responses.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millie

abstract class LocalDataSource {
  Future<HomeResponse> getHomeData();

  Future<void> saveHomeToCache(HomeResponse homeResponse);

  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};


  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];

    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      // return the response from cache
      return cachedItem.data;
    } else {
      // return an error that cache is not there or its not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }
    @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}
extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillie) {
    int currentTimeInMillie = DateTime.now().millisecondsSinceEpoch;

    bool isValid = currentTimeInMillie - cacheTime <= expirationTimeInMillie;
    // expirationTimeInMillie -> 60 sec
    // currentTimeInMillie -> 1:00:00
    // cacheTime -> 12:59:30
    // valid -> till 1:00:30
    return isValid;
  }
}