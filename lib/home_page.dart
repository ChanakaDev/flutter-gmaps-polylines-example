import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // created controller to display Google Maps
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> latLen = const [
    LatLng(6.909857477092524, 79.90000262460455),
    LatLng(6.892312715224115, 79.87701162186033),
    LatLng(6.889067607385608, 79.88091691818602),
    LatLng(6.887127277770555, 79.88396390762693),
    LatLng(6.887018988429013, 79.88716110077269),
    LatLng(6.8915887364814665, 79.8883165792876),
    LatLng(6.889904049836473, 79.88464731735523),
    LatLng(6.8918195152392565, 79.88569874328907),
    LatLng(6.891583411146554, 79.88829512161549),
    LatLng(6.896196152716394, 79.8905234033335),
    LatLng(6.901759563409906, 79.8941445350647),
    LatLng(6.905028260364582, 79.89460655822103),
    LatLng(6.9059012616710564, 79.89388277652553),
    LatLng(6.905725076407465, 79.89237001064113),
    LatLng(6.90836616091293, 79.89479501224889),
    LatLng(6.908094118040038, 79.89571232773199),
    LatLng(6.906758648656833, 79.9014071297226),
    LatLng(6.910023009911592, 79.90307643613562),
    LatLng(6.909329813048904, 79.89845204443972),
    LatLng(6.909515760364082, 79.89630627722781),
    LatLng(6.910074112090523, 79.89469469328228),
    LatLng(6.911838506738725, 79.8948880706649),
    LatLng(6.913411713660179, 79.89502429962158),
    LatLng(6.912216678527055, 79.89302132133095),
    LatLng(6.9084977402247025, 79.89245204597226),
    LatLng(6.911332498387527, 79.8793047877441)
  ];

  //on below line we have set the camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(6.892312715224115, 79.87701162186033),
    zoom: 14,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  @override
  void initState() {
    super.initState();

    // declared for loop for various locations
    for (int i = 0; i < latLen.length; i++) {
      _markers.add(
        // added markers
        Marker(
          markerId: MarkerId(i.toString()),
          position: latLen[i],
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'Marker $i',
            snippet: 'Marker at waypoint $i',
          ),
        ),
      );
      setState(() {});
      _polyline.add(Polyline(
        polylineId: const PolylineId('1'),
        points: latLen,
        color: Colors.green,
        width: 5,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F9D58),
        // title of app
        title: const Text("Google Polylines Test"),
      ),
      body: SafeArea(
        child: GoogleMap(
          //given camera position
          initialCameraPosition: _kGoogle,
          // on below line we have given map type
          mapType: MapType.normal,
          // specified set of markers below
          markers: _markers,
          // on below line we have enabled location
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          // on below line we have enabled compass location
          compassEnabled: true,
          // on below line we have added polylines
          polylines: _polyline,
          // displayed google map
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
