import 'package:flutter/material.dart';

// É necessário implementar PreferredSizeWidget p/ ser renderizado no AppBar
// Para implementar essa classe, é necessário sobrescrever o método preferredSize
class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool venceu;
  final Function onReiniciar;

  ResultadoWidget({
    @required this.venceu,
    @required this.onReiniciar,
  });

  Color get _getColor {
    if (this.venceu == null) {
      return Colors.yellow;
    } else if (this.venceu) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData get _getIcon {
    if (this.venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (this.venceu) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                _getIcon,
                color: Colors.black,
                size: 35,
              ),
              onPressed: onReiniciar,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
