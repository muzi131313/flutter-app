import 'examples/chart-room/entry.dart';
import 'examples/counter/entry.dart';
import 'examples/router/entry.dart';
import 'examples/login/entry.dart';
import 'examples/card-list/entry.dart';
// import 'examples/scan-qrcode/entry.dart';
// import 'examples/camera/entry.dart';
import 'examples/event/entry.dart';

void main() {
  int num = 7;
  switch (num) {
    case 0:
      // demo: 聊天室
      appChartRoomInit();
      break;
    case 1:
      // demo: 加一累加器
      appCounterInit();
      break;
    case 2:
      // demo: 路由跳转
      appRouterInit();
      break;
    case 3:
      // demo: 登陆页面
      appLoginInit();
      break;
    case 4:
      // demo: 卡片列表
      appCardListInit();
      break;
    case 5:
      // demo: 扫描二维码
      // appScanQRCodeInit();
      break;
    case 6:
      // demo: 摄像头
      // appCameraInit();
      break;
    case 7:
      appEventInit();
      break;
  }
}
