import 'package:path_provider/path_provider.dart';

PathUtile() {
// 获取临时文件路径(IOS和安卓通用)
// 不会备份并且随时会被删除的临时目录
  getTemporaryDirectory().then((value) => print(value));

// 获取应用文件目录(IOS和安卓通用)
// 用于放置用户生成的数据或不能有应用程序重新创建的数据 用户不可见
  getApplicationDocumentsDirectory().then((value) => print(value));

// 获取应用支持目录(IOS和安卓通用)
// 用于存储应用支持的目录 这个目录对于用户是不可见的
  getApplicationSupportDirectory().then((value) => print(value));

// 获取应用持久存储目录路径(仅IOS可用)
// 应用程序可以存储持久化、备份和用户不可见的文件的目录路径
  getLibraryDirectory().then((value) => print(value));

// 获取外部存储目录(仅安卓可用)
// 获取外部存储目录 用户可见
  getExternalStorageDirectory().then((value) => print(value));

// 获取外部存储目录列表(仅安卓可用)
// 可以存储应用程序特定数据的目录
// 这些路径通常驻留在外部存储上 用户可见 如单独的分区或SD卡(可以有多个 所以是列表)
  getExternalStorageDirectories().then((value) => print(value));

// 获取外部缓存目录(仅安卓可用)
// 可以存储应用程序特定外部存储数据的目录
// 这些路径通常驻留在外部存储上，如单独的分区或SD卡(可以有多个 所以是列表)
  getExternalCacheDirectories().then((value) => print(value));

// 获取下载目录(仅桌面可用 安卓和IOS报错)
  getDownloadsDirectory().then((value) => print(value));
}
