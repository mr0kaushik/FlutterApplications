import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MsgDialog {
  static Future<bool> showMsgDialog(
      {@required BuildContext context,
      String title,
      String msg,
      String positiveText = "Ok",
      String negativeText = "Cancel",
      VoidCallback onPositivePressed,
      VoidCallback onNegativePressed,
      bool dismissible = true}) {
    Widget positiveButton = FlatButton(
      child: Text(positiveText ?? ''),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: () {
        Navigator.of(context).pop(true);
        if (onPositivePressed != null) {
          onPositivePressed();
        }
      },
    );
    Widget negativeButton = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        negativeText ?? '',
        style: TextStyle(color: Colors.grey),
      ),
      color: Colors.black12,
      onPressed: () {
        Navigator.of(context).pop(false);
        if (onNegativePressed != null) {
          onNegativePressed();
        }
      },
    );

    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: Text(
          title ?? '',
          style: GoogleFonts.lato(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        content: Text(
          msg ?? '',
          style: GoogleFonts.nunitoSans(fontSize: 14.0),
        ),
        actions: <Widget>[
          if (negativeText.isNotEmpty) negativeButton,
          positiveButton
        ],
      ),
    );
  }
}
