import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/myprofile.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => EditprofileState();
}

class EditprofileState extends State<Editprofile> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  TextEditingController usernames = TextEditingController();
  TextEditingController emailids = TextEditingController();
  late SharedPreferences sp;
  String? userdata;
  String? emaildata;

  void getdata() async {
    sp = await SharedPreferences.getInstance();
  }

  File? selectedImage;
  var sss;
  // String base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    sss = image;
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  // void setdata() async {
  //   sp = await SharedPreferences.getInstance();
  //   setState(() {
  //     userdata = sp.getString('username');
  //     emaildata = sp.getString('emailid');
  //   });
  // }

  final _formforkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 35, 60, 119)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 15, right: 50),
            child: Text(
              'Edit Profile',
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
            Color.fromARGB(29, 238, 234, 234)
          ],
        ))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formforkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: selectedImage != null
                          ? Image.file(
                              selectedImage!,
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: const Color.fromARGB(255, 233, 231, 231)),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: const Text("Image Import From"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              chooseImage('camera');
                                              Navigator.pop(context);
                                            },
                                            child: const Text("camera")),
                                        TextButton(
                                            onPressed: () {
                                              chooseImage('gallery');
                                              Navigator.pop(context);
                                            },
                                            child: const Text("gallery"))
                                      ]);
                                });
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator:
                        RequiredValidator(errorText: 'Please enter name'),
                    controller: usernames,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 225, 230, 230))),
                        label: Text('Full Name'),
                        hintText: 'Enter Name'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'email is required'),
                      EmailValidator(errorText: 'enter valid email ID'),
                    ]),
                    controller: emailids,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 225, 230, 230))),
                      border: OutlineInputBorder(),
                      label: Text('Email Id'),
                      hintText: "Enter Email",
                    ),
                  ),
                ),
                const SizedBox(height: 99),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(right: 40, left: 40),
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 35, 60, 119)),
                              onPressed: () {
                                setState(() {
                                  if (_formforkey.currentState!.validate()) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Myprofilepage();
                                    }));
                                  }
                                });
                                String send = sss.path.toString();
                                String username = usernames.text;
                                String emailid = emailids.text;
                                if (username != '' && emailid != '') {
                                  sp.setString('username', username);
                                  sp.setString('emailid', emailid);
                                  sp.setString('send', send);
                                }
                              },
                              child: const Text(
                                'Save Change',
                                style: TextStyle(fontSize: 17),
                              ))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
