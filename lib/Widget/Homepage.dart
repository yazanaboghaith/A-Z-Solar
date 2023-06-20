import 'package:az_solar/Auth/Login.dart';
import 'package:az_solar/Const/Color.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // تعيين لون شفاف للخلفية
        elevation: 0, // تعيين قيمة صفر للرفعة (الظل)
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kprimareyWidgetcolor,
          ),
        ),
        title: Center(
          child: Text(
            "Homepage",
            style: TextStyle(
              color: Kprimareytextcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 4, top: 4),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('تسجيل الخروج'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ),
              ],
              icon: Icon(
                Icons.more_vert,
                color: Kprimareyiconcolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
