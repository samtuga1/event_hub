import 'dart:async';

import 'package:animations/animations.dart';
import 'package:event_hub/consts/global_methods.dart';
import 'package:event_hub/logic/cubits/location/location_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bottom_nav_screen.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map_screen';
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController searchController = TextEditingController();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> goPosition(double? lat, double? long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat!, long!),
          zoom: 14.4746,
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    context.read<LocationCubit>().getLocation();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: GlobalMethods.globalAppBar('Set your location'),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
                child: OpenContainer(
                  transitionDuration: const Duration(seconds: 1),
                  closedBuilder: (context, openWidget) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: TextField(
                        style: theme.textTheme.bodyText1,
                        controller: searchController,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 5,
                          ),
                          prefixIcon: const Icon(CupertinoIcons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: Color(0xff575C60),
                              width: 0.5,
                            ),
                          ),
                        ),
                        onTap: openWidget,
                      ),
                    );
                  },
                  openBuilder: (context, closeWidget) {
                    return SearchLocationScreen(
                      onTap: closeWidget,
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocConsumer<LocationCubit, LocationState>(
                  listener: (context, state) {
                    if (state is LocationInfo) {
                      setState(() {
                        searchController.text =
                            state.placeMarks[0].subAdministrativeArea ?? '';
                      });
                      goPosition(state.lattitude, state.longitude);
                    }
                  },
                  builder: (context, state) {
                    return GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 14,
            right: 14,
            child: GlobalMethods.materialButton(
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                BottomBarScreen.routeName,
                (route) => false,
              ),
              child: 'Continue',
              theme: theme,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 5,
                  ),
                  prefixIcon: IconButton(
                    onPressed: onTap,
                    icon: const Icon(CupertinoIcons.back),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: Color(0xff575C60),
                      width: 0.2,
                    ),
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
