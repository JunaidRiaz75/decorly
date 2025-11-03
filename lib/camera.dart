import 'package:decorly/gallery.dart';
import 'package:decorly/room.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isTakingPicture = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      _controller = CameraController(firstCamera, ResolutionPreset.high);

      _initializeControllerFuture = _controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized || _isTakingPicture) {
      return;
    }

    setState(() {
      _isTakingPicture = true;
    });

    try {
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();

      // Navigate to image preview or process the image
      _navigateToImagePreview(image.path);
    } catch (e) {
      print('Error taking picture: $e');
    } finally {
      setState(() {
        _isTakingPicture = false;
      });
    }
  }

  void _navigateToImagePreview(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreen(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Top navigation bar
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.black.withOpacity(0.7),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(),
                Text(
                  'Take Photo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.flash_off, color: Colors.white70),
                  onPressed: () {}, // Add flash toggle functionality
                ),
              ],
            ),
          ),

          // Camera preview
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (_controller != null && _controller!.value.isInitialized) {
                    return CameraPreview(_controller!);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
              },
            ),
          ),

          // Bottom controls
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.black.withOpacity(0.7),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Switch camera button
                    FloatingActionButton(
                      heroTag: "switch_camera",
                      mini: true,
                      backgroundColor: Colors.white,
                      onPressed: _switchCamera,
                      child: Icon(Icons.cameraswitch, color: Colors.black),
                    ),

                    // Capture button
                    GestureDetector(
                      onTap: _isTakingPicture ? null : _takePicture,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          color: _isTakingPicture ? Colors.grey : Colors.white,
                        ),
                        child: _isTakingPicture
                            ? CircularProgressIndicator(color: Colors.black)
                            : Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 30,
                              ),
                      ),
                    ),

                    // Gallery button
                    // In your Step 1 screen, replace the Choose from Gallery button onPressed:
                    ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GallerySelectionScreen(),
                          ),
                        );
                        if (result != null) {
                          // Handle the selected image path (e.g., navigate to preview or process)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ImagePreviewScreen(imagePath: result),
                            ),
                          );
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFD2691E)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // square corners
                        ),
                        fixedSize: const Size(
                          35,
                          40,
                        ), // width, height (adjust as needed)
                      ),

                      child: const Text(
                        'Gallery',
                        style: TextStyle(color: Color(0xFFD2691E), fontSize: 8),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Cancel button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _switchCamera() async {
    final cameras = await availableCameras();
    if (cameras.length > 1) {
      final newController = CameraController(
        cameras[1 -
            cameras.indexWhere(
              (camera) =>
                  camera.lensDirection ==
                  _controller!.description.lensDirection,
            )],
        ResolutionPreset.high,
      );

      await _controller!.dispose();
      _controller = newController;

      await newController.initialize();
      setState(() {});
    }
  }
}

// Image Preview Screen after capture
class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;

  const ImagePreviewScreen({Key? key, required this.imagePath})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.white),
            onPressed: () {
              // Proceed with image processing
              Navigator.pop(context, imagePath);
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(File(imagePath), fit: BoxFit.contain),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.black.withOpacity(0.7),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Retake',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChooseRoomScreen(),
                          ),
                        );
                        //
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD2691E),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Use Photo',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
