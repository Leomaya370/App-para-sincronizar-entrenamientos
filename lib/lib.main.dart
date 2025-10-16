import 'package:flutter/material.dart';
import 'file_sync.dart';

void main() => runApp(GCSyncApp());

class GCSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SyncScreen(),
    );
  }
}

class SyncScreen extends StatelessWidget {
  void iniciarSincronizacion() {
    syncGoldenCheetahFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Golden Cheetah Sync")),
      body: Center(
        child: ElevatedButton(
          onPressed: iniciarSincronizacion,
          child: Text("Descargar entrenamientos"),
        ),
      ),
    );
  }
}
