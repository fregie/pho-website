import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
            height: 50,
            child: Image.asset("assets/img/pho_icon.png"),
          ),
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pho",
                    style: TextStyle(fontSize: 22, fontFamily: "Ubuntu")),
                Text("Sync your photos elegantly",
                    style: TextStyle(fontSize: 12, fontFamily: "Ubuntu")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
