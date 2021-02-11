import 'package:flutter/material.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/roteiros_offline.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/roteiros_online.dart';

class RoteirosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Roteiros'),
          bottom: const TabBar(
            tabs: [
              const Tab(text: 'Offline', icon: Icon(Icons.signal_wifi_off_outlined)),
              const Tab(text: 'Online', icon: Icon(Icons.signal_wifi_4_bar)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            const RoteirosOffline(),
            const RoteirosOnline(),
          ],
        ),
      ),
    );
  }
}
