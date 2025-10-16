import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> syncGoldenCheetahFiles() async {
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    print("Permiso denegado");
    return;
  }

  final origen = Directory("/storage/shared/GoldenCheetah/Activities");
  final destino = await getApplicationDocumentsDirectory();

  if (!origen.existsSync()) {
    print("Carpeta de Golden Cheetah no encontrada");
    return;
  }

  final archivos = origen.listSync().whereType<File>().where((f) =>
      f.path.endsWith(".fit") || f.path.endsWith(".tcx") || f.path.endsWith(".csv"));

  for (var archivo in archivos) {
    final nombre = archivo.uri.pathSegments.last;
    final destinoPath = "${destino.path}/$nombre";

    if (!File(destinoPath).existsSync()) {
      await archivo.copy(destinoPath);
      print("Archivo copiado: $nombre");
    }
  }

  print("Sincronización completada");
}
