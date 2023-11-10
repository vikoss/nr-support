import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/color_palette.dart';
import 'package:nr_soporte_mobile/src/presentation/widgets/default_button.dart';
import 'package:nr_soporte_mobile/src/presentation/widgets/default_textfield.dart';

class TicketsCreatePage extends StatelessWidget {
  const TicketsCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_GREY,
      body: Column(
        children: [
          /* Container(
            margin: EdgeInsets.all(30),
            child: Text(
              'Crear ticket',
            ),
          ), */
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Asunto',
              onChanged: (value) {
                //vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Descripcion',
              onChanged: (value) {
                //vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'NIC',
              onChanged: (value) {
                //vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Tipo de equipo',
              onChanged: (value) {
                //vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Numero de serie',
              onChanged: (value) {
                //vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Marca',
              onChanged: (value) {
                //vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Modelo',
              onChanged: (value) {
                //vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 40),
            child: DefaultButton(
              label: 'Crear',
              onPressed: () {
                //vm.register();
              },
            ),
          ),
        ],
      ),
    );
  }
}