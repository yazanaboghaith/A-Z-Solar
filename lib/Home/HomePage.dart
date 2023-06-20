// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:az_solar/Auth/Login.dart';
// import 'package:az_solar/widgets/HomeCardCustom.dart';
// import 'package:flutter/material.dart';

// import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget {
//   bool? isLogged;
//   HomePage({this.isLogged});
//   @override
//   Widget build(BuildContext context) {
//     profileProvider = Provider.of<ProfileProvider>(context);
//     authprovider = Provider.of<AuthProvider>(context);
//     centerProvider = Provider.of<CenterProvider>(context);
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           isLogged!
//               ? Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       profileProvider.getProfile();
//                       profileProvider.getmyInscurance();
//                       profileProvider.getmyMaintance();
//                       profileProvider.getmyTowing();
//                       Navigator.push(
//                           context,
//                           PageTransition(
//                               child: ProfilePage(),
//                               type: PageTransitionType.fade));
//                     },
//                     child: Icon(Icons.person),
//                   ),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(Icons.arrow_forward),
//                   ),
//                 )
//         ],
//         leading: isLogged!
//             ? PopupMenuButton(
//                 onSelected: (value) async {
//                   if (value == 0) {
//                     Navigator.push(
//                         context,
//                         PageTransition(
//                             child: LanguagePage(),
//                             type: PageTransitionType.fade));
//                   } else if (value == 1) {
//                     authprovider.removeuser();
//                     Navigator.pushAndRemoveUntil(
//                         context,
//                         PageTransition(
//                             child: Login(), type: PageTransitionType.fade),
//                         (route) => false);
//                   }
//                 },
//                 itemBuilder: (context) {
//                   return [
//                     PopupMenuItem(
//                       value: 0,
//                       child: Text(AppLocalizations.of(context).settings),
//                     ),
//                     PopupMenuItem(
//                       value: 1,
//                       child: Text(AppLocalizations.of(context).logout),
//                     ),
//                   ];
//                 },
//               )
//             : PopupMenuButton(
//                 onSelected: (value) async {
//                   if (value == 0) {
//                     Navigator.push(
//                         context,
//                         PageTransition(
//                             child: LanguagePage(),
//                             type: PageTransitionType.fade));
//                   }
//                 },
//                 itemBuilder: (context) {
//                   return [
//                     PopupMenuItem(
//                       value: 0,
//                       child: Text(AppLocalizations.of(context).settings),
//                     ),
//                   ];
//                 },
//               ),
//         backgroundColor: Color(0xff4067b1),
//         title: Text(AppLocalizations.of(context).homepage),
//         centerTitle: true,
//       ),
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             children: [
//               Divider(
//                 color: Colors.transparent,
//               ),
//               SizedBox(
//                 width: width * 0.3,
//                 child: Image.asset("image/Logo.png"),
//               ),
//               SizedBox(
//                 width: width * .3,
//                 child: FittedBox(
//                   fit: BoxFit.fitWidth,
//                   child: Image.asset('image/textLogo.png'),
//                 ),
//               ),
//               Divider(
//                 color: Color(0xff4067b1),
//               ),
//               ListTile(
//                 title: Text(AppLocalizations.of(context).homepage),
//                 leading: Icon(Icons.home),
//               ),
//               ListTile(
//                 title: Text(AppLocalizations.of(context).settings),
//                 leading: Icon(Icons.settings),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     PageTransition(
//                         child: LanguagePage(), type: PageTransitionType.fade),
//                   );
//                 },
//               ),
//               ListTile(
//                 title: Text(AppLocalizations.of(context).logout),
//                 leading: Icon(Icons.logout),
//                 onTap: () async {},
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: GridView.count(
//         shrinkWrap: true,
//         childAspectRatio: 1,
//         crossAxisCount: 2,
//         padding: EdgeInsets.symmetric(vertical: 20),
//         mainAxisSpacing: 22,
//         crossAxisSpacing: 4,
//         children: [
//           HomeCardCustom(
//             width: width,
//             image: "image/Logo.png",
//             title: AppLocalizations.of(context).taqdeercenter,
//             ontap: () {
//               Navigator.push(
//                 context,
//                 PageTransition(
//                     child: CentersPage(), type: PageTransitionType.fade),
//               );
//             },
//           ),
//           HomeCardCustom(
//             width: width,
//             image: "image/Home/accidents.png",
//             title: AppLocalizations.of(context).accidents,
//             ontap: () {
//               Navigator.push(
//                 context,
//                 PageTransition(
//                     child: Accidents(), type: PageTransitionType.fade),
//               );
//             },
//           ),
//           HomeCardCustom(
//             width: width,
//             image: "image/Home/parts.png",
//             title: AppLocalizations.of(context).spareparts,
//             ontap: () {
//               Navigator.push(
//                 context,
//                 PageTransition(
//                     child: SpareParts(), type: PageTransitionType.fade),
//               );
//             },
//           ),
//           HomeCardCustom(
//             width: width,
//             image: "image/Home/maintenance.png",
//             title: AppLocalizations.of(context).maintenanceservice,
//             ontap: () {
//               Navigator.push(
//                 context,
//                 PageTransition(
//                     child: MaintenancePage(), type: PageTransitionType.fade),
//               );
//             },
//           ),
//           HomeCardCustom(
//             width: width,
//             image: "image/Home/insurance.png",
//             title: AppLocalizations.of(context).insurence,
//             ontap: () {
//               if (isLogged!) {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                       child: IncsurancePage(), type: PageTransitionType.fade),
//                 );
//               } else {
//                 AwesomeDialog(
//                   context: context,
//                   dialogType: DialogType.warning,
//                   animType: AnimType.scale,
//                   title: AppLocalizations.of(context).accessdenied,
//                   desc: AppLocalizations.of(context).titleaccessdenied,
//                 ).show();
//               }
//             },
//           ),
//           HomeCardCustom(
//             width: width,
//             image: "image/Home/towing.png",
//             title: AppLocalizations.of(context).transferservice,
//             ontap: () {
//               Navigator.push(
//                 context,
//                 PageTransition(
//                     child: TowingPage(), type: PageTransitionType.fade),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
