import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'dart:async';

class TakenPictureScreen extends StatefulWidget {
  final CameraDescription camera;
  
  const TakenPictureScreen ({Key? key, required this.camera}) :  super(key: key);

  @override
  State<TakenPictureScreen> createState() => _TakenPictureScreenState();

}

class _TakenPictureScreenState extends State<TakenPictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

@override
void initState() {
  super.initState();
  _controller = CameraController(widget.camera, ResolutionPreset.medium);

  _initializeControllerFuture = _controller.initialize();
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}


