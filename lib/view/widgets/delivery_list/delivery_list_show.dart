
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_lora.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class DeliveryAdminListContainers extends StatelessWidget {
  final int flex;
  final String text;
  const DeliveryAdminListContainers({
    required this.text,
    required this.flex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
     flex: flex,
     child: Container(
     height: 45,
      decoration:   BoxDecoration(
        color: Colors.pink.withOpacity(0.2),
        border:  const Border(
          right: BorderSide(color: cWhite,width: 5),
            bottom: BorderSide(color: cWhite)), ),
     child: Center(child: GooglePoppinsWidgets(text: text, fontsize: 13,fontWeight: FontWeight.w500,)),
                        ),
                      );
  }
}

class HeaderOfDeliveryAdmin extends StatelessWidget {
  final String text;
   final int flex;
  const HeaderOfDeliveryAdmin({
    required this.text,
    required this.flex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
     flex: flex,
     child: Container(
       height: 45,
       decoration:  BoxDecoration(
        border: const Border(
          right: BorderSide(color: cWhite,width: 5)), 
            color: cBlue.withOpacity(0.5)
            ),
      
       child: Center(child: GoogleLoraWidgets(text: text, fontsize: 14,fontWeight: FontWeight.w700,)),
     ),
   );
  }
}


class AlBustanTableViewApp extends StatefulWidget {
  final int flex;
  final String text;
  final Color color;
   const AlBustanTableViewApp({
    required this.text,
    required this.flex,
    required this.color,
    super.key,
  });

  @override
  State<AlBustanTableViewApp> createState() => _AlBustanTableViewAppState();
}

class _AlBustanTableViewAppState extends State<AlBustanTableViewApp> {
   bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
     flex: widget.flex,
     child: Container(
      height: 45,
      decoration:   BoxDecoration(
        border:  const Border(
          right: BorderSide(color: cWhite,width: 5),
            bottom: BorderSide(  color: cWhite)),
        color: widget.color ),
      child:  InkWell(
      onTap: () {
        // Handle tap event if needed
      },
      onHover: (isHovered) {
        setState(() {
          this.isHovered = isHovered;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200, // Specify the width of your container
          height: 50, // Specify the height of your container
         // color: Colors.grey[300], // Container color
          child: Center(
            child: isHovered
                ? Marquee(
                    text: widget.text,
                    style: const TextStyle(fontSize: 16),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 100.0,
                    pauseAfterRound: const Duration(seconds: 1),
                    startPadding: 10.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  )
                :  Center(child: 
               GooglePoppinsWidgets(text:widget. text, fontsize: 13,fontWeight: FontWeight.w500,)),
          ),
        ),
      ),
    )
      //  Center(child: 
      // GooglePoppinsWidgets(text: text, fontsize: 13,fontWeight: FontWeight.w500,)),
      ),
    );
  }
}


