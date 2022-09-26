import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QImagePicker extends StatefulWidget {
  final String? value;
  final Function(String value)? onChanged;
  final Function(String value)? onUploaded;
  final String? label;
  final String? helperText;

  const QImagePicker({
    Key? key,
    this.value,
    this.onChanged,
    this.onUploaded,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QImagePicker> createState() => _QImagePickerState();
}

class _QImagePickerState extends State<QImagePicker> {
  String? selectedFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        XFile? image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 40,
        );
        String? filePath = image?.path;
        debugPrint("filePath: $filePath");

        if (filePath != null) {
          selectedFile = filePath;

          final formData = FormData.fromMap({
            'image': MultipartFile.fromBytes(
              File(selectedFile!).readAsBytesSync(),
              filename: "upload.jpg",
            ),
          });

          var res = await Dio().post(
            'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
            data: formData,
          );

          var data = res.data["data"];
          var url = data["url"];
          debugPrint("url: $url");
          setState(() {});

          if (widget.onUploaded != null) {
            widget.onUploaded!(url);
          }
        }
      },
      child: AbsorbPointer(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: "No file selected",
                decoration: InputDecoration(
                  labelText: widget.label,
                  labelStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: widget.helperText,
                  suffixIcon: const Icon(Icons.photo_outlined),
                ),
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                },
                onFieldSubmitted: (value) {
                  if (widget.onUploaded != null) widget.onUploaded!(value);
                },
              ),
              if (selectedFile != null)
                Builder(
                  builder: (context) {
                    var file = File(selectedFile!);
                    var uint8list = file.readAsBytesSync();

                    return Container(
                      height: 100.0,
                      width: 100.0,
                      margin: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(uint8list),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
