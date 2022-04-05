import 'package:flutter/material.dart';
import 'package:hotel_management/modules/apartment_model.dart';
import 'package:hotel_management/modules/resident_model.dart';
import 'package:hotel_management/services/admin_services.dart';

class ResidentFormScreen extends StatefulWidget {
  final Apartment apartment;
  const ResidentFormScreen({Key? key, required this.apartment})
      : super(key: key);

  @override
  _ResidentFormScreenState createState() => _ResidentFormScreenState(apartment);
}

class _ResidentFormScreenState extends State<ResidentFormScreen> {
  final Apartment apartment;
  _ResidentFormScreenState(this.apartment);
  final AdminService _adminService = AdminService();

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("New Resident"),
      ),
      body: Center(
        child: Container(
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: "Resident Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(hintText: "mobile number"),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: "password"),
                ),
                ElevatedButton(
                    onPressed: () => addResident(
                        _nameController.text.trim(),
                        _phoneController.text.trim(),
                        _passwordController.text.trim()),
                    child: const Text("Add Resident"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  addResident(String name, String mobile, String password) async {
    Resident resident = Resident(
        aid: apartment.aid,
        name: name,
        mobile: mobile,
        rid: "",
        password: password,
        bid: apartment.bid);
    await _adminService.createresident(resident);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Resident Added successfull"),
      ),
    );
  }
}
