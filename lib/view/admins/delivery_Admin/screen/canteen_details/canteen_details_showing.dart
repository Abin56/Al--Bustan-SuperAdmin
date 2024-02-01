import 'package:canteen_superadmin_website/core/fonts/google_lora.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CanteenDetailsShowingPage extends StatelessWidget {
  final String canteenimagepath;
  final String schooltext;
  final String addresstext;
  final String canteenidtext;
  final String contactpersontext;
  final String albustanpersontext;
  final String starttimetext;
  final String endtimetext;
  const CanteenDetailsShowingPage({
   super.key, 
   required this.canteenimagepath, 
   required this.schooltext, 
   required this.addresstext, 
   required this.canteenidtext, 
   required this.contactpersontext,
   required this.albustanpersontext, 
   required this.starttimetext, 
   required this.endtimetext});


  @override
  Widget build(BuildContext context) {
    final   listWidgetOfCanteen = [
            Stack(  
              children: [
                  SizedBox(
                   height:ResponsiveWebSite.isMobile(context)?400: 600,
                   width: double.infinity,
                   child:canteenimagepath==''?
                    Image.asset("images/lunch.jpg",fit: BoxFit.cover,):Image.network(canteenimagepath)
                  ),
                   Padding(
                     padding: const EdgeInsets.only(top: 250),
                     child: Center(
                     // padding: const EdgeInsets.only(left: 50,top: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //    GooglePoppinsWidgets(text: "CATEEN NAME",fontsize: 13,fontWeight: FontWeight.bold,color:ResponsiveWebSite.isMobile(context)? Colors.white:Colors.black,),
                          GooglePoppinsWidgets(text: schooltext,fontsize: ResponsiveWebSite.isMobile(context)?23: 43,fontWeight: FontWeight.bold,color:ResponsiveWebSite.isMobile(context)? Colors.white:Colors.black,),
                        ],
                      ),
                     ),
                   )
                ],
            ),////////////////////////////////////////////////////////////////////0..................image
            Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/mall.png",height:  ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Address", fontsize:  ResponsiveWebSite.isMobile(context)?14:15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: addresstext, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////1........................Address
                  Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Image.asset("images/id-badge.png",height: ResponsiveWebSite.isMobile(context)?100:140,width: ResponsiveWebSite.isMobile(context)?100: 140,),
                        ),
                        GoogleLoraWidgets(text: "Canteen Id", fontsize: 15,fontWeight: FontWeight.w500,),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: canteenidtext, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),///////////////////////////////////////////////////////////////2....................Canteen Id
                   Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/phone-call.png",height: ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Contact Person", fontsize: 15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: contactpersontext, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),///////////////////////////////////////////////////////////////////3..........Contact Person
                   Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width:ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/call.png",height:  ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Albustan Person", fontsize: 15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: albustanpersontext, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////////////4..............Albustan Person
                    Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width:ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/flexible.png",height:  ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?20:  25),
                          child: GoogleLoraWidgets(text: "Working Time", fontsize: 15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GoogleLoraWidgets(text: starttimetext, fontsize: 13),////starting
                                GoogleLoraWidgets(text: " - ", fontsize: 13),
                              GoogleLoraWidgets(text: endtimetext, fontsize: 13),////ending
                            ],
                          ),
                        )
                        
                      ],
                    ),
                  ),//////////////////////////////////////////////////////5.......................Working Time
                  
   ];
    return  Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWebSite.isDesktop(context)? Column(
          children: [ 
           listWidgetOfCanteen[0],/////image
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  listWidgetOfCanteen[1],/////address
                  listWidgetOfCanteen[2],////Canteen Id
                  listWidgetOfCanteen[3]/////////////Contact Person
                     
                ],
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  listWidgetOfCanteen[4],//////////////Albustan Person
                  listWidgetOfCanteen[5]///////////////Working Time
                ],
              ),
            )
          ],
        ): ResponsiveWebSite.isTablet(context) 
        ?Column(
         children: [ 
           listWidgetOfCanteen[0],////////////image
           Padding(
             padding: const EdgeInsets.only(top: 15),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ 
                 listWidgetOfCanteen[1],///////////address
                 listWidgetOfCanteen[2],//////Canteen Id
              ],
             ),
           ),
            Padding(
               padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ 
                 listWidgetOfCanteen[3],//////////////Contact Person
                 listWidgetOfCanteen[4],////////////Albustan Person
              ],
                         ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                 listWidgetOfCanteen[5],//////////////////////Working Time
              ],
                         ),
            )
         ],
        )
        :Column(
          children: [ 
            listWidgetOfCanteen[0],//////////image
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: listWidgetOfCanteen[1],////////////address
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listWidgetOfCanteen[2],/////////Canteen Id
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfCanteen[3],//////////////Contact Person
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listWidgetOfCanteen[4],///////////////Albustan Person
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfCanteen[5],//////////////////////Working Time
             ),
            
          ],
        )
      ),
    );
  }
}