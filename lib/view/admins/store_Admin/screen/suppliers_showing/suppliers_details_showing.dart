import 'package:canteen_superadmin_website/core/fonts/google_lora.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class SuppliersDetailsShowingPage extends StatelessWidget {
  const SuppliersDetailsShowingPage({super.key});

  @override
  Widget build(BuildContext context) {
   final   listWidgetOfSuppliers = [
            SizedBox(
            height:ResponsiveWebSite.isMobile(context)?400: 600,
            width: double.infinity,
            child: Image.asset("images/lunch.jpg",fit: BoxFit.cover,)),
            ////////////////////////////////////////////////////////////////////0
            Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/supplier.png",height:  ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Suppliers Name", fontsize:  ResponsiveWebSite.isMobile(context)?14:15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Lepton Comminications Plus,Karimpanal Building , Near secretariat, Statue ,Trivadrum,678990", fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////1
                  Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Image.asset("images/search.png",height: ResponsiveWebSite.isMobile(context)?100:140,width: ResponsiveWebSite.isMobile(context)?100: 140,),
                        ),
                        GoogleLoraWidgets(text: "Supplier Id", fontsize: 15,fontWeight: FontWeight.w500,),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "bhdfhfdhjfn454454", fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),///////////////////////////////////////////////////////////////2
                   Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/mall.png",height: ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Address", fontsize: 15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "258963177", fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),///////////////////////////////////////////////////////////////////3
                   Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width:ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/end-call.png",height:  ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Contact Person", fontsize: 15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "258963177", fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////////////4
                   Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width:ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/best-product.png",height:  ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Products", fontsize: 15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "258963177", fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////////////5
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
                              GoogleLoraWidgets(text: "10:00", fontsize: 13),////starting
                                GoogleLoraWidgets(text: " - ", fontsize: 13),
                              GoogleLoraWidgets(text: "6:00", fontsize: 13),////ending
                            ],
                          ),
                        )
                        
                      ],
                    ),
                  ),//////////////////////////////////////////////////////6
                  
   ];
    return  Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWebSite.isDesktop(context)? Column(
          children: [ 
           listWidgetOfSuppliers[0],
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  listWidgetOfSuppliers[1],
                  listWidgetOfSuppliers[2],
                  listWidgetOfSuppliers[3]
                     
                ],
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  listWidgetOfSuppliers[4],
                  listWidgetOfSuppliers[5],
                  listWidgetOfSuppliers[6]
                ],
              ),
            )
          ],
        ): ResponsiveWebSite.isTablet(context) 
        ?Column(
         children: [ 
           listWidgetOfSuppliers[0],
           Padding(
             padding: const EdgeInsets.only(top: 15),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ 
                 listWidgetOfSuppliers[1],
                 listWidgetOfSuppliers[2],
              ],
             ),
           ),
            Padding(
               padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ 
                 listWidgetOfSuppliers[3],
                 listWidgetOfSuppliers[4],
              ],
                         ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                 listWidgetOfSuppliers[5],
                 listWidgetOfSuppliers[6]
              ],
                         ),
            )
         ],
        )
        :Column(
          children: [ 
            listWidgetOfSuppliers[0],
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: listWidgetOfSuppliers[1],
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listWidgetOfSuppliers[2],
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfSuppliers[3],
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listWidgetOfSuppliers[4],
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfSuppliers[5],
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfSuppliers[6],
             ),
            
          ],
        )
      ),
    );
  }
}