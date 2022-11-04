import 'package:flutter/material.dart';

import 'myprofile.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1page(),
    );
  }
}

class Screen1page extends StatefulWidget {
  const Screen1page({super.key});

  @override
  State<Screen1page> createState() => _Screen1pageState();
}

class _Screen1pageState extends State<Screen1page> {
  int _selectedindex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF233C77)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF233C77)),
            ),
          ),
        ),
        toolbarHeight: 100,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFB5B7B8), Color.fromRGBO(238, 234, 234, 0.114)],
        ))),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF5F6F9),
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                  // border: BoxBorder(border),
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 86, 88, 88),
                  Color.fromARGB(29, 238, 234, 234)
                ],
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 60),
                child: Text(
                  'Drawer Demo',
                  style: TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 35, 60, 119)),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text(
                'Message',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 181, 183, 184)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text(
                ' Add member',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 181, 183, 184)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Setting',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 181, 183, 184)),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 45,
                child: TextButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Myprofilepage()));
                    }),
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F6F9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'My Profile',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 35, 60, 119)),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromARGB(255, 35, 60, 119),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              child: SizedBox(
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F6F9)),
                    onPressed: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Receipt settings',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 35, 60, 119)),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromARGB(255, 35, 60, 119),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: SizedBox(
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F6F9)),
                    onPressed: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Lottery Number',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 35, 60, 119)),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromARGB(255, 35, 60, 119),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: SizedBox(
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F6F9)),
                    onPressed: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Award Number',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 35, 60, 119)),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromARGB(255, 35, 60, 119),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: SizedBox(
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F6F9)),
                    onPressed: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Amount Statistical',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 35, 60, 119)),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromARGB(255, 35, 60, 119),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: SizedBox(
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F6F9)),
                    onPressed: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Language setting',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 35, 60, 119)),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromARGB(255, 35, 60, 119),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              child: SizedBox(
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 246, 239, 239)),
                    onPressed: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Log Out',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 233, 93, 93)),
                        ),
                        Icon(
                          Icons.exit_to_app,
                          color: Color.fromARGB(255, 233, 93, 93),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          // unselectedLabelStyle:
          // TextStyle(color: Color.fromARGB(255, 185, 76, 76)),
          unselectedIconTheme:
              IconThemeData(color: Color.fromARGB(255, 181, 183, 184)),
          selectedItemColor: Color.fromARGB(255, 35, 60, 119),
          selectedIconTheme:
              IconThemeData(color: Color.fromARGB(255, 35, 60, 119)),
          selectedLabelStyle:
              TextStyle(color: Color.fromARGB(255, 35, 60, 119)),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.description_outlined), label: 'Ticket'),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_sharp), label: 'Scanner'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Order'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting'),
          ],
          currentIndex: _selectedindex,
          onTap: _onItemTapped,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFF5F6F9),

          elevation: 5,
        ),
      ),
    );
  }
}
