import 'package:flutter/material.dart';

import '../../../../core/widgets/appbar/valorant_app_bar.dart';

class WeaponsView extends StatelessWidget {
  const WeaponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ValorantAppBar(
        title: "Weapons",
      ),
    );
  }
}
