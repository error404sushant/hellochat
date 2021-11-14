import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc {
  //region common variables
  BuildContext context;
  //endregion

  // region Google Map
  Completer<GoogleMapController> controller = Completer();
  late CameraPosition initialCameraPosition = CameraPosition(target: LatLng(21.7679, 78.8718), zoom: 10);
  late GoogleMapController googleMapController;
  Set<Marker> markers = HashSet<Marker>();
  // endregion

  // region Controller
  final mapCtrl = StreamController<bool>.broadcast();
  // endregion

//region constructre
  MapBloc(this.context);
//endregion

  // region init
  void init() async {
    // initial camera (BY DEFAULT SHOW INDIA MAP)

    // initialise Map Controller
    googleMapController = await controller.future;
  }

  // endregion

  // region onTapMap
  void onTapMap(LatLng latLng) {
    markers.clear();

    // get marker
    var marker = getMarker(latLng);
    markers.add(marker);

    // refresh map
    if (!mapCtrl.isClosed) mapCtrl.sink.add(true);

    googleMapController.showMarkerInfoWindow(MarkerId('marker_id'));
  }

  // endregion

  // region GetMarker
  Marker getMarker(LatLng? point) {
    return Marker(
        draggable: true,
        consumeTapEvents: true,
        visible: true,
        onDragStart: (position) {
          googleMapController.hideMarkerInfoWindow(MarkerId('marker_id'));
        },
        onDragEnd: (position) {
          onTapMap(position);
        },
        onTap: () {
          googleMapController.showMarkerInfoWindow(MarkerId('marker_id'));
        },
        infoWindow: InfoWindow(title: "${point!.latitude.toStringAsFixed(6)}, ${point.longitude.toStringAsFixed(6)}"),
        anchor: const Offset(0.5, 0.5),
        markerId: MarkerId('marker_id'),
        position: point);
  }

  // endregion

// region Dispose
  void dispose() {
    mapCtrl.close();
  }
// endregion

}
