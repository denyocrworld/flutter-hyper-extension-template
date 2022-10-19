import 'dart:io';
import 'package:example/core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ExLocationPicker extends StatefulWidget {
  final String id;
  final String? label;
  final double? latitude;
  final double? longitude;
  final bool enableEdit;

  const ExLocationPicker({
    Key? key,
    required this.id,
    this.label,
    this.latitude,
    this.longitude,
    this.enableEdit = true,
  }) : super(key: key);

  @override
  _ExLocationPickerState createState() => _ExLocationPickerState();
}

class _ExLocationPickerState extends State<ExLocationPicker>
    implements InputControlState {
  double? latitude;
  double? longitude;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    if (widget.latitude == null || widget.longitude == null) {
      Input.set("${widget.id}_latitude", null);
      Input.set("${widget.id}_longitude", null);
      getLocation();
    } else {
      Input.set("${widget.id}_latitude", widget.latitude);
      Input.set("${widget.id}_longitude", widget.longitude);

      latitude = widget.latitude;
      longitude = widget.longitude;
      loading = false;
    }
  }

  getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
    loading = false;
    setState(() {});
  }

  bool isLocationPicked() {
    if (latitude != null && longitude != null) {
      return true;
    }
    return false;
  }

  @override
  setValue(value) {}

  getValue(value) {}

  @override
  resetValue() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6.0, bottom: 4.0),
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
            ),
            child: Text(
              (widget.label ?? "Select Location"),
              style: const TextStyle(),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          if (isLocationPicked())
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        child: loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orange,
                                ),
                              )
                            : MapViewer(
                                latitude: latitude,
                                longitude: longitude,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 128,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Latitude:",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              "$latitude",
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            const Text(
                              "Longitude:",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              "$longitude",
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            if (!isLocationPicked())
                              ElevatedButton.icon(
                                icon: const Icon(Icons.location_on),
                                label: const Text("Select"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                ),
                                onPressed: () async {
                                  if (Platform.isAndroid || Platform.isIOS) {
                                    if (!await Permission.location
                                        .request()
                                        .isGranted) {
                                      return;
                                    }
                                    return;
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ExLocationPickerMapView(
                                        id: widget.id,
                                        latitude: latitude,
                                        longitude: longitude,
                                        enableEdit: widget.enableEdit,
                                      ),
                                    ),
                                  );

                                  setState(() {});
                                },
                              ),
                            if (isLocationPicked())
                              Transform.scale(
                                scale: 0.6,
                                alignment: Alignment.topLeft,
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.location_on),
                                  label: Text(
                                      widget.enableEdit ? "Change" : "View"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ExLocationPickerMapView(
                                          id: widget.id,
                                          latitude: latitude,
                                          longitude: longitude,
                                          enableEdit: widget.enableEdit,
                                        ),
                                      ),
                                    );

                                    loading = true;
                                    setState(() {});

                                    await Future.delayed(
                                        const Duration(milliseconds: 200));

                                    var pLatitude =
                                        Input.get("${widget.id}_latitude");
                                    var pLongitude =
                                        Input.get("${widget.id}_longitude");

                                    if (pLatitude != null) {
                                      latitude = pLatitude;
                                      longitude = pLongitude;
                                    }

                                    loading = false;
                                    setState(() {});
                                  },
                                ),
                              ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
