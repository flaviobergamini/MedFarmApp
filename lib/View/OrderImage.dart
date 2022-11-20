import 'package:flutter/material.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:photo_view/photo_view.dart';

class OrderImage extends StatefulWidget {
  const OrderImage({Key? key}) : super(key: key);

  @override
  State<OrderImage> createState() => _OrderImageState();
}

class _OrderImageState extends State<OrderImage> {
  var CoreOrder = AuthController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
          imageProvider: NetworkImage(CoreOrder.getOrderImage()),
        )
    );
  }
}
