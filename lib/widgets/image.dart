import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';
import 'package:flutter_svg/flutter_svg.dart';

main() {
  buildInDefaultContainer(
    Column(
      children: [
        Image.network(
          'https://blackbird.echtdorsten.de/uploads/2/images/posts/433/nettrek-firmengebaeude.jpeg',
        ),
        VerticalDivider(),
        SvgPicture.asset('assets/images/nettrek-logo.svg')
      ],
    ),
  );
}
