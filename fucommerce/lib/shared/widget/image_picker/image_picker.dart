/*

1. harus bisa di set value
2. harus bisa diambil nilainya melalui event
*/
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fhe_template/shared/util/input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QImagePicker extends StatefulWidget {
  final String id;
  final String? value;
  final Function(String value) onChanged;
  final String? label;

  const QImagePicker({
    Key? key,
    this.value,
    required this.id,
    required this.onChanged,
    this.label,
  }) : super(key: key);

  @override
  State<QImagePicker> createState() => _QImagePickerState();
}

class _QImagePickerState extends State<QImagePicker>
    implements InputControllerState {
  String? imageUrl;

  @override
  setValue(value) {
    imageUrl = value;
    setState(() {});
  }

  @override
  getValue() {
    return imageUrl;
  }

  @override
  void initState() {
    super.initState();
    imageUrl = widget.value;
    inputControllers[widget.id] = this;
  }

  @override
  void dispose() {
    super.dispose();
    inputControllers.remove(widget.id);
  }

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
        if (filePath == null) return;

        final formData = FormData.fromMap({
          'image': MultipartFile.fromBytes(
            File(filePath).readAsBytesSync(),
            filename: "upload.jpg",
          ),
        });

        var res = await Dio().post(
          'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
          data: formData,
        );

        var data = res.data["data"];
        var url = data["url"];

        imageUrl = url;
        setState(() {});

        widget.onChanged(imageUrl!);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.label}"),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl ?? "https://i.ibb.co/S32HNjD/no-image.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
