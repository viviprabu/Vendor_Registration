import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileUploadWithHttp extends StatefulWidget {
  const FileUploadWithHttp({super.key});

  @override
  _FileUploadWithHttpState createState() => _FileUploadWithHttpState();
}

class _FileUploadWithHttpState extends State<FileUploadWithHttp> {
  PlatformFile? objFile;
  bool isUploading = false;

  void chooseFileUsingFilePicker() async {
    var result = await FilePicker.platform.pickFiles(withReadStream: true);
    if (result != null) {
      setState(() {
        objFile = result.files.single;
      });
    }
  }

  void uploadSelectedFile() async {
    if (objFile == null) return;

    setState(() {
      isUploading = true;
    });

    final request = http.MultipartRequest(
      "POST",
      Uri.parse("Your API URL"),
    );
    request.fields["id"] = "abc";

    if (objFile?.readStream != null) {
      request.files.add(http.MultipartFile(
        "Your parameter name on server side",
        objFile!.readStream!,
        objFile!.size,
        filename: objFile!.name,
      ));

      try {
        var resp = await request.send();
        String result = await resp.stream.bytesToString();
        print(result);
      } catch (e) {
        print("File upload error: $e");
      } finally {
        setState(() {
          isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: chooseFileUsingFilePicker,
            child: Text("Choose File"),
          ),
          if (objFile != null) Text("File name: ${objFile!.name}"),
          if (objFile != null) Text("File size: ${objFile!.size} bytes"),
          ElevatedButton(
            onPressed: isUploading ? null : uploadSelectedFile,
            child: isUploading ? CircularProgressIndicator() : Text("Upload"),
          ),
        ],
      ),
    );
  }
}
