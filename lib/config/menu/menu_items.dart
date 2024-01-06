import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String subtitle;
  final String route;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.route,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Botones', subtitle: 'Varios', route: '/buttons', icon: Icons.smart_button_rounded),
  MenuItem(title: 'Tarjetas', subtitle: 'Un contenedor estilizado', route: '/cards', icon: Icons.credit_card),
  MenuItem(title: 'Progreso', subtitle: 'Generales y controlados', route: '/progress', icon: Icons.credit_card),
  MenuItem(title: 'Snackbars y Dialogos', subtitle: 'Indicadores en pantalla', route: '/snackbars', icon: Icons.info_outline_rounded),
];