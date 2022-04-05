import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/modules/block_model.dart';
import 'package:hotel_management/services/admin_services.dart';

class BlockForm extends StatefulWidget {
  const BlockForm({Key? key}) : super(key: key);

  @override
  _BlockFormState createState() => _BlockFormState();
}

class _BlockFormState extends State<BlockForm> {
  final AdminService _adminService = AdminService();

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _countController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("New Block"),
      ),
      body: Center(
        child: Container(
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: "Block Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _countController,
                  decoration:
                      const InputDecoration(hintText: "total apartments"),
                ),
                ElevatedButton(
                    onPressed: () => addBlock(_nameController.text.trim(),
                        int.parse(_countController.text)),
                    child: const Text("Add Block"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  addBlock(String name, int count) async {
    Block block =
        Block(bid: "", name: name, totalApartment: count, vacancy: count);
    await _adminService.createBlock(block);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Block Added successfull"),
      ),
    );
  }
}
