import 'package:flutter/material.dart';
import 'package:hotel_management/modules/block_model.dart';
import 'package:hotel_management/screens/block-apartment-screeen.dart';
import 'package:hotel_management/screens/blockform_screen.dart';
import 'package:hotel_management/services/admin_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AdminService _adminService = AdminService();
  // Stream<List<Block>>? blockStream;

  // @override
  // void initState() {
  //   Stream<List<Block>>? blockStream = _adminService.getBlocks();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Management"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const BlockForm()));
        },
        label: const Text("New Block"),
      ),
      body: StreamBuilder(
          stream: _adminService.getBlocks(),
          builder: (context, AsyncSnapshot<List<Block>> block) {
            if (!block.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (block.data!.isEmpty) {
              return const Center(
                  child: Text(
                "Create a new block",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ));
            }
            return ListView.builder(
                itemCount: block.data!.length,
                itemBuilder: (context, index) {
                  return blockList(block.data![index]);
                });
          }),
    );
  }

  Widget blockList(Block block) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BlockApartment(
                      block: block,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        color: Colors.grey[100],
        child: ListTile(
          title: Text(block.name!),
          trailing: Text("${block.vacancy!}/${block.totalApartment!}"),
        ),
      ),
    );
  }
}
