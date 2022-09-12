import 'package:flutter/material.dart';

import '../../weapons/domain/entities/weapon/weapon_entity.dart';

class WeaponDetailsView extends StatelessWidget {
  const WeaponDetailsView({super.key, required this.weapon});

  final WeaponEntity weapon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
