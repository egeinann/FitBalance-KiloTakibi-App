import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/widgets/elevated_button.dart';
import 'package:kilo_takibi_uyg/widgets/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.find();
  final ScrollController _scrollController = ScrollController();

  // Yeni bir record eklendiğinde listenin en altına kaydırma
  @override
  void initState() {
    super.initState();
    // Yeni bir record eklendiğinde listenin en altına kaydırma
    _controller.records.listen((records) {
      if (records.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    });
  }

  // aşağı kaydırma fonksiyonu
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "History",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Obx(
                () => _controller.records.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: Get.size.height * 0.05),
                            const Expanded(
                              flex: 2,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/homeScreen/null_records.png"),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            SizedBox(height: Get.size.height * 0.05),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "We couldn't find the records !",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  appButton(
                                    _controller.goToAddScreen,
                                    const Text(
                                      "Go to add record",
                                      style: TextStyle(fontFamily: "outfit"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 5),
                              child: SizedBox(
                                child: ListView.builder(
                                  controller:
                                      _scrollController, // ScrollController ekleyin
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _controller.records.length,
                                  itemBuilder: (context, index) {
                                    final record = _controller.records[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      child: RecordListTile(rec: record),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.size.width * 0.9,
                                child: const Divider(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Text(
                                      "${_controller.records.length} record",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                  appButton(
                                    () {
                                      deleteAllShowDialog(context);
                                    },
                                    const Text(
                                      "all delete",
                                      style: TextStyle(fontFamily: "outfit"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // *** ALL DELETE SHOW DIALOG ***
  Future<dynamic> deleteAllShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Delete all",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            "Are you sure you want to delete all records?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Delete",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                _controller.deleteAllRecords();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
