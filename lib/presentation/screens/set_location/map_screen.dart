import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/core/my_cache_keys.dart';
import 'package:food_ninja/data/local/mycache.dart';
import 'package:food_ninja/presentation/styles/colors.dart';
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
        child: Stack(children: [
          DefaultMap(
            initialCameraPosition: initialCameraPosition,
            onTab: (location) {
              setState(() {
                pickedLocation = location;
                myLocation = null;
                MyCache.putDouble(
                    key: MyCacheKeys.lat,
                    value: pickedLocation!.latitude);
                MyCache.putDouble(
                    key: MyCacheKeys.long,
                    value: pickedLocation!.longitude);
                if (kDebugMode) {
                  print(
                      'pickedLat: ${pickedLocation!.latitude}, pickedLng: ${pickedLocation!.longitude}');
                }
              });
            },
            markers: pickedLocation != null
                ? {
              Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
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
              Circle(
                  circleId: const CircleId('Picked Location'),
                  center: pickedLocation!,
                  radius: 2 * 100,
                  fillColor: lightGreen.withOpacity(0.3),
                  strokeColor: lightGreen,
                  strokeWidth: 2),
            }
                : {
              if (myLocation != null)
                Circle(
                    circleId: const CircleId('My Location'),
                    center: LatLng(
                        myLocation!.latitude, myLocation!.longitude),
                    radius: 2 * 100,
                    fillColor: lightGreen.withOpacity(0.3),
                    strokeColor: lightGreen,
                    strokeWidth: 2),
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Container(
                    width: 80.w,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [lightGreen, deepGreen]),
                        borderRadius: BorderRadius.circular(15.sp),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.1))
                        ]),
                    child: MaterialButton(
                      onPressed: () {
                        if (myLocation != null) {
                          MyCache.putDouble(
                              key: MyCacheKeys.lat, value: myLocation!.latitude);
                          MyCache.putDouble(
                              key: MyCacheKeys.long, value: myLocation!.longitude);
                        } else {
                          MyCache.putDouble(
                              key: MyCacheKeys.lat,
                              value: pickedLocation!.latitude);
                          MyCache.putDouble(
                              key: MyCacheKeys.long,
                              value: pickedLocation!.longitude);
                        }
                        Navigator.pushNamedAndRemoveUntil(
                            context, screens.signUpSuccessScreen, (route) => false);
                      },
                      child: DefaultText(
                        textColor: Colors.white,
                        text: 'Set Location',
                        weight: FontWeight.bold,
                        textSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
    ;
  }
}
