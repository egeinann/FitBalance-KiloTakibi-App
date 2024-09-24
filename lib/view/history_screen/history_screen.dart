import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/widgets/delete_show_dialog.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/widgets/snackbar.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/view/history_screen/fade_no_record.dart';
import 'package:kilo_takibi_uyg/view/history_screen/recordScreen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.find();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: context.paddingMedium,
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Obx(
                () => _controller.records.isEmpty
                    ? const FadeNoRecord() // Animasyonlu boş ekran widget'ı
                    : buildRecords(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.records.listen((records) {
      if (records.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    });
  }

  // *** NEW RECORD SCROLL BOTTOM ***
  void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // *** BUILD RECORDS LIST ***
  Column buildRecords(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: AnimatedList(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              key: _controller.listKey,
              initialItemCount: _controller.records.length,
              itemBuilder: (context, index, animation) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: InkWell(
                    onTap: () => Get.to(
                        RecordScreen(rec: _controller.records[index]),
                        transition: Transition.rightToLeftWithFade),
                    child: _controller.buildItem(
                        _controller.records[index], animation),
                  ),
                );
              },
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: Get.size.width * 0.8,
              child: const Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CustomFloatingActionButton(
                  widget: const Icon(Icons.delete),
                  onPressed: () {
                    deleteAllShowDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // *** DELETE SHOW DIALOG ***
  Future<dynamic> deleteAllShowDialog(BuildContext context) {
    return DialogService.deleteShowDialog(
      title: "Delete all records !",
      content: "Are you sure all records will be deleted ?",
      onCancel: () {},
      onConfirm: () {
        Future.delayed(
          const Duration(milliseconds: 300), // Kısa bir gecikme ekleyin
          () {
            _controller.deleteAllRecords(_controller.listKey);
            SnackbarHelper.showSnackbar(
              title: "You deleted all records",
              message: "There are no more records",
              backgroundColor: Colors.red,
              duration: const Duration(milliseconds: 1500),
              icon: const Icon(Icons.delete),
            );
          },
        );
      },
    );
  }
}
