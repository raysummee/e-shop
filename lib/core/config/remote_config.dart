import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigImpl extends RemoteConfig{
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration( seconds: 2), 
      minimumFetchInterval: const Duration(seconds: 2), 
    ));

    _fetchConfig();
  }

  void _fetchConfig() async {
    await _remoteConfig.fetchAndActivate();
  }

  @override
  bool isDiscountAvail(){
    return _remoteConfig.getBool("isDiscountAvail");
  }
}

abstract class RemoteConfig{
  bool isDiscountAvail();
}
