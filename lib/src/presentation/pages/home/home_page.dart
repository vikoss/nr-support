import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/home/home_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/home/widgets/home_bottom_bar.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/profile/profile_page.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/tickets/create/tickets_create_page.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/tickets/list/tickets_list_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    HomeViewModel vm = Provider.of<HomeViewModel>(context);

    final currentTab = [
      TicketsCreatePage(),
      TicketsListPage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: currentTab[vm.currentIndex],
      bottomNavigationBar: HomeBottomBar(context, vm),
    );
  }
}