import 'package:flutter/material.dart';
import 'package:hotel_management/modules/apartment_model.dart';
import 'package:hotel_management/services/admin_services.dart';

class ApartmentForm extends StatefulWidget {
  final String bid;
  const ApartmentForm({Key? key, required this.bid}) : super(key: key);

  @override
  _ApartmentFormState createState() => _ApartmentFormState(bid);
}

class _ApartmentFormState extends State<ApartmentForm> {
  final String bid;
  _ApartmentFormState(this.bid);

  final AdminService _adminService = AdminService();

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("New Apartment"),
      ),
      body: Center(
        child: Container(
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: "Apartment Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => addBlock(_nameController.text.trim(),bid),
                    child: const Text("Add Block"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  addBlock(String name,String bid) async {
    Apartment apartment=Apartment(aid: "", name: name, isvaccant: true, rid: "", bid: bid);
    await _adminService.createApartment(apartment);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Apartment Added successfull"),
      ),
    );
  }
}
