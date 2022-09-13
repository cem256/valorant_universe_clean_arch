import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading/loading_widget.dart';

import '../../../../core/enums/page_status.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/appbar/valorant_app_bar.dart';
import '../../../../core/widgets/image/custom_cached_network_image.dart';
import '../../../../core/widgets/text/custom_error_text.dart';
import '../../../../core/widgets/text/valorant_text.dart';
import '../../data/data_sources/remote/weapons_remote_data_source.dart';
import '../../data/repositories/weapon_repository_imp.dart';
import '../../domain/entities/weapon/weapon_entity.dart';
import '../bloc/weapons_bloc.dart';

part '../widgets/weapons_grid_card.dart';
part '../widgets/weapons_grid_view_widget.dart';

class WeaponsView extends StatelessWidget {
  const WeaponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValorantAppBar(
        title: "Weapons",
      ),
      body: BlocProvider(
        create: (context) => WeaponsBloc(
          weaponRepository: WeaponRepositoryImp(
            weaponsRemoteDataSource: WeaponsRemoteDataSource(dio: NetworkManager.instance.dio),
          ),
        )..add(const WeaponsFetched()),
        child: const WeaponsViewBody(),
      ),
    );
  }
}

class WeaponsViewBody extends StatelessWidget {
  const WeaponsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeaponsBloc, WeaponsState>(
      builder: (context, state) {
        if (state.status == PageStatus.initial || state.status == PageStatus.loading) {
          return const Center(
            child: LoadingWidget(),
          );
        } else if (state.status == PageStatus.success) {
          return Column(
            children: [
              Expanded(
                child: _WeaponsGridView(weapons: state.weapons),
              ),
            ],
          );
        } else {
          return const CustomErrorText();
        }
      },
    );
  }
}
