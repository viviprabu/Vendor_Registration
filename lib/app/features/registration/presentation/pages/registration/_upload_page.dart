// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';

// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';


// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;


class UploadPage extends StatefulWidget {
  final TabController tabController;
  const UploadPage({super.key, required this.tabController});

  @override
  State<UploadPage> createState() => _UploadPageState();
  
}

final FormGroup documentUploadForm = FormGroup({
    'documentName': FormControl<String>(
      validators: [Validators.required],
    ),
    'expireDate': FormControl<String>(
      validators: [Validators.required],
    ),
  });
  // final List<String> documentList = ['Memorandum of Association',
  // 'Ammendments to the memorandum of Association',
  // 'Certificate from the Central Agency for Public Tenders',
  // 'Certificate from the Central Agency for Information Technology',
  // 'Certificate from the Chamber of Commerce and Industry',
  // 'National Labour Certificate',
  // 'Authorization Form',
  // 'Civil Information Certificate',
  // 'Commercial License Certificate'

  // ];

   final List<Map<String, String>> companyDocumentsList = [
    {'companyTypeId': '1', 'name': 'Memorandum of Association',},
    {'companyTypeId': '1', 'name': 'Ammendments to the memorandum of Association'},
    {'companyTypeId': '1', 'name': 'Certificate from the Central Agency for Public Tenders'},
    {'companyTypeId': '1', 'name': 'Certificate from the Central Agency for Information Technology'},
    {'companyTypeId': '1', 'name': 'Certificate from the Chamber of Commerce and Industry'},
    {'companyTypeId': '1', 'name': 'National Labour Certificate'},
    {'companyTypeId': '1', 'name': 'Authorization Form'},
    {'companyTypeId': '1', 'name': 'Civil Information Certificate'},
    {'companyTypeId': '1', 'name': 'Commercial License Certificate'},
    {'companyTypeId': '2', 'name': 'Memorandum of Association',},
    {'companyTypeId': '2', 'name': 'Ammendments to the memorandum of Association'},
    {'companyTypeId': '2', 'name': 'Certificate from the Central Agency for Public Tenders'},
    {'companyTypeId': '2', 'name': 'Certificate from the Central Agency for Information Technology'},
    {'companyTypeId': '2', 'name': 'Certificate from the Chamber of Commerce and Industry'},
    {'companyTypeId': '2', 'name': 'National Labour Certificate'},
    {'companyTypeId': '2', 'name': 'Authorization Form'},
    {'companyTypeId': '3', 'name': 'Memorandum of Association',},
    {'companyTypeId': '3', 'name': 'Ammendments to the memorandum of Association'},
    {'companyTypeId': '3', 'name': 'Certificate from the Central Agency for Public Tenders'},
    {'companyTypeId': '3', 'name': 'Certificate from the Central Agency for Information Technology'},
    {'companyTypeId': '3', 'name': 'Certificate from the Chamber of Commerce and Industry'},
    {'companyTypeId': '3', 'name': 'National Labour Certificate'},
    {'companyTypeId': '4', 'name': 'Memorandum of Association',},
    {'companyTypeId': '4', 'name': 'Ammendments to the memorandum of Association'},
    {'companyTypeId': '4', 'name': 'Certificate from the Central Agency for Public Tenders'},
    {'companyTypeId': '4', 'name': 'Certificate from the Central Agency for Information Technology'},
    {'companyTypeId': '4', 'name': 'Certificate from the Chamber of Commerce and Industry'},
    {'companyTypeId': '4', 'name': 'National Labour Certificate'},
    {'companyTypeId': '4', 'name': 'Authorization Form'},
    {'companyTypeId': '4', 'name': 'Civil Information Certificate'},
    {'companyTypeId': '4', 'name': 'Commercial License Certificate'},
    {'companyTypeId': '5', 'name': 'Memorandum of Association',},
    {'companyTypeId': '5', 'name': 'Ammendments to the memorandum of Association'},
    {'companyTypeId': '5', 'name': 'Certificate from the Central Agency for Public Tenders'},
    {'companyTypeId': '5', 'name': 'Certificate from the Central Agency for Information Technology'},
    {'companyTypeId': '5', 'name': 'Certificate from the Chamber of Commerce and Industry'},
    {'companyTypeId': '5', 'name': 'National Labour Certificate'},
    {'companyTypeId': '5', 'name': 'Authorization Form'},
    {'companyTypeId': '5', 'name': 'Civil Information Certificate'},
    {'companyTypeId': '6', 'name': 'Memorandum of Association',},
    {'companyTypeId': '6', 'name': 'Ammendments to the memorandum of Association'},
    {'companyTypeId': '6', 'name': 'Certificate from the Central Agency for Public Tenders'},
    {'companyTypeId': '6', 'name': 'Certificate from the Central Agency for Information Technology'},
    {'companyTypeId': '6', 'name': 'Certificate from the Chamber of Commerce and Industry'},
    
  ];

    String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
  
class _UploadPageState extends State<UploadPage> {
  final browserDefaultFormKey = GlobalKey<FormState>();
  bool isBrowserDefaultChecked = false;

  final customFormKey = GlobalKey<FormState>();
  bool isCustomFormChecked = false;

  @override
  Widget build(BuildContext context) {

    final filteredData = companyDocumentsList.where((data) => data['companyTypeId'] == '2').toList();
    // final _theme = Theme.of(context);
    final lang = l.S.of(context);
    final dropdownStyle = FinanceDropdownStyle(context);
    // final _inputFieldStyle = FinanceInputFieldStyles(context);
    const lg = 4;
    const md = 6;

    final sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 992,
          value: _SizeInfo(
            fonstSize: 10,
            padding: EdgeInsets.all(5),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Id')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Upload')),
            DataColumn(label: Text('Expiry Date')),
          ],
          rows: filteredData
              .map((item) => DataRow(cells: [
                    DataCell(Text(item['companyTypeId'].toString())),
                    DataCell(Text(item['name'].toString())),
                    DataCell(ReactiveForm(
                        formGroup: documentUploadForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                        formControlName: 'documentName',
                        decoration: InputDecoration(
                          labelText: lang.documentName,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                          onPressed: () async {
                               FilePickerResult? result = await FilePicker.platform.pickFiles();
    
                          if (result != null) {
                             final file = result.files.single;                                        
                            final isValidFile = validateFile(file);

                          if(isValidFile){
                            documentUploadForm.control('documentName').value = file.name ?? 'No path available'; 
                             documentUploadForm.control('documentName').value = file.name;  
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('File selected: ${file.name}')));            
                          }else{
                             ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid file selected. Only PDF files are allowed.')));
                         }               
                         }
                     else {
                      // Handle invalid file
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Select any PDF files to upload')));
                      }
   },
  icon: Icon(Icons.browse_gallery_rounded),
  // child: const Text('Browse'),
),
                        ),
                                        ),
                          ],
                        )),    ),
                    DataCell(Text('')),
                    
                  ]))
                  
              .toList(),
        ),
      ),
    );
  }
}

class _SizeInfo {
  final double? fonstSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.fonstSize,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}


bool validateFile(PlatformFile file) {
  // Define your own validation logic (e.g., file extension or size)
  final allowedTypes = ['pdf']; // Allowed file types
  final maxSize = 20 * 1024 * 1024; // Max file size (10MB)
  
  bool isValidType = allowedTypes.contains(file.extension);
  bool isValidSize = file.size <= maxSize;
  
  return isValidType && isValidSize;
}

// bool validateFile(PlatformFile file) {
//     // Check if the file has a .pdf extension
//     return file.extension == "pdf";
//   }