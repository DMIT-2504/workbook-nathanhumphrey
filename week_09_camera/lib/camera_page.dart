import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:week_09_camera/photos_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({required this.description, super.key});

  final CameraDescription description;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  late XFile? imageFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.description, ResolutionPreset.max);
    controller
        .initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        })
        .catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                // Handle access errors here.
                break;
              default:
                // Handle other errors here.
                break;
            }
          }
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PhotosPage()),
              );
            },
            icon: const Icon(Icons.photo),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          takePicture().then((XFile? file) {
            if (mounted) {
              setState(() {
                imageFile = file;
              });
              if (file != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Picture saved to ${file.path}')),
                );
              }
            }
          });
        },
        child: const Icon(Icons.camera),
      ),
      body: Column(children: [Expanded(child: CameraPreview(controller))]),
    );
  }

  Future<XFile?> takePicture() async {
    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await controller.takePicture();
      return file;
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }
}
