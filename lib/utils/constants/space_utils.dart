import 'package:flutter/material.dart';
import 'package:flutter_project_template/utils/constants/size_constants.dart';

class VerticalSpace extends StatelessWidget {
  final double space;
  const VerticalSpace({super.key, this.space = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space.h(context),
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double space;
  const HorizontalSpace({super.key, this.space = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space.h(context),
    );
  }
}
