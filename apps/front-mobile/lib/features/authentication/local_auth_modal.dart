import 'package:flutter/material.dart';

class LocalAuthModal extends StatelessWidget {
  final void Function() action;

  const LocalAuthModal({Key? key, required this.action}) : super(key: key);

  static const Color primaryColor = Color(0xFF13B5A2);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.fingerprint_outlined,
            size: 100,
            color: primaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Activer authentification empreinte ?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
              'Vous pouvez vous connecter sans mots de passe la prochaine fois',
              textAlign: TextAlign.center),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              action();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                textStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            child: const Text("OK"),
          ),
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                "Non merci",
                style: TextStyle(color: Colors.black54),
              ))
        ],
      ),
    );
  }
}
