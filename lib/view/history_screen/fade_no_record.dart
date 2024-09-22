import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:kilo_takibi_uyg/controller/controller.dart';

class FadeNoRecord extends StatefulWidget {
  const FadeNoRecord({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FadeNoRecordState createState() => _FadeNoRecordState();
}

class _FadeNoRecordState extends State<FadeNoRecord>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Controller controller = Get.find();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: noRecord(context),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Center noRecord(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("assets/images/homeScreen/null_records.png"),
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "No record found !",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                CustomFloatingActionButton(
                  widget: const FittedBox(child: Icon(Ionicons.chevron_back)),
                  onPressed: () {
                    controller.goToAddScreen();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
