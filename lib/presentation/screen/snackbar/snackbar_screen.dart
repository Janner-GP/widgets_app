import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snack = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Cerrar', onPressed: () {
        const closed = SnackBar(
          content: Text('Snackbar cerrado'),
          duration: Duration(milliseconds: 600),
        );
        ScaffoldMessenger.of(context).showSnackBar(closed);
      } ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void openDialalog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Dialogo de alerta'),
        content: const Text('Este es un dialogo de alerta'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cerrar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: const [
                    Text('Estas son las licencias que se utilizan en este proyecto de flutter')
                  ]
                );
              },
              child: const Text('Licencias Usadas')
            ),
            FilledButton.tonal(
              onPressed: (){
                openDialalog(context);
              },
              child: const Text('Mostrar dialogo')
            )
          ],
        ),
      ),
    );
  }
}
