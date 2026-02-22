import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final int size; // in MB

  Ressource({required this.name, required this.size});

  get startDownload => startDownload;
}

enum DownloadStatus { notDownloaded, downloading, downloaded }

class DownloadController extends ChangeNotifier {
  DownloadController(this.ressource);

  // DATA
  Ressource ressource;
  DownloadStatus _status = DownloadStatus.notDownloaded;
  double _progress = 0.0; // 0.0 → 1.0
  double downloadingSize = 0.0;

  // GETTERS
  DownloadStatus get status => _status;
  double get progress => _progress;
  bool get canDownload => _status == DownloadStatus.notDownloaded;

  

  // ACTIONS
  void startDownload() async {
    if (_status == DownloadStatus.downloading) return;

    // TODO
    // 1 – set status to downloading
    _status = DownloadStatus.downloading;
    notifyListeners();
    // 2 – Loop 10 times and increment the download progress (0 -> 0.1 -> 0.2 )
    //      - Wait 1 second :  await Future.delayed(const Duration(milliseconds: 1000));

    while (_progress < 1) {
      await Future.delayed(const Duration(milliseconds: 1000));
      _progress += 0.1;
      if (_progress > 1) _progress = 1;
      downloadingSize = ressource.size * _progress;
      notifyListeners();
    }

    // 3 – set status to downloaded

    if (_progress == 1) {
      _status = DownloadStatus.downloaded;
      notifyListeners();
    }
  }
}
