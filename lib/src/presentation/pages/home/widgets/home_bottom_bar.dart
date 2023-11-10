import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/home/home_view_model.dart';

class HomeBottomBar extends StatelessWidget {
  HomeViewModel vm;
  BuildContext context;

  HomeBottomBar(this.context, this.vm);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: vm.currentIndex,
      onTap: (index) {
        vm.currentIndex = index;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Crear ticket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Tickets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        )
      ]
    );
  }
}