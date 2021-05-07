// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:kf_drawer/kf_drawer.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ywcaofbombay/screens/initiatives/piya.dart';

// import '../../widgets/initiative_card.dart';
import '../../models/initiative.dart';
import '../../widgets/blue_bubble_design.dart';

// ignore: must_be_immutable
class Initiatives extends KFDrawerContent {
  @override
  _InitiativesState createState() => _InitiativesState();
}

class _InitiativesState extends State<Initiatives> {
  final List<Initiative> _allInitiatives = Initiative.allInitiatives();
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              // circle design
              children: <Widget>[
                MainPageBlueBubbleDesign(),
                Positioned(
                  child: AppBar(
                    centerTitle: true,
                    title: Text(
                      "YWCA Of Bombay",
                      style: TextStyle(
                        fontFamily: 'LilyScriptOne',
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
                PreferredSize(
                  preferredSize: Size.fromHeight(100),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        // Distance from ywca
                        // or else it will overlap
                        SizedBox(height: _height * 0.1),
                        Text(
                          'Initiatives ',
                          style: TextStyle(
                            fontSize: 26,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: _height * 0.02),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            getAllInitiatives(context),
          ],
        ),
      ),
    );
  }

  // TODO: Initiatives on Firebase
  // TODO: add firebase code

  // Stream<QuerySnapshot> getInitiativesStreamSnapshots(
  //     BuildContext context) async* {
  //   yield* FirebaseFirestore.instance.collection('userData').doc(uid).collection('trips').orderBy('startDate').snapshots();
  // }

  // Widget getAllInitiatives(BuildContext context) {
  //   return Expanded(
  //     child: StreamBuilder(
  //       stream: getInitiativesStreamSnapshots(context),
  //       builder: (context, snapshot) {
  //         if (!snapshot.hasData) return const Text("Loading...");
  //         return ListView.builder(
  //           itemCount: _allInitiatives.length,
  //           // itemCount: snapshot.data.documents.length + 1,
  //           itemBuilder: (BuildContext context, int index) {
  //             return _buildInitiativeCard(context, index);
  //           },);},),);
  // }

  Widget getAllInitiatives(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        height: _height,
        width: double.infinity, // max width possible
        child: ListView.builder(
          itemCount: _allInitiatives.length,
          // itemCount: snapshot.data.documents.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return buildInitiativeCard(context, index);
          },
        ),
      ),
    );
  }
}
