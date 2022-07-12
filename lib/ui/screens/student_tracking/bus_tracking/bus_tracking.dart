import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusTracking extends StatefulWidget {
  const BusTracking({Key? key}) : super(key: key);

  @override
  State<BusTracking> createState() => _BusTrackingState();
}

class _BusTrackingState extends State<BusTracking> {
  GoogleMapController? mapController;
  List<LatLng> polylineCoordinates = [];
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  // late Position currentPosition;

  double _originLatitude = 0, _originLongitude = 0;

  PolylinePoints polylinePoints = PolylinePoints();
  var moveLocationPos;
  var studentLocationLocal;
  var routeLocal;
  @override
  void initState() {
    super.initState();
    initValues();
  }

  initValues() {
    studentLocationLocal = {
      "Latitude": "2.9993803030103963",
      "Longitude": "101.70644976119381",
      "RouteDetName": "UPM"
    };
    print("location studentLocation >> " + jsonEncode(studentLocationLocal));
    if (studentLocationLocal != null &&
        studentLocationLocal["Latitude"] != null) {
      routeLocal = [studentLocationLocal];
      moveLocationPos = studentLocationLocal;
    }

    moveLocationPos = routeLocal[0];
    print("location >> " + jsonEncode(routeLocal));

    /// origin marker
    print("routeList size ${routeLocal.length}");

    String desc = (routeLocal[0]["RouteDetName"] == null
        ? routeLocal[0]["Name"]
        : routeLocal[0]["RouteDetName"]);

    if (routeLocal[0]["NoOfStud"] != null) {
      desc = "$desc (${routeLocal[0]["NoOfStud"]})";
    }

    print("Pos 0 Start $desc");
    _addMarker(
        LatLng(double.parse(routeLocal[0]["Latitude"]),
            double.parse(routeLocal[0]["Longitude"])),
        desc,
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        routeLocal.length > 1 ? "Start: $desc" : "$desc");
    _originLatitude = double.parse(moveLocationPos["Latitude"]);
    _originLongitude = double.parse(moveLocationPos["Longitude"]);

    /// destination marker

    for (var i = 0; i < routeLocal.length; i++) {
      var item = routeLocal[i];
      print("location >> ${item["Latitude"]}");
      LatLng _lat1 = LatLng(
          double.parse(item["Latitude"]), double.parse(item["Longitude"]));
      BitmapDescriptor bitmapDescriptor =
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      String des =
          (item["RouteDetName"] == null ? item["Name"] : item["RouteDetName"]);
      if (item["NoOfStud"] != null) {
        desc = "$desc (${item["NoOfStud"]})";
      }
      if (i == 0 && routeLocal.length > 1) {
        des = "Start: $des";
        bitmapDescriptor =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      } else if (i == routeLocal.length - 1 && routeLocal.length > 1) {
        des = "Stop: $des";
        bitmapDescriptor =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      } else {
        des = "$des";
        bitmapDescriptor =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
      }

      print("Pos $i $des");

      _addMarker(
          _lat1,
          item["RouteDetName"] == null ? item["Name"] : item["RouteDetName"],
          bitmapDescriptor,
          des);
    }

    _getPolyline(double.parse(routeLocal[0]["Latitude"]),
        double.parse(routeLocal[0]["Longitude"]));
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    for (var marker in markers.values) {
      if (mapController != null) {
        mapController!.showMarkerInfoWindow(marker.markerId);
        return;
      }
    }
    // for (var item in routeLocal) {
    //   MarkerId markerId = MarkerId(
    //       item["RouteDetName"] == null ? item["Name"] : item["RouteDetName"]);
    //   mapController!.showMarkerInfoWindow(markerId);
    // }
  }

  _addMarker(
      LatLng position, String id, BitmapDescriptor descriptor, String title) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
        infoWindow: InfoWindow(
          title: title,
          // snippet: "Current Location",
          onTap: () {},
        ),
        icon: descriptor,
        position: position,
        visible: true);
    markers[markerId] = marker;

    if (mapController != null) {
      mapController!.showMarkerInfoWindow(markerId);
    }
  }

  _getPolyline(double latitude, double longitude) async {
    List<PolylineWayPoint> polyList = [];
    for (var item in routeLocal) {
      print("_getPolyline >> ${item["Latitude"]}, ${item["Longitude"]}");
      PolylineWayPoint polylineWayPoint = PolylineWayPoint(
          location: "${item["Latitude"]},${item["Longitude"]}");
      polyList.add(polylineWayPoint);
    }

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyB7RRx7v8uyN6QxjO_pS2JgsjnpHtts1AA",
        PointLatLng(latitude, longitude),
        PointLatLng(double.parse(routeLocal[routeLocal.length - 1]["Latitude"]),
            double.parse(routeLocal[routeLocal.length - 1]["Longitude"])),
        travelMode: TravelMode.driving,
        wayPoints: polyList);
    print("result.points");
    print(result.points);
    if (result.points.isNotEmpty) {
      print(result.points);
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        width: 3,
        polylineId: id,
        color: Colors.redAccent,
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bus Tracking")),
      body: Stack(children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(_originLatitude, _originLongitude), zoom: 14),
          myLocationEnabled: true,
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          onMapCreated: _onMapCreated,
          markers: Set<Marker>.of(markers.values),
          polylines: Set<Polyline>.of(polylines.values),
        )
      ]),
    );
  }
}
