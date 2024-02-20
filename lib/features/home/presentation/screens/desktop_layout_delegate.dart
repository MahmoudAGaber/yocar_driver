import 'package:flutter/material.dart';

class DesktopLayoutDelegate extends MultiChildLayoutDelegate {
  DesktopLayoutDelegate({
    required this.mapLayoutId,
    required this.bottomSheetLayoutId,
    required this.sidebarLayoutId,
    required this.navbarId,
  });

  final String mapLayoutId;
  final String bottomSheetLayoutId;
  final String sidebarLayoutId;
  final String navbarId;
  final String searchRadiusButtonId = 'search_radius';

  @override
  void performLayout(Size size) {
    final bottomSheetSize = layoutChild(
      bottomSheetLayoutId,
      BoxConstraints(
        maxWidth: size.width,
      ),
    );
    positionChild(bottomSheetLayoutId, Offset(0, size.height - bottomSheetSize.height));
    final searchRadiusButtonSize = layoutChild(searchRadiusButtonId, const BoxConstraints());

    final sidebarSize = layoutChild(sidebarLayoutId, BoxConstraints(maxWidth: 400, maxHeight: size.height));
    positionChild(sidebarLayoutId, Offset(size.width - 400, 0));
    positionChild(
      searchRadiusButtonId,
      Offset(
        (size.width - searchRadiusButtonSize.width - sidebarSize.width) / 2,
        size.height - bottomSheetSize.height - 80,
      ),
    );
    if (bottomSheetSize.height < 50) {
      layoutChild(
        mapLayoutId,
        BoxConstraints(
          maxWidth: size.width - 400,
          maxHeight: size.height,
        ),
      );
      positionChild(mapLayoutId, Offset.zero);
      layoutChild(navbarId, const BoxConstraints(maxWidth: 400));
      positionChild(
        navbarId,
        Offset(size.width - 400, 80),
      );
    } else {
      layoutChild(
        mapLayoutId,
        BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height - bottomSheetSize.height + 20,
        ),
      );
      positionChild(mapLayoutId, Offset.zero);
      layoutChild(navbarId, BoxConstraints(maxWidth: size.width));
      positionChild(
        navbarId,
        const Offset(0, 80),
      );
    }
  }

  @override
  bool shouldRelayout(DesktopLayoutDelegate oldDelegate) {
    return true;
  }
}
