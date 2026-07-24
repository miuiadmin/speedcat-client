const _useDevIdentity = bool.fromEnvironment('APP_DEV');

class AppIdentity {
  static const isDev = _useDevIdentity;

  // productName 是内部身份根(core 二进制名 / 数据目录 / TUN 设备名 经 compactName 派生),
  // 与 setup.dart appName 经「core binary 名」耦合 —— 改它须同步 setup.dart + CMakeLists CORE_PATH,
  // 否则 GUI 找不到构建出的 core(静默坏,CI 测不出)。故内部身份留 Bettbox(原契约)。
  static const productName = 'Bettbox';
  // displayNameText 是用户可见名 —— 与内部身份解耦,做彻底 rebrand 而不破 GUI↔core 契约。
  static const displayNameText = 'Speedcat';
  static const devSuffix = 'Dev';
  static const packageId = 'com.speedcat.client';

  static const compactName = isDev ? '$productName$devSuffix' : productName;
  static const displayName = isDev ? '$displayNameText Dev' : displayNameText;
  static const mainExecutableName = productName;
  static const coreExecutableName = '${compactName}Core';
  static const dataDirName = compactName;
  static const tunDeviceName = compactName;
}

class WindowsHelperIdentity {
  static const serviceName = '${AppIdentity.compactName}HelperService';
  static const pipeName = '\\\\.\\pipe\\${AppIdentity.compactName}.Helper';
}
