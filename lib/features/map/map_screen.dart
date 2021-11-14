import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_bloc.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapBloc mapBloc;

  // region Init
  @override
  void initState() {
    mapBloc = MapBloc(context);
    mapBloc.init();
    super.initState();
  }
  // endregion

  // region Dispose
  @override
  void dispose() {
    mapBloc.dispose();
    super.dispose();
  }
  // endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map View"),
      ),
      body: body(),
    );
  }

  //region body
  Widget body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: mapView(),
    );
  }
//endregion

  // region mapView
  Widget mapView() {
    return StreamBuilder<bool>(
        stream: mapBloc.mapCtrl.stream,
        builder: (context, snapshot) {
          return GoogleMap(
              mapType: MapType.normal,
              onTap: (latLng) => mapBloc.onTapMap(latLng),
              initialCameraPosition: mapBloc.initialCameraPosition,
              myLocationEnabled: true,
              compassEnabled: true,
              zoomControlsEnabled: false,
              markers: mapBloc.markers,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                mapBloc.controller.complete(controller);
              });
        });
  }

// endregion
}
