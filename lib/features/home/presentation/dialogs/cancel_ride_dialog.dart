import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter_common/core/presentation/buttons/app_bordered_button.dart';
import 'package:flutter_common/core/presentation/responsive_dialog/app_responsive_dialog.dart';
import 'package:flutter_common/core/presentation/buttons/app_text_button.dart';

import 'cancel_ride_reason.dart';

class CancelRideDialog extends StatelessWidget {
  final String orderId;

  const CancelRideDialog({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return AppResponsiveDialog(
      type: context.responsive(
        DialogType.bottomSheet,
        xl: DialogType.dialog,
      ),
      contentPadding: EdgeInsets.zero,
      // primaryButton: AppPrimaryButton(onPressed: () {

      // }, child: Text(context.translate.findAnotherRide)),
      secondaryButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  useSafeArea: false,
                  builder: (context) => CancelRideReasonDialog(orderId: orderId,),
                );
              },
              //textColor: ColorPalette.error40,
              child: Text(context.translate.cancelMyRide,style: context.titleSmall!.copyWith(color: Colors.black54),),
            ),
          ],
        ),
      ),
      primaryButton: AppBorderedButton(
        onPressed: () => Navigator.of(context).pop(),
        title: context.translate.waitMyRide,
        isPrimary: true,
        textColor: ColorPalette.primary20,
        borderColor: Theme.of(context).primaryColor,
        buttonColor: ColorPalette.primary99,
        //color: Colors.black,
        // backgroundColor: Colors.grey[300],
      ),
      iconColor: ColorPalette.error40,
      header: (
      SizedBox(height: 90,width:145,child:Image.asset("assets/images/cancelRide.png",fit: BoxFit.cover,),),
      context.translate.rideCancellation,
      context.translate.cancelRideMessage,
      ),
      child: const SizedBox.shrink(),
    );
  }
}
