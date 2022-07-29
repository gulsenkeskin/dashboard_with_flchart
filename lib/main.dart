import 'package:dashboard_with_flchart/bar_chart1.dart';
import 'package:dashboard_with_flchart/theme_model.dart';
import 'package:dashboard_with_flchart/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bar_chart2.dart';
import 'line_chart1.dart';
import 'line_chart2.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          title: 'Flutter4fun',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color(0xFFA7A7A7), fontSize: 13),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color(0xFFA7A7A7), fontSize: 13),
            ),
          ),
          themeMode: themeModel.currentTheme(),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return Scaffold(
          backgroundColor:
              themeModel.isDark() ? const Color(0xFF20202A) : Colors.white,
          body: Stack(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            splashRadius: 20,
                            padding: const EdgeInsets.only(top: 10),
                              onPressed: () {
                                ThemeModel tmp = Provider.of<ThemeModel>(
                                    context,
                                    listen: false);
                                tmp.switchTheme();
                                tmp.notify();
                              },
                              icon: themeModel.isDark()
                                  ? const Icon(Icons.sunny)
                                  : const Icon(Icons.nightlight_round))),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: constraints.maxWidth < 800 ? 1 : 2,
                        childAspectRatio: 1.7,
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16, top: 4),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: const [
                          MyCard(child: BarChartWidget1()),
                          MyCard(child: BarChartWidget2()),
                          MyCard(child: LineChartWidget1()),
                          MyCard(child: LineChartWidget2()),
                        ],
                      ),
                    ),
                    Container(
                      color: themeModel.isDark()
                          ? const Color(0xFF20202A)
                          : Colors.white,
                      width: double.infinity,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Utils.launchURL('https://dev.to/gulsenkeskin');
                            },
                            child: const Text('Dev'),
                          ),
                          const MyDivider(),
                          TextButton(
                            onPressed: () {
                              Utils.launchURL(
                                  'https://github.com/gulsenkeskin');
                            },
                            child: const Text('Github'),
                          ),
                          const MyDivider(),
                          TextButton(
                            onPressed: () {
                              Utils.launchURL(
                                  'https://www.buymeacoffee.com/gulsen');
                            },
                            child: const Text('Buy me a developer account :)'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 1,
      color: const Color(0xFFA7A7A7),
      margin: const EdgeInsets.only(top: 2),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget child;

  const MyCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, _) {
        return Container(
          child: child,
          decoration: BoxDecoration(
              color:
                  themeModel.isDark() ? const Color(0xFF1A1A26) : Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 1,
                )
              ]),
        );
      },
    );
  }
}
