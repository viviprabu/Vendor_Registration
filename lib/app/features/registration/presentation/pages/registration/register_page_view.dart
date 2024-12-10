// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_address_details.dart';

import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_company_details.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_other_details.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_personal_details.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_upload_page.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final padding = responsiveValue<double>(
      context,
      xs: 16,
      sm: 16,
      md: 16,
      lg: 24,
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox.fromSize(
            //   size: Size.fromHeight(mqSize.height * 0.40),
            //   child: TabUnderline(
            //     theme: theme,
            //     textTheme: textTheme,
            //   ),
            // ),
            // const SizedBox(height: 24.0),
            SizedBox.fromSize(
              size: Size.fromHeight(mqSize.height * 1.10),
              child: Theme(
                data: theme.copyWith(
                  scrollbarTheme: theme.scrollbarTheme.copyWith(
                    thumbVisibility: WidgetStateProperty.all(false),
                    trackVisibility: WidgetStateProperty.all(false),
                  ),
                ),
                child: TabPill(
                  theme: theme,
                  textTheme: textTheme,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class TabPill extends StatefulWidget {
  const TabPill({
    super.key,
    required this.theme,
    required this.textTheme,
  });
  final ThemeData theme;
  final TextTheme textTheme;

  @override
  State<TabPill> createState() => _TabPillState();
}

class _TabPillState extends State<TabPill> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = responsiveValue<double>(
      context,
      xs: 16,
      sm: 16,
      md: 16,
      lg: 24,
      
    );

    String selectedTitle = 'Personal Details';
    final title = [
      //"Home",
      l.S.current.userDetails,
      // "company",
      l.S.current.company,
      // "address",
      l.S.current.address,
      // "Others",
      l.S.current.others,
      // "Upload",
      l.S.current.upload
    ];
    return ShadowContainer(
      // contentPadding: EdgeInsets.zero,
      // headerPadding: EdgeInsets.zero,
      customHeader: TabBar(
        splashBorderRadius: BorderRadius.circular(12),
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        indicatorColor: FinanceAppColors.kPrimary600,
        indicatorWeight: 2.0,
        dividerColor: widget.theme.colorScheme.outline,
        unselectedLabelColor: widget.theme.colorScheme.onTertiary,
        labelStyle: widget.textTheme.bodyMedium
            ?.copyWith(color: FinanceAppColors.kWhiteColor),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: _tabController.index == 0
                ? const Radius.circular(12)
                : Radius.zero,
            topRight: _tabController.index == 4
                ? const Radius.circular(12)
                : Radius.zero,
          ),
          color: widget.theme.colorScheme.primary,
        ),
        onTap: (_) => setState(
          () => selectedTitle = title[_],
        ),
        tabs: title
            .map(
              (e) => Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: padding / 2,
                  ),
                  child: Text(e),
                ),
              ),
            )
            .toList(),
      ),
      decoration: BoxDecoration(
        color: widget.theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PersonalDetailsForm(tabController: _tabController,),
                CompanyDetailsForm(tabController: _tabController,),
                AddressDetailsForm(tabController: _tabController,),
                OtherDetailsForm(tabController: _tabController,),
                UploadPage(tabController: _tabController),
              ],
              // children: List<Widget>.generate(
              //     _tabController.length,
              //     (index) => TabBarData(
              //           textTheme: widget.textTheme,
              //           index: index,
              //           theme: widget.theme,
                        
              //         )
                      
              //         ),
            ),
          ),
        ],
      ),
    );
  }
}

// class TabBarData extends StatelessWidget {
//   const TabBarData({
//     super.key,
//     required this.showBanner,
//     required this.theme,
//     required this.textTheme,
//   });

//   final ThemeData theme;
//   final TextTheme textTheme;
//   final String _bannerImg =
//       'assets/images/static_images/background_images/background_image_09.jpeg';
//   final bool showBanner;
//   @override
//   Widget build(BuildContext context) {
//     final lang = l.S.of(context);
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
          
//           Visibility(
//             visible: showBanner,
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               clipBehavior: Clip.antiAlias,
//               child: PersonalDetailsForm(),
              
//             ),
//           ),
//           Visibility(
//             visible: showBanner,
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               clipBehavior: Clip.antiAlias,
//               child: CompanyDetailsForm(),
              
//             ),
//           ),
          
//         ],
//       ),
//     );
//   }
// }
// class TabBarData extends StatelessWidget {
//   const TabBarData({
//     super.key,
//     required this.index,
//     required this.theme,
//     required this.textTheme,
//   });

//   final int index;
//   final ThemeData theme;
//   final TextTheme textTheme;

//   @override
//   Widget build(BuildContext context) {
//     switch (index) {
//       case 0:
//         return PersonalDetailsForm();
//       case 1:
//         return CompanyDetailsForm();
//       case 2:
//         return AddressDetailsForm(); // Add your address form here.
//       case 3:
//         return OtherDetailsForm(); // Add your others form here.
//       case 4:
//         return DocumentUploadForm(); // Add your upload form here.
//       default:
//         return Center(child: Text('No content for this tab'));
//     }
//   }
// }



// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_registration/app/core/theme/_app_colors.dart';
// import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_address_details.dart';
// import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_company_details.dart';
// import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_document_upload.dart';
// import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_other_details.dart';
// import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_personal_details.dart';

// class RegistrationForm extends StatefulWidget {
//   @override
//   _RegistrationFormState createState() => _RegistrationFormState();
// }

// class _RegistrationFormState extends State<RegistrationForm> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this); // Adjust length based on the number of tabs
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
        
//         automaticallyImplyLeading: false,
//         // title: Text("Tabs with Different Contexts"),
//         bottom: TabBar(
//           indicator: BoxDecoration(
//       color: Colors.grey[900],
//       shape: BoxShape.rectangle,
      
//     ),
//           padding: EdgeInsets.all(20),
//           overlayColor: WidgetStatePropertyAll(FinanceAppColors.kPrimary400),
//           indicatorColor: Colors.grey[900],
//           indicatorSize: TabBarIndicatorSize.tab,
//           automaticIndicatorColorAdjustment: true,          
//           indicatorWeight: 10,
//           indicatorPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
//           controller: _tabController,
//           labelColor: Colors.white,
//           tabs: const [
//             Tab(icon: Icon(Icons.person), text: "Profile"),
//             Tab(icon: Icon(Icons.business), text: "Company"),
//             Tab(icon: Icon(Icons.location_city), text: "Address"),
//             Tab(icon: Icon(Icons.devices_other), text: "Others"),
//             Tab(icon: Icon(Icons.upload), text: "Upload"),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           PersonalDetailsForm(), // Widget for the Profile tab
//           CompanyDetailsForm(), // Widget for the Company tab
//           AddressDetailsForm(), 
//           OtherDetailsForm(),
//           DocumentUploadForm() // Widget for the Settings tab
//         ],
//       ),
//     );
//   }
// }

// class ProfileTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("This is the Profile tab content."),
//     );
//   }
// }

// class CompanyTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("This is the Company tab content."),
//     );
//   }
// }

// class SettingsTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("This is the Settings tab content."),
//     );
//   }
// }
// class AddressTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("This is the Address tab content."),
//     );
//   }
// }
// class OthersTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("This is the Others tab content."),
//     );
//   }
// }
// class UploadTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("This is the DocumentUpload tab content."),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: RegistrationForm(),
//   ));
// }
