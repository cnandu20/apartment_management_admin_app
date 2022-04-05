import 'package:flutter/material.dart';
import 'package:hotel_management/modules/apartment_model.dart';
import 'package:hotel_management/modules/block_model.dart';
import 'package:hotel_management/screens/apartmentform-screen.dart';
import 'package:hotel_management/screens/resident-details-screen.dart';
import 'package:hotel_management/screens/residentForm-screen.dart';
import 'package:hotel_management/services/admin_services.dart';

class BlockApartment extends StatefulWidget {
  final Block? block;
  const BlockApartment({Key? key, required this.block}) : super(key: key);

  @override
  _BlockApartmentState createState() => _BlockApartmentState(block);
}

class _BlockApartmentState extends State<BlockApartment> {
  final Block? block;
  _BlockApartmentState(this.block);

  final AdminService _adminService = AdminService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(block!.name!),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ApartmentForm(
                        bid: block!.bid!,
                      )));
        },
        label: const Text("New Apartment"),
      ),
      body: StreamBuilder(
          stream: _adminService.apartmentStream(block!.bid!),
          builder: (context, AsyncSnapshot<List<Apartment>> apartment) {
            if (!apartment.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (apartment.data!.isEmpty) {
              return const Center(
                  child: Text(
                "Add apartments for this block",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ));
            }
            return ListView.builder(
                itemCount: apartment.data!.length,
                itemBuilder: (context, index) {
                  return blockList(apartment.data![index]);
                });
          }),
    );
  }

  Widget blockList(Apartment apartment) {
    print(apartment.isvaccant);
    return InkWell(
      onTap: () {
        if (apartment.isvaccant!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ResidentFormScreen(apartment: apartment)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ResidentDetailsScreen(
                        bid: apartment.rid!,
                      )));
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        color: Colors.grey[100],
        child: ListTile(
          title: Text(apartment.name!),
          trailing: apartment.isvaccant! ? Text("vacant") : Text("Aloted"),
        ),
      ),
    );
  }
}
