import 'package:flutter/material.dart';

// extension ExtendedWidget on Widget {
//   paddingExt({double lp = 0, double rp = 0, double tp = 0, double bp = 0}) {
//     return Padding(
//       padding: EdgeInsets.only(left: lp, right: rp, top: tp, bottom: bp),
//       child: this,
//     );
//   }
// }

extension ExtendedWidget on Widget {
  Widget paddingAll() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: this,
    );
  }

  Widget titlePadding() {
    return Padding(
        child: this,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 05,
          left: 10,
          right: 10,
        ));
  }

  Widget containerPadding() {
    return Padding(
        child: this,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
        ));
  }

  Widget verticalPadding() {
    return Padding(
        child: this,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 5,
        ));
  }

  Widget verticalTextPadding() {
    return Padding(
        child: this,
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ));
  }

  Widget horizontalPadding() {
    return Padding(
        child: this,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ));
  }
}

extension ExtendedText on Widget {
  addContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.yellow,
      child: this,
    );
  }
}
