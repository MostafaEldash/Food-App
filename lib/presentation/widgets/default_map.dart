import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DefaultMap extends StatelessWidget {
  const DefaultMap(
      {super.key,
      required this.initialCameraPosition,
      this.onTab,
      this.markers = const{},
      this.onMapCreated,
      this.myLocationEnabled = true,
      this.myLocationButtonEnabled = true,
      this.mapToolbarEnabled = true,
      this.zoomControlsEnabled = true,
      this.zoomGesturesEnabled = true,
      this.mapType = MapType.normal,
      this.padding = const EdgeInsets.all(0),
      this.circles=const{}});

  final CameraPosition initialCameraPosition;
  final void Function(LatLng)? onTab;
  final Set<Marker> markers;
  final void Function(GoogleMapController)? onMapCreated;
  final bool myLocationEnabled;
  final bool myLocationButtonEnabled;
  final bool mapToolbarEnabled;
  final bool zoomControlsEnabled;
  final bool zoomGesturesEnabled;
  final MapType mapType;
  final Set<Circle> circles;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      onTap: onTab,
      markers: markers,
      onMapCreated: onMapCreated,
      myLocationEnabled: myLocationEnabled,
      myLocationButtonEnabled: myLocationButtonEnabled,
      mapToolbarEnabled: mapToolbarEnabled,
      zoomControlsEnabled: zoomControlsEnabled,
      zoomGesturesEnabled: zoomGesturesEnabled,
      mapType: mapType,
      padding: padding,
      circles: circles,
    );
  }
}
