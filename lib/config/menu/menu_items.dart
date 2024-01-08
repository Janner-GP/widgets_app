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
  MenuItem(title: 'Contador', subtitle: 'Contador donde se puede definir el tipo de tema de la app', route: '/counter', icon: Icons.add_circle_outline_rounded),
  MenuItem(title: 'Cambiar tema de la App', subtitle: 'Cambiar el tema de la aplcacion', route: '/theme-change', icon: Icons.change_circle_rounded),
  MenuItem(title: 'Botones', subtitle: 'Varios', route: '/buttons', icon: Icons.smart_button_rounded),
  MenuItem(title: 'Tarjetas', subtitle: 'Un contenedor estilizado', route: '/cards', icon: Icons.credit_card),
  MenuItem(title: 'Progreso', subtitle: 'Generales y controlados', route: '/progress', icon: Icons.linear_scale_rounded),
  MenuItem(title: 'Snackbars y Dialogos', subtitle: 'Indicadores en pantalla', route: '/snackbars', icon: Icons.info_outline_rounded),
  MenuItem(title: 'Contendor animado', subtitle: 'Contenedor animado con varios colores y formas', route: '/animated', icon: Icons.animation_rounded),
  MenuItem(title: 'UI Controls', subtitle: 'Elementos utiles para las interfaces de usuario', route: '/ui-controls', icon: Icons.design_services_outlined),
  MenuItem(title: 'App Tutorials', subtitle: 'Paso a paso para una aplicacion', route: '/app-tutorial', icon: Icons.class_outlined),
  MenuItem(title: 'Infinte Scroll', subtitle: 'Como hacer un infinite scroll con refresh', route: '/infinite-scroll', icon: Icons.list_alt_outlined),
];