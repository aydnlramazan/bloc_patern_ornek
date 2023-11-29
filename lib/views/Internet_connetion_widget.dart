import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class InternetConnectionWidget extends StatefulWidget {
  @override
  _InternetConnectionWidgetState createState() =>
      _InternetConnectionWidgetState();
}

class _InternetConnectionWidgetState extends State<InternetConnectionWidget> {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionStatusController =
      StreamController<bool>();

  @override
  void initState() {
    super.initState();

    // Bağlantı durumunu dinlemek için bir listener ekliyoruz.
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult result) async {
    final bool isConnected = await _checkConnection();
    _connectionStatusController.add(isConnected);
  }

  Future<bool> _checkConnection() async {
    try {
      var result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    _connectionStatusController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<bool>(
        stream: _connectionStatusController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!
                ? Text('Internet connection is available.')
                : Text('No internet connection.');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
