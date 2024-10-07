import 'package:flutter/material.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class DataManagementScreen extends StatelessWidget {
  const DataManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Data Management',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                heroTag: "datamanagement1",
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                splashColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 10,
                onPressed: () async {
                  // await backupData();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text("Data backed up successfully!")),
                  // );
                },
                label: const Text(
                  "Backup Data",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "outfit",
                      color: Colors.white),
                ), // Metin
                icon: const Icon(Icons.cloud, color: Colors.white), // İkon
              ),
              const SizedBox(height: 15),
              FloatingActionButton.extended(
                heroTag: "datamanagement2",
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                splashColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 10,
                onPressed: () async {
                  // await restoreData();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text("Data restored successfully!")),
                  // );
                },
                label: const Text(
                  "Restore Data",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "outfit",
                      color: Colors.white),
                ), // Metin
                icon: const Icon(Icons.restore, color: Colors.white), // İkon
              ),
              const SizedBox(height: 15),
              FloatingActionButton.extended(
                heroTag: "datamanagement3",
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                splashColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 10,
                onPressed: () {
                  // _showWipeDataDialog(context);
                },
                label: const Text(
                  "Wipe Data",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "outfit",
                      color: Colors.white),
                ), // Metin
                icon: const Icon(Icons.delete, color: Colors.white), // İkon
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ÖRNEK VERİTABANI İŞLMELERİ

  // Future<void> backupData() async {
  //   // Verilerinizi alın (örneğin SQLite'den)
  //   List<Map<String, dynamic>> records = await getRecordsFromDatabase();
  //   String jsonData = jsonEncode(records);

  //   // Dosya yolunu al
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   File file = File('${directory.path}/backup.json');

  //   // Dosyaya yaz
  //   await file.writeAsString(jsonData);
  // }

  // Future<void> restoreData() async {
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   File file = File('${directory.path}/backup.json');

  //   String jsonData = await file.readAsString();
  //   List<dynamic> records = jsonDecode(jsonData);

  //   for (var record in records) {
  //     await insertRecordIntoDatabase(record);
  //   }
  // }

  // Future<void> wipeData() async {
  //   await deleteAllRecordsFromDatabase();
  // }

  // void _showWipeDataDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Confirm Delete"),
  //         content: Text("Are you sure you want to delete all your data?"),
  //         actions: [
  //           TextButton(
  //             child: Text("Cancel"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: Text("Delete"),
  //             onPressed: () async {
  //               await wipeData();
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(content: Text("All data wiped!")),
  //               );
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // // Veritabanı işlemleri (örnek)
  // Future<Database> initDatabase() async {
  //   return await openDatabase(
  //     join(await getDatabasesPath(), 'fitbalance.db'),
  //     onCreate: (db, version) {
  //       return db.execute(
  //         'CREATE TABLE records(id INTEGER PRIMARY KEY, weight REAL, date TEXT, note TEXT)',
  //       );
  //     },
  //     version: 1,
  //   );
  // }

  // Future<void> insertRecordIntoDatabase(Map<String, dynamic> record) async {
  //   final Database db = await initDatabase();
  //   await db.insert('records', record);
  // }

  // Future<List<Map<String, dynamic>>> getRecordsFromDatabase() async {
  //   final Database db = await initDatabase();
  //   return await db.query('records');
  // }

  // Future<void> deleteAllRecordsFromDatabase() async {
  //   final Database db = await initDatabase();
  //   await db.delete('records');
  // }
}