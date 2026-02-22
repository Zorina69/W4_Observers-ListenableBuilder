import 'package:flutter/material.dart';
import 'package:observer/2_download_app/ui/screens/downloads/widgets/download_tile.dart';
import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widgets/download_controler.dart';


class DownloadsScreen extends StatefulWidget {
  DownloadsScreen({super.key}) {
    // Create controllers for each resource
    for (var r in ressources) {
      controllers.add(DownloadController(r));
    }
  }

  final List<Ressource> ressources = [
    Ressource(name: "image1.png", size: 120),
    Ressource(name: "image2.png", size: 500),
    Ressource(name: "image3.png", size: 12000),
  ];

  final List<DownloadController> controllers = [];

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentThemeColor.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            "Downloads",
            style: AppTextStyles.heading.copyWith(
              color: currentThemeColor.color,
            ),
          ),
          const SizedBox(height: 50),

          // Use ListView.builder for scrollable tiles
          Expanded(
            child: ListView.builder(
              itemCount: widget.controllers.length,
              itemBuilder: (context, index) {
                final controller = widget.controllers[index];

                return DownloadTile(
                  controller: controller,
                  onPressed: widget.controllers[index].startDownload,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
