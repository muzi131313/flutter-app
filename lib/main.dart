import 'package:myapp/examples/layout/entry.dart';
import 'package:myapp/examples/swiper/entry.dart';

import 'examples/chart-room/entry.dart';
import 'examples/counter/entry.dart';
import 'examples/router/entry.dart';
import 'examples/login/entry.dart';
import 'examples/card-list/entry.dart';
// import 'examples/scan-qrcode/entry.dart';
// import 'examples/camera/entry.dart';
import 'examples/event/entry.dart';
import 'examples/l10n/entry.dart';
import 'examples/redux/entry.dart';
// import 'examples/communicate/entry.dart';

void main() {
  int num = 13;
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
      // 原始事件
      appEventInit('eventType');
      break;
    case 8:
      // 拖动
      appEventInit('drag');
      break;
    case 9:
      // 国际化
      appl10nInit();
      break;
    case 10:
      // redux示例(count)
      reduxAppInit();
      break;
    case 11:
      // 和原生通信示例
      // communicateInit();
      break;
    case 12:
      // align布局
      layoutInit();
      break;
    case 13:
      // 轮播图
      swiperInit();
      break;
  }
}
