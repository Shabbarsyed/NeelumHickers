import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/screen/home_screen.dart';

import '../New/model.dart';
import '../loginnew.dart';

class Tourist extends StatefulWidget {
  String id;
  Tourist({required this.id});
  @override
  _TouristState createState() => _TouristState(id: id);
}

class _TouristState extends State<Tourist> {
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _TouristState({required this.id});
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  @override
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('posts').snapshots();
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return HomeScreen(id:id,email: emaill);
          // return Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: ListView.builder(
          //     itemCount: snapshot.data!.docs.length,
          //     itemBuilder: (_, index) {
          //       return GestureDetector(
          //         onTap: () {},
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               height: 4,
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(
          //                 left: 3,
          //                 right: 3,
          //               ),
          //               child: ListTile(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(10),
          //                   side: BorderSide(
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 title: Text(
          //                   snapshot.data!.docChanges[index].doc['title'],
          //                   style: TextStyle(
          //                     fontSize: 20,
          //                   ),
          //                 ),
          //                 contentPadding: EdgeInsets.symmetric(
          //                   vertical: 12,
          //                   horizontal: 16,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // );
        },
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