import 'examples/chart-room/entry.dart';
import 'examples/counter/entry.dart';
import 'examples/router/entry.dart';
import 'examples/login/entry.dart';
import 'examples/card-list/entry.dart';

void main() {
  int num = 4;
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
      appLoginInit();
      break;
    case 4:
      appCardListInit();
      break;
  }
}
