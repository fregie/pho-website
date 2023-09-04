import 'dart:html';
import 'dart:js_interop';
import 'package:flutter_website/body_03.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/body_01.dart';
import 'package:flutter_website/body_02.dart';
import 'package:flutter_website/footer.dart';
import 'package:flutter_website/global.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => settingModel),
      ],
      child: const MyApp(),
    ),
  );
}

SettingModel settingModel = SettingModel();

class SettingModel extends ChangeNotifier {
  String? lang;

  void setLang(String lang) {
    this.lang = lang;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingModel>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Pho - Elegantly synchronize photos',
          locale: settingModel.lang != null ? Locale(settingModel.lang!) : null,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 0, 254, 195)),
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    initL10n(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            Body01(),
            Body02(),
            Body03(),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 80,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
          height: 50,
          child: Image.asset("assets/img/pho_icon.png"),
        ),
        Container(
          height: 40,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: const Text("Pho",
              style: TextStyle(fontSize: 30, fontFamily: "Sriracha-Regular")),
        ),
        Expanded(child: Container()),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
          child: OutlinedButton(
              child: Localizations.localeOf(context).languageCode == "en"
                  ? const Text("中文")
                  : const Text("English"),
              onPressed: () {
                if (Localizations.localeOf(context).languageCode == "en") {
                  settingModel.setLang("zh");
                } else {
                  settingModel.setLang("en");
                }
              }),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
          alignment: Alignment.centerRight,
          child: FilledButton(
            child: const Row(
              children: [
                FaIcon(FontAwesomeIcons.github, size: 18),
                SizedBox(width: 5),
                Text("Github"),
              ],
            ),
            onPressed: () =>
                launchUrl(Uri.parse("https://github.com/fregie/pho")),
          ),
        ),
      ]),
    );
  }
}
