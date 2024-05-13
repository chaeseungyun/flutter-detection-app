import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'Dialog.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  String name = '';
  double x = 36.766453;
  double y = 127.281656;

  void setName() {
    name += '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(x, y),
              initialZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.detection.app',
              ),
              const RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                  ),
                ],
              ),
              MarkerLayer(markers: [
                Marker(
                    point: LatLng(x, y),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ))
              ])
            ],
          )),
          Text(name),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OpenDialog()));
              },
              child: const Text('모달 화면'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: setName,
        child: const Icon(Icons.star),
      ),
    );
  }
}
