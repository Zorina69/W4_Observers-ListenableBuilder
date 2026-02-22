import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatefulWidget {
  const DownloadTile({
    super.key,
    required this.controller,
    this.title,
    required this.onPressed, 
    this.selected = true,
  });

  final DownloadController controller;
  // TODO
  final String? title;
  final bool selected;
  final VoidCallback onPressed;

  @override
  State<DownloadTile> createState() => _DownloadTileState();
}

class _DownloadTileState extends State<DownloadTile> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {}); // rebuild widget when controller updates
    });
  }

  IconData get iconData {
      if (widget.controller.progress == 0) {
        return Icons.download;
      } else if (widget.controller.progress < 1) {
        return Icons.downloading;
      } else {
        return Icons.folder;
      }
  }

  @override
  Widget build(BuildContext context) {
    // TODO
    return ListTile(
      title: Text(widget.controller.ressource.name),
      tileColor: Colors.grey,
      subtitle: widget.selected
          ? Text(
              "${(widget.controller.progress * 100).toStringAsFixed(2)} % completed - ${(widget.controller.downloadingSize).toStringAsFixed(2)} of ${widget.controller.ressource.size} MB",
            )
          : null,
      trailing: IconButton(
        onPressed: widget.controller.canDownload ? widget.onPressed : null,
        icon: Icon(iconData),
      ),
    );
  }
}
