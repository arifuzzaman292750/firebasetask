import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          zoom: 16,
          target: LatLng(26.10541224329801, 88.836598128888),
        ),
        onTap: (LatLng? latLng) {
          print(latLng);
        },
        zoomControlsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        trafficEnabled: true,
        markers: <Marker>{
          const Marker(
            markerId: MarkerId('initial-position'),
            position: LatLng(
              26.10541224329801,
              88.836598128888,
            ),
          ),
          Marker(
            markerId: const MarkerId('home'),
            position: const LatLng(
              26.10405395859506,
              88.83374836295843,
            ),
            infoWindow: InfoWindow(
              title: 'Home',
              onTap: () {
                print('on tapped');
              },
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
            draggable: true,
            onDragStart: (LatLng onStartLatLng) {
              print('on start $onStartLatLng');
            },
            onDragEnd: (LatLng onEndLatLng) {
              print('on end $onEndLatLng');
            },
          ),
        },
        circles: <Circle>{
          Circle(
              circleId: const CircleId('dengue-circle'),
              fillColor: Colors.red.withOpacity(0.3),
              center: const LatLng(
                26.105192023248303,
                88.83533522486687,
              ),
              radius: 300,
              strokeColor: Colors.blue,
              strokeWidth: 1,
              visible: true,
              onTap: () {
                print('Enter into dengue zone');
              }),
          Circle(
              circleId: const CircleId('blue-circle'),
              fillColor: Colors.blue.withOpacity(0.3),
              center: const LatLng(
                26.10102568923031,
                88.83646544069052,
              ),
              radius: 800,
              strokeColor: Colors.blue,
              strokeWidth: 1,
              visible: true,
              onTap: () {
                print('Enter into blue zone');
              }),
        },
        polylines: <Polyline>{
          const Polyline(
            polylineId: PolylineId('random'),
            color: Colors.amber,
            width: 5,
            jointType: JointType.round,
            points: <LatLng>[
              LatLng(26.08281979643927, 88.83622337132692),
              LatLng(26.088762474177823, 88.84268414229155),
              LatLng(26.09619077332231, 88.84917609393597),
            ],
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: const PolygonId('poly-id'),
            fillColor: Colors.pink.withOpacity(0.4),
            strokeColor: Colors.white,
            strokeWidth: 2,
            points: const <LatLng>[
              LatLng(26.079392569548485, 88.84013269096613),
              LatLng(26.082055823527757, 88.84312905371189),
              LatLng(26.081887489842938, 88.85289799422026),
              LatLng(26.076112504111098, 88.85071333497763),
              LatLng(26.072299899790128, 88.84163070470095),
            ],
          ),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                zoom: 16,
                target: LatLng(26.10541224329801, 88.836598128888),
              ),
            ),
          );
        },
        child: const Icon(Icons.local_hotel),
      ),
    );
  }
}
