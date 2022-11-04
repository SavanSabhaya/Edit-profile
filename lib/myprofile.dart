import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_profile.dart';

class Myprofilepage extends StatefulWidget {
  const Myprofilepage({Key? key}) : super(key: key);

  @override
  State<Myprofilepage> createState() => _MyprofilepageState();
}

class _MyprofilepageState extends State<Myprofilepage> {
  late SharedPreferences sp;
  String? username;
  String? emailids;
  String? send;

  late String base64image;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    sp = await SharedPreferences.getInstance();
    setState(() {
      username = sp.getString('username')!;
      emailids = sp.getString('emailid')!;
      send = sp.getString('send');
    });
  }

  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 35, 60, 119)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 15, right: 50),
            child: Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 35, 60, 119)),
            ),
          ),
        ),
        toolbarHeight: 100,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 181, 183, 184),
            Color.fromARGB(29, 238, 234, 234),
          ],
        ))),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Seller ID:',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 181, 183, 184),
                          fontWeight: FontWeight.w800,
                          fontSize: 15)),
                  Text(
                    '  246 890',
                    style: TextStyle(
                        color: Color.fromARGB(255, 35, 60, 119),
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  )
                ],
              )),
          ClipOval(
            child: send != null
                ? Image.file(
                    File(send!),
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'image/profile_icon.jpg',
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$username',
                style: const TextStyle(
                    color: Color.fromARGB(255, 35, 60, 119),
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$emailids',
                style: const TextStyle(
                    color: Color.fromARGB(255, 181, 183, 184),
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 90),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 35, 60, 119)),
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Editprofile(),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 17),
                        ))),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
