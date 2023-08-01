import 'package:flutter/material.dart';
import 'package:flutter_website/global.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:card_swiper/card_swiper.dart';

class Body02 extends StatefulWidget {
  const Body02({Key? key}) : super(key: key);

  @override
  State<Body02> createState() => _Body02State();
}

class _Body02State extends State<Body02> {
  int currentIndex = 1;
  late SwiperController controller;

  @override
  void initState() {
    super.initState();
    controller = SwiperController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.move(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = false;
      if (constraints.maxWidth < 1000) {
        isMobile = true;
      }
      return Container(
          height: isMobile ? 1500 : 1000,
          padding: isMobile
              ? const EdgeInsets.all(0)
              : const EdgeInsets.fromLTRB(32, 32, 32, 32),
          color: const Color.fromARGB(255, 32, 32, 32),
          child: !isMobile
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      pic(),
                      const SizedBox(width: 50),
                      features(),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                  children: [
                    features(),
                    const SizedBox(height: 50),
                    pic(),
                  ],
                )));
    });
  }

  List<Widget> images = [
    Hero(
        tag: "image_local",
        child: Image.asset("assets/img/screenshot_iphone13_local.png")),
    Hero(
        tag: "image_sync",
        child: Image.asset("assets/img/screenshot_iphone13_sync.png")),
    Hero(
        tag: "image_view",
        child: Image.asset("assets/img/screenshot_iphone13_view.png")),
    Hero(
        tag: "image_smb",
        child: Image.asset("assets/img/screenshot_iphone13_smb.png")),
    Hero(
        tag: "image_info",
        child: Image.asset("assets/img/screenshot_iphone13_info.png")),
  ];

  Widget pic() {
    return Flexible(
      child: Container(
        width: 400,
        height: 700,
        alignment: Alignment.center,
        child: Swiper(
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return images[index];
          },
          itemCount: 5,
          pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.white,
                size: 5,
                activeSize: 10,
              )),
          control: const SwiperControl(color: Colors.white),
        ),
      ),
    );

    // Widget first = images[currentIndex];
    // late Widget second;
    // late Widget third;
    // if (currentIndex + 1 >= images.length) {
    //   second = images[0];
    //   third = images[1];
    // } else {
    //   second = images[currentIndex + 1];
    //   if (currentIndex + 2 >= images.length) {
    //     third = images[0];
    //   } else {
    //     third = images[currentIndex + 2];
    //   }
    // }

    // return Flexible(
    //   child: Container(
    //     width: 500,
    //     alignment: Alignment.center,
    //     child: Stack(
    //       children: [
    //         Positioned(
    //             top: 225,
    //             right: 0,
    //             child: Container(
    //               width: 350,
    //               child: Opacity(opacity: 0.3, child: third),
    //             )),
    //         Positioned(
    //             top: 175,
    //             left: 0,
    //             child: Container(
    //               width: 350,
    //               child: Opacity(opacity: 0.7, child: second),
    //             )),
    //         Positioned(
    //             top: 125,
    //             left: 75,
    //             child: Container(
    //               width: 350,
    //               child: first,
    //             )),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget features() {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          tile(FontAwesomeIcons.cloudArrowUp, l10n.featureSyncTitle,
              l10n.featureSyncDesc, 1),
          tile(FontAwesomeIcons.images, l10n.featureViewTitle,
              l10n.featureViewDesc, 2),
          tile(FontAwesomeIcons.fileShield, l10n.featureDataTile,
              l10n.featureDataDesc, 3),
          tile(FontAwesomeIcons.github, l10n.featureOpenSourceTitle,
              l10n.featureOpenSourceDesc, 4)
        ],
      ),
    );
  }

  Widget tile(IconData icon, String title, String desc, int index) {
    return GestureDetector(
      onTap: () {
        controller.move(index);
        setState(() => currentIndex = index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: currentIndex == index
              ? const Color.fromARGB(255, 40, 40, 40)
              : const Color.fromARGB(0, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaIcon(icon, size: 25, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 20, fontFamily: "Ubuntu", color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Ubuntu",
                  color: Color.fromARGB(255, 181, 181, 181)),
            ),
          ],
        ),
      ),
    );
  }
}
