import 'package:flutter/material.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../../../generated/l10n.dart' as l;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DynamicTextFieldExample(),
    );
  }
}

class DynamicTextFieldExample extends StatefulWidget {
  const DynamicTextFieldExample({super.key});

  @override
  _DynamicTextFieldExampleState createState() =>
      _DynamicTextFieldExampleState();
}

class _DynamicTextFieldExampleState extends State<DynamicTextFieldExample> {
  final FormGroup documentUploadForm = FormGroup({
    'documentName': FormControl<String>(
      validators: [Validators.required],
    ),
    'expireDate': FormControl<String>(
      validators: [Validators.required],
    ),
  });
  List<TextEditingController> controllers = [];

  void addTextField() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = l.S.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: addTextField,
              child: Text('Add TextField'),
            ),
            SizedBox(height: 20),
            // Dynamically generated TextFields
            Column(
              children: controllers
                  .map((controller) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            ReactiveForm(
                              formGroup: documentUploadForm,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      // Left section (taking 50% of the space)
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          color: Colors.transparent,
                                          child: ReactiveTextField<String>(
                                            formControlName: 'documentName',
                                            decoration: InputDecoration(
                                              labelText: lang.documentName,
                                              border:
                                                  const OutlineInputBorder(),
                                              suffixIcon: ElevatedButton(
                                                onPressed: () async {
                                                  FilePickerResult? result =
                                                      await FilePicker.platform
                                                          .pickFiles();
                                                  if (result != null &&
                                                      documentUploadForm
                                                          .valid) {
                                                    documentUploadForm
                                                            .control('documentName')
                                                            .value =
                                                        result
                                                            .files.single.name;
                                                    print(
                                                        'Uploaded file path: ${result.files.single.path}');
                                                  } else {
                                                    documentUploadForm
                                                        .markAllAsTouched();
                                                  }
                                                },
                                                child: const Text('Browse'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                          width:
                                              16), // Space between the two columns

                                      // Right section (taking 50% of the space)
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          color: Colors.transparent,
                                          child: ReactiveForm(
                                            formGroup: documentUploadForm,
                                            child: Column(
                                              children: [
                                                ReactiveTextField<String>(
                                                  formControlName: 'expireDate',
                                                  decoration: InputDecoration(
                                                    labelText: lang.expireDate,
                                                    border:
                                                        OutlineInputBorder(),
                                                    suffixIcon: ElevatedButton(
                                                      onPressed: () {
                                                        showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2100),
                                                        ).then((pickedDate) {
                                                          if (pickedDate !=
                                                              null) {
                                                            documentUploadForm
                                                                    .control(
                                                                        'expireDate')
                                                                    .value =
                                                                pickedDate
                                                                    .toString();
                                                          }
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.calendar_month,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            color: Colors.transparent,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(Icons.save))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
