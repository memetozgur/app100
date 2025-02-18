import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard2_widget.dart' show Dashboard2Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Dashboard2Model extends FlutterFlowModel<Dashboard2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
