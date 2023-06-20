import 'package:auto_size_text/auto_size_text.dart';
import 'package:az_solar/Const/Color.dart';
import 'package:flutter/material.dart';

class TextInpuAll extends StatefulWidget {
  // TextEditingController? controller;
  String? label;
  bool? isPassword = false;
  TextInputType? type;
  IconData? prefixicon;
  IconData? suffixicon;
  TextInpuAll({
    // this.controller,
    this.isPassword,
    this.label,
    this.prefixicon,
    this.suffixicon,
    this.type,
  });

  @override
  State<TextInpuAll> createState() => _TextInpuAllState();
}

class _TextInpuAllState extends State<TextInpuAll> {
  bool security = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xff3abcb0),
        colorScheme: ColorScheme.light(primary: Color(0xff3abcb0)),
      ),
      child: TextFormField(
        // controller: widget.controller,
        cursorColor: Colors.black, // تغيير لون مؤشر الكتابة إلى اللون الأسود
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required field";
          } else if (widget.label == "Email address") {
            if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return "Please enter a valid email";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: widget.isPassword!
              ? security
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          security = !security;
                        });
                      },
                      child: Icon(
                        Icons.visibility_off,
                        color: security
                            ? Kprimareytextcolor
                            : Kthurdeytextcolor, // تغيير لون الأيقونة عند الضغط عليها
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          security = !security;
                        });
                      },
                      child: Icon(
                        Icons.visibility,
                        color: security
                            ? Kprimareytextcolor
                            : Kthurdeytextcolor, // تغيير لون الأيقونة عند الضغط عليها
                      ),
                    )
              : null,
          labelStyle: TextStyle(fontSize: 14),
          label: AutoSizeText(
            widget.label!,
            minFontSize: 14,
            maxFontSize: 18,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Kthurdeytextcolor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Kprimareytextcolor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Kprimareytextcolor),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        obscureText: widget.isPassword! ? security : false,
      ),
    );
  }
}
