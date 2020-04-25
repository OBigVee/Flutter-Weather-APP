import 'package:climate_x/screen/locationScreen.dart';
import 'package:flutter/material.dart';
import 'package:climate_x/services/location.dart';
import 'package:climate_x/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '8f58aed0a9b0745c930bbcdb3b4bd3ec';

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  double latitude;
  double longitude;
  // LIFE CYCLE STARTS HERE,  IT IS USE TO TAP INTO DIFFERENT MOMMENT IN THE LIFE OF THE STATEFUL WIDGET
  // IN THIS PROGRAM IT IS USE TO AUTOMATICALLY GET THE LOCATION OF A USER

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    print('the code triggered');
  }

   void getLocationData() async {
    Location locate = Location();
    await locate.getCurrentLocation();
    latitude = locate.latitude;
    longitude = locate.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

     var weatherData = networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )
//        child: RaisedButton(
//          onPressed: () {
//            getLocation();
//          },
//          child: Text('Get location'),
//        ),
          ),
    );
  }
}
