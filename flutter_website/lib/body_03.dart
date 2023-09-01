import 'package:flutter/material.dart';
import 'package:flutter_website/global.dart';
import 'dart:html' as html;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Body03 extends StatefulWidget {
  const Body03({Key? key}) : super(key: key);

  @override
  State<Body03> createState() => _Body03State();
}

class _Body03State extends State<Body03> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: Image.asset("assets/img/pho_icon.png"),
                ),
                Container(
                  child: Text("Pho pro",
                      style: TextStyle(
                          fontSize: 50, fontFamily: "Sriracha-Regular")),
                ),
                SizedBox(height: 5),
                Container(
                  width: constraints.maxWidth >= 1000 ? 1000 : null,
                  alignment: Alignment.center,
                  child: Text(
                    l10n.proDesc02,
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 101, 101, 101)),
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                  children: [
                    card([FontAwesomeIcons.lock], l10n.encryptTitle,
                        l10n.encryptDesc),
                    card([FontAwesomeIcons.filter], l10n.filterTitle,
                        l10n.filterDesc),
                    card([FontAwesomeIcons.arrowsUpToLine], l10n.paraTitle,
                        l10n.paraDesc),
                    card([FontAwesomeIcons.folderTree], l10n.dirTitle,
                        l10n.dirDesc),
                  ],
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: FilledButton(
                    onPressed: () => launchUrl(Uri.parse(
                        "https://apps.apple.com/cn/app/pho-%E5%90%8C%E6%AD%A5%E7%85%A7%E7%89%87%E5%88%B0nas-%E7%BD%91%E7%9B%98/id6451428709")),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apple, size: 24),
                        const SizedBox(width: 5),
                        Text(l10n.iosDownload, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  Widget card(List<IconData> icons, String title, String subTitle) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 300,
      height: 220,
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            // side: BorderSide(
            //   width: 1.5,
            //   color: Theme.of(context).colorScheme.outline.withAlpha(128),
            // ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          clipBehavior: Clip.antiAlias,
          // color: Theme.of(context).colorScheme.surfaceVariant,
          color: Color.fromARGB(255, 225, 225, 225),
          child: LayoutBuilder(
              builder: (context, constraints) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: icons
                                .map((e) => Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                      child: FaIcon(e, size: 25),
                                    ))
                                .toList()),
                      ),
                      // Container(
                      //     width: constraints.maxWidth,
                      //     height: 200,
                      //     decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(10)),
                      //     ),
                      //     clipBehavior: Clip.antiAlias,
                      //     child: Image.asset(imgPath, fit: BoxFit.fitWidth)),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(title,
                            style: const TextStyle(
                                fontFamily: "Ubuntu", fontSize: 20)),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: Text(subTitle,
                              style: const TextStyle(
                                  fontFamily: "Ubuntu",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 88, 88, 88))),
                        ),
                      ),
                    ],
                  ))),
    );
  }
}
