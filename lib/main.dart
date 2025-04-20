import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quote/core/theme/theme.dart';
import 'package:flutter_quote/core/utils/platform_utils.dart';
import 'package:flutter_quote/views/home_view.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (PlatformUtils.isDesktop()) {
    DesktopWindow.setMinWindowSize(Size(232.0, 197.0));
    // setWindowFrame(Size(400, 300));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quote',
      theme: darkTheme,
      darkTheme: darkTheme,
      home: HomeView(),
    );
  }
}
