import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BeaconTheme {
  const BeaconTheme();

  get primaryFontColour => const Color(0xff0E0E61);

  get primaryBackgroundColour => const Color(0xffFFE8CD);

  get secondaryFontColour => const Color(0xff877B97);

  get shadowColour => const Color(0xffDBC7BD);

  get boxShadow => const BoxShadow(
      color: Color(0xffDBC7BD),
      blurRadius: 32,
      offset: Offset(8,16)
  );

}