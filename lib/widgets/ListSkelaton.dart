import 'package:az_solar/widgets/SkelatonCard.dart';
import 'package:flutter/material.dart';

class ListSkelaton extends StatelessWidget {
  const ListSkelaton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          SkelatonCard(width: width, height: height),
      itemCount: 15,
    );
  }
}
