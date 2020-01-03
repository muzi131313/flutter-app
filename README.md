# myapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## examples

- [counter](./lib/examples/counter/entry.dart): 累加器
  - StatelessWidget 了解
  - StatefulWidget 了解
- [router](./lib/examples/router/entry.dart): 路由
  - 三方包 `english_words` 引入
  - 路由传参
- [login](./lib/examples/login/entry.dart): 登录界面
  - 本地图片资源引入
- [chart-room](./lib/examples/chart-room/entry.dart): 聊天室
  - 聊天本地数据缓存
  - 聊天动画特效
  - 不同平台主题区分
- [card-list](./lib/examples/card-list/entry.dart): 卡片列表
  - grid 布局
  - model
- [event](./lib/examples/event/entry.dart): 事件
  - Listener: 原始事件
- [l10n](./lib/examples/l10n/entry.dart): 多语言
  - [website/intl_example](https://github.com/flutter/website/blob/master/examples/internationalization/intl_example/lib/main.dart): 官方示例
  - [intl_translation](https://pub.dev/packages/intl_translation): 从代码中提取要国际化的**字符串**到单独的 arb 文件和根据 arb 文件生成对应语言的 dart 代码
    - 生成 arb 文件:
      - 官方文档: `flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/examples/l10n/l10n lib/examples/l10n/entry.dart`
    - 生成 dart 代码:
      - 官方文档: `flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=<prefix> <my_dart_files> <translated_ARB_files>`
      - 实际应用: `flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/examples/l10n/i10n --no-use-deferred-loading`
    - 项目生成 shell 文件: [intl.sh](./intl.sh)
      - 重新生成【字体】以及【dart 代码】： `sh intl.sh`
    - API:
      - `--generated-file-prefix`: 生成前缀
      - `--output-dir`: 生成目录
      - `--no-use-deferred-loading`: 不延迟加载
      - `intl_translation:generate_from_arb`: 从 arb 文件生成 dart 代码
      - `intl_translation:extract_to_arb`: 从语言代码抽离 arb 文件
    - 知识点:
      - `i10-arb\intl_messages.arb`: 默认字体文件
        - 此文件动态生成，每次重新生成，会更新次文件
        - i10n 托底政策，其他字体文件不可用时，会使用此文件
      - `i10-arb\intl_zh_CN.arb`: 中文字体文件
        - 重新生成，不会覆盖此文件
        - 会根据此文件，动态生成 `messages_zh_CN.dart` 文件
        - 此文件需要增加 `"@@locale": "zh_CN",` 属性，用来识别、匹配当前文件
- [redux](./lib/examples/redux/entry.dart): redux 应用
  - 对比 [counter](https://github.com/brianegan/flutter_redux/blob/master/example/counter/lib/main.dart) 示例，增加了属性的示例
  - 参考 [flutter-redux-todo-list](https://github.com/xqwzts/flutter-redux-todo-list) 示例，有详细应用
  - 模块划分
    - model: 包括
      - 模型
      - state
    - reducer
    - ModelView
      - state 和 view 绑定
      - view 中行为(按钮事件)触发相应的 action
