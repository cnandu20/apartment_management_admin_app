import 'package:flutter/material.dart';
import 'package:hotel_management/modules/resident_model.dart';

class ResidentDetailsScreen extends StatefulWidget {
  final String bid;
  const ResidentDetailsScreen({Key? key, required this.bid}) : super(key: key);

  @override
  _ResidentDetailsScreenState createState() => _ResidentDetailsScreenState(bid);
}

class _ResidentDetailsScreenState extends State<ResidentDetailsScreen> {
  final String bid;
  _ResidentDetailsScreenState(this.bid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      // body: FutureBuilder(
      //   future: ,
      //   builder: (BuildContext context,snapshot) {
      //     return Center(
      //       child: Column(
      //         children: [
      //           Text("name :"),
      //           const SizedBox(height: 20,),
      //           Text("mobile :"),
      //         ],
      //       ),
      //     );
      //   }
      // ),
      body: Container(),
    );
  }
}
