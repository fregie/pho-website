import 'package:flutter/material.dart';
import 'package:flutter_website/global.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show ByteData, rootBundle;

Widget body01() {
  return LayoutBuilder(
    builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxWidth > 1000 ? 800 : 1500,
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Stack(
            children: [
              constraints.maxWidth > 1000
                  ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          descContent(false),
                          const SizedBox(width: 100),
                          mainPic(false),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          descContent(true),
                          mainPic(true),
                        ],
                      ),
                    )
            ],
          ),
        ),
      );
    },
  );
}

Widget descContent(bool isMobile) {
  return Flexible(
    child: Container(
      padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.mainTitle,
            style:
                TextStyle(fontSize: isMobile ? 26 : 38, fontFamily: "Ubuntu"),
          ),
          const SizedBox(height: 20),
          Text(l10n.mainDesc,
              style: TextStyle(
                  fontSize: isMobile ? 14 : 18,
                  color: Color.fromARGB(255, 54, 54, 54),
                  fontFamily: "Ubuntu")),
          const SizedBox(height: 30),
          Text(l10n.netStorages,
              style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey,
                  fontFamily: "Ubuntu")),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: FilledButton(
                  // onPressed: () => downloadFile(
                  //     "assets/apk/pho-release-16-1.3.2.apk",
                  //     "pho-release-16-1.3.2.apk"),
                  onPressed: () => launchUrl(
                      Uri.parse("assets/assets/apk/pho-release-16-1.3.2.apk")),
                  child: Row(
                    children: [
                      Icon(Icons.android, size: isMobile ? 18 : 24),
                      const SizedBox(width: 5),
                      Text(l10n.apkDownlaod,
                          style: TextStyle(fontSize: isMobile ? 14 : 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 50,
                child: FilledButton(
                  onPressed: () => launchUrl(Uri.parse(
                      "https://apps.apple.com/cn/app/pho-%E5%90%8C%E6%AD%A5%E7%85%A7%E7%89%87%E5%88%B0nas-%E7%BD%91%E7%9B%98/id6451428709")),
                  child: Row(
                    children: [
                      Icon(Icons.apple, size: isMobile ? 18 : 24),
                      const SizedBox(width: 5),
                      Text(l10n.iosDownload,
                          style: TextStyle(fontSize: isMobile ? 14 : 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget mainPic(bool isMobile) {
  return Flexible(
      child: Container(
    constraints: BoxConstraints(maxWidth: isMobile ? 300 : 600),
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? 200 : 350),
            child: Image.asset("assets/img/screenshot_iphone13_info.png"),
          ),
        ),
        Positioned(
          left: isMobile ? 100 : 200,
          top: 30,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? 200 : 350),
            child: Image.asset("assets/img/screenshot_iphone13_local.png"),
          ),
        ),
      ],
    ),
  ));
}

Future<void> downloadFile(String urlstr, String filename) async {
  ByteData data = await rootBundle.load(urlstr);
  Uint8List bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  // Prepare
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = filename;

  html.document.body!.children.add(anchor);

  // download
  anchor.click();

  // Cleanup
  html.document.body!.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
