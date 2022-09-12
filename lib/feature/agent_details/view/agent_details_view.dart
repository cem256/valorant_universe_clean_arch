import 'package:flutter/material.dart';

import '../../agents/domain/entities/agent/agent_entity.dart';

class AgentDetailsView extends StatelessWidget {
  const AgentDetailsView({super.key, required this.agent});

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
