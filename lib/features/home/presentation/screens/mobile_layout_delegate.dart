import 'package:flutter/material.dart';

class MobileLayoutDelegate extends MultiChildLayoutDelegate {
  MobileLayoutDelegate();

  static String mapLayoutId = 'map';
  static String cardLayoutId = 'card';
  static String navbarId = 'navbar';
  static String searchRadiusButtonId = 'search_radius';
  static String myLocationButtonId = 'my_location';

  @override
  void performLayout(Size size) {
    final cardSize = layoutChild(
      cardLayoutId,
      BoxConstraints(
        maxWidth: size.width,
        maxHeight: size.height,
      ),
    );
    final searchRadiusButtonSize = layoutChild(searchRadiusButtonId, const BoxConstraints());
    positionChild(
      searchRadiusButtonId,
      Offset(
        (size.width - searchRadiusButtonSize.width) / 2,
        size.height - cardSize.height - searchRadiusButtonSize.height - 16,
      ),
    );
    final myLocationButtonSize = layoutChild(myLocationButtonId, const BoxConstraints());
    positionChild(
      myLocationButtonId,
      Offset(
        size.width - myLocationButtonSize.width,
        size.height - cardSize.height - myLocationButtonSize.height,
      ),
    );
    if (cardSize.height < size.height) {
      positionChild(
        cardLayoutId,
        Offset(0, size.height - cardSize.height),
      );
      layoutChild(
        mapLayoutId,
        BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        ),
      );
      positionChild(mapLayoutId, Offset.zero);
      layoutChild(navbarId, BoxConstraints(maxWidth: size.width - 32));
      positionChild(
        navbarId,
        const Offset(
          16,
          16,
        ),
      );
    } else {
      layoutChild(
        navbarId,
        const BoxConstraints(
          maxWidth: 0,
          maxHeight: 0,
        ),
      );
      positionChild(
        navbarId,
        const Offset(
          16,
          16,
        ),
      );
      layoutChild(
        mapLayoutId,
        const BoxConstraints(
          maxWidth: 0,
          maxHeight: 0,
        ),
      );
      positionChild(mapLayoutId, Offset.zero);

      positionChild(cardLayoutId, Offset.zero);
    }
  }

  @override
  bool shouldRelayout(MobileLayoutDelegate oldDelegate) {
    return true;
  }
}
