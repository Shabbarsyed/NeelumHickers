import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Widgetsclasses/Bottomnavigationbar.dart';
import '../Widgetsclasses/PageScrollView.dart';
import '../loginnew.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 110, 182, 10),
        toolbarOpacity: 0,
        shadowColor: Colors.black12,
        leading: Builder(
          builder: (BuildContext context) {
            return SizedBox(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    // ElevatedButton(onPressed: () {}, child:
                    //
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                        MaterialLocalizations.of(context).openAppDrawerTooltip;
                        } ,
                      child:  Image(
                        image: AssetImage('assets/images/Drawericon.png'),
                        height: 21,
                        width: 24,
                      ),
                    )
                  ],
                ),
            );
          },
        ),

      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(47, 110, 182, 10)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 260),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blueGrey,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=11'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Hello! Mark",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Where would you like to go?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 145,
                      ),
                      Image(
                        image: AssetImage("assets/images/Notifyicon.png"),
                        width: 28,
                        height: 28,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      child: Mystatefullwidget(),
                  margin: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomNavigationClass(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              child: SizedBox(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=11'),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        )),
                        Text("yourname@gmail.com",
                            style: TextStyle(
                                fontSize: 12
                            )),
                      ],
                    ),


                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.location_on,color: Colors.white),
                    SizedBox(width: 10),
                    Text("Track",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),)
                  ],
                ),
              ),
              onTap: () {

                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.payment,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Payment",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.card_giftcard_outlined,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Reward",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.settings,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Setting",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.contact_phone,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Contact us",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                // margin: EdgeInsets.only(left: 150),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.book_outlined,color: Colors.black),
                    SizedBox(width: 10),
                    Text("About us",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                logout(context);
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.help,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Help",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                // margin: EdgeInsets.only(left: 150),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.logout,color: Colors.black),
                    SizedBox(width: 10),
                    Text("LOGOUT",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                logout(context);
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
