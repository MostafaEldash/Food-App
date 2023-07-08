import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/core/my_cache_keys.dart';
import 'package:food_ninja/data/local/mycache.dart';
import 'package:food_ninja/presentation/styles/colors.dart';
import 'package:food_ninja/presentation/widgets/app_container.dart';
import 'package:food_ninja/presentation/widgets/default_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../../core/constants.dart';
import '../../../core/constants_methods.dart';
import '../../widgets/default_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? pickedLocation;
  Position? myLocation;

  @override
  void initState() {
    setState(() {
      determinePosition().then((value) => myLocation = value);
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            DefaultMap(
              initialCameraPosition: initialCameraPosition,
              onTab: (location) {
                setState(() {
                  pickedLocation = location;
                  if (kDebugMode) {
                    print(
                        "picked lat ${pickedLocation!.latitude} ,picked long ${pickedLocation!.longitude}");
                  }
                });
              },
              markers: pickedLocation != null
                  ? {
                      if (myLocation != null)
                        Marker(
                            markerId: const MarkerId('My Location'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueGreen),
                            position: LatLng(
                                myLocation!.latitude, myLocation!.longitude)),
                      Marker(
                          markerId: const MarkerId('Picked Location'),
                          position: pickedLocation!),
                    }
                  : {
                      if (myLocation != null)
                        Marker(
                            markerId: const MarkerId('My Location'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueGreen),
                            position: LatLng(
                                myLocation!.latitude, myLocation!.longitude)),
                    },
              circles: pickedLocation != null
                  ? {
                      if (myLocation != null)
                        Circle(
                            circleId: const CircleId('My Location'),
                            center: LatLng(
                                myLocation!.latitude, myLocation!.longitude),
                            radius: 20 * 100,
                            fillColor: Colors.lightGreen.withOpacity(0.3),
                            strokeColor: lightGreen,
                            strokeWidth: 2),
                      Circle(
                          circleId: const CircleId('Picked Location'),
                          center: pickedLocation!,
                          radius: 20 * 100,
                          fillColor: Colors.lightGreen.withOpacity(0.3),
                          strokeColor: lightGreen,
                          strokeWidth: 2),
                    }
                  : {
                      if (myLocation != null)
                        Circle(
                            circleId: const CircleId('My Location'),
                            center: LatLng(
                                myLocation!.latitude, myLocation!.longitude),
                            radius: 20 * 100,
                            fillColor: Colors.lightGreen.withOpacity(0.3),
                            strokeColor: lightGreen,
                            strokeWidth: 2),
                      Circle(
                          circleId: const CircleId('Initial Location'),
                          center: initialCameraPosition.target,
                          radius: 20 * 100,
                          fillColor: Colors.lightGreen.withOpacity(0.3),
                          strokeColor: lightGreen,
                          strokeWidth: 1),
                    },
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: AppContainer(
                      child: MaterialButton(
                        onPressed: () {
                          MyCache.putDouble(key: MyCacheKeys.lat, value: myLocation!.latitude);
                          MyCache.putDouble(key: MyCacheKeys.long, value: myLocation!.longitude);
                          Navigator.pushNamedAndRemoveUntil(context, screens.signUpSuccessScreen, (route) => false);
                        },
                        child: DefaultText(
                          text: 'Set My Location',
                          weight: FontWeight.bold,
                          textSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
