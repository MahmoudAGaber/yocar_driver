import 'package:driver_flutter/core/entities/order.dart';
import 'package:driver_flutter/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_common/core/enums/order_status.dart';
import 'package:flutter_common/core/enums/payment_mode.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter_common/core/presentation/waypoints_view/waypoints_view.dart';

class RideHistoryItem extends StatelessWidget {
  final OrderEntity entity;
  final VoidCallback onPressed;

  const RideHistoryItem({
    super.key,
    required this.entity,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Theme.of(context).primaryColor
            )
          // image: DecorationImage(
          //   image: Assets.images.historyRidesHeaderBackground.provider(),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          entity.createdAt.formatDateTime,
                          style: context.bodyMedium?.copyWith(
                            // color: ColorPalette.neutralVariant90,
                          ),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 2),
                  Column(
                    children: [
                      Text(
                        entity.total.formatCurrency(entity.currency),
                        style: context.labelMedium?.copyWith(
                          //color: ColorPalette.neutral99,
                        ),
                      ),
                      if (entity.status == OrderStatus.driverCanceled ||
                          entity.status == OrderStatus.riderCanceled)
                        Text(
                          context.translate.canceled,
                          style: context.bodyMedium?.copyWith(
                            color: ColorPalette.error80,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Column(
                    children: [

                      // if (entity.status != OrderStatus.driverCanceled &&
                      //     entity.status != OrderStatus.riderCanceled)
                        // Text(
                        //   entity.paymentMode == PaymentMode.cash
                        //       ? context.translate.cash
                        //       : context.translate.online,
                        //   style: context.bodyMedium?.copyWith(
                        //     color: ColorPalette.neutralVariant90,
                        //   ),
                        // ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,bottom: 8),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.location_on_rounded),
                      SizedBox(height: 6,),
                      Text(context.translate.distanceInKilometers(entity.distanceBest / 1000),style: context.bodyMedium,),

                    ],
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.665,
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(child: Text(entity.waypoints[0].address,style: context.bodyMedium!.copyWith(fontSize: 15),overflow: TextOverflow.clip)),
                        SizedBox(height: 4,),
                        Flexible(child: Text(entity.waypoints[1].address,style: context.bodyMedium!.copyWith(color: Colors.grey,overflow: TextOverflow.clip),))
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     color: ColorPalette.neutral99,
            //     border: Border.all(
            //       color: ColorPalette.primary95,
            //     ),
            //     boxShadow: const [
            //       BoxShadow(
            //         color: Color(0x1464748B),
            //         blurRadius: 8,
            //         offset: Offset(2, 4),
            //       )
            //     ],
            //   ),
            //   child: WayPointsView(
            //     waypoints: entity.waypoints,
            //     startedAt: entity.startAt,
            //     finishedAt: entity.finishAt,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
