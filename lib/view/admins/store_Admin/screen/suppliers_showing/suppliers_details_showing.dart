import 'package:canteen_superadmin_website/core/fonts/google_lora.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class SuppliersDetailsShowingPage extends StatelessWidget {
   final String suppliersimagepath;
  final String suppliersnametext;
  final String suppliersaddress;
  final String suppliersidtext;
  final String supplierscontactperson;
  final String producttext;
  final String suppliersstarttime;
  final String suppliersendtime; 
  const SuppliersDetailsShowingPage({
    super.key, 
    required this.suppliersimagepath,
     required this.suppliersnametext, 
     required this.suppliersaddress, 
     required this.suppliersidtext, 
     required this.supplierscontactperson,
     required this.producttext,
     required this.suppliersstarttime, 
     required this.suppliersendtime});

  @override
  Widget build(BuildContext context) {
   final   listWidgetOfSuppliers = [
            SizedBox(
            height:ResponsiveWebSite.isMobile(context)?400: 600,
            width: double.infinity,
            child: Image.asset("images/supply-.jpg",fit: BoxFit.cover,)),
            ////////////////////////////////////////////////////////////////////0......................image
            Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?10:15),
                          child: suppliersimagepath ==''?
                          Image.asset("images/supplier.png",height:  ResponsiveWebSite.isMobile(context)?80: 100,width:  ResponsiveWebSite.isMobile(context)?80: 100,)
                        :Image.network(suppliersimagepath)),
                        Padding(
                          padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Suppliers Name", fontsize:  ResponsiveWebSite.isMobile(context)?14:15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: suppliersnametext, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////1................Suppliers Name
                  Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.blue.withOpacity(0.1)),
                    width: ResponsiveWebSite.isMobile(context)?260: 300,
                    height: ResponsiveWebSite.isMobile(context)? 220:260,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only( top: ResponsiveWebSite.isMobile(context)?10:15),
                          child: Image.asset("images/search.png",height: ResponsiveWebSite.isMobile(context)?80:100,width: ResponsiveWebSite.isMobile(context)?80: 100,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: "Supplier Id", fontsize: 15,fontWeight: FontWeight.w500,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  ResponsiveWebSite.isMobile(context)?5: 10,left:  ResponsiveWebSite.isMobile(context)?15: 20,right:  ResponsiveWebSite.isMobile(context)?15: 20),
                          child: GoogleLoraWidgets(text: suppliersidtext, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),///////////////////////////////////////////////////////////////2...............................Supplier Id
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
                          child: GoogleLoraWidgets(text: suppliersaddress, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),///////////////////////////////////////////////////////////////////3.....................Address
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
                          child: GoogleLoraWidgets(text: supplierscontactperson, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////////////4.......................Contact Person
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
                          child: GoogleLoraWidgets(text: producttext, fontsize: 13),
                        )
                        
                      ],
                    ),
                  ),/////////////////////////////////////////////////5/..................Products
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
                              GoogleLoraWidgets(text: suppliersstarttime, fontsize: 13),////starting
                                GoogleLoraWidgets(text: " - ", fontsize: 13),
                              GoogleLoraWidgets(text: suppliersendtime, fontsize: 13),////ending
                            ],
                          ),
                        )
                        
                      ],
                    ),
                  ),//////////////////////////////////////////////////////6...........................Working Time
                  
   ];
    return  Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWebSite.isDesktop(context)? Column(
          children: [ 
           listWidgetOfSuppliers[0],///......image
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  listWidgetOfSuppliers[1],/////////////suppliers name
                  listWidgetOfSuppliers[2],/////////////suppliers id
                  listWidgetOfSuppliers[3]/////////////////Address"
                     
                ],
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  listWidgetOfSuppliers[4],///////////////////contact person
                  listWidgetOfSuppliers[5],/////////////product
                  listWidgetOfSuppliers[6]///////////////working time
                ],
              ),
            )
          ],
        ): ResponsiveWebSite.isTablet(context) 
        ?Column(
         children: [ 
           listWidgetOfSuppliers[0],//////////////image
           Padding(
             padding: const EdgeInsets.only(top: 15),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ 
                 listWidgetOfSuppliers[1],///////////////
                 listWidgetOfSuppliers[2],//////////////
              ],
             ),
           ),
            Padding(
               padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ 
                 listWidgetOfSuppliers[3],/////////////////Address"
                 listWidgetOfSuppliers[4],////////////////.Contact Person
              ],
                         ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                 listWidgetOfSuppliers[5],//////////////////Products
                 listWidgetOfSuppliers[6]/////............Working Time
              ],
                         ),
            )
         ],
        )
        :Column(
          children: [ 
            listWidgetOfSuppliers[0],/////////////image
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: listWidgetOfSuppliers[1],////////////suppliers name
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listWidgetOfSuppliers[2],/////////////////////suppliers id
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfSuppliers[3],/////////Address
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listWidgetOfSuppliers[4],/////Contact Person
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfSuppliers[5],///////////////////Products
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: listWidgetOfSuppliers[6],//////working time
             ),
            
          ],
        )
      ),
    );
  }
}