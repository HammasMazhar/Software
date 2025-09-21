import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox('availableBox');
    await Hive.openBox('viewsalesBox');
    await Hive.openBox('currentsalesBox');
    await Hive.openBox('purchaseBox');
    await Hive.openBox('distributorBox');
    await Hive.openBox('expiredBox');
    await Hive.openBox('requiredBox');
    await Hive.openBox('nonpaidBox');
    await Hive.openBox('scheduleBox');
    await Hive.openBox('invoiceBox');
    await Hive.openBox('discountsBox');
    await Hive.openBox('medicineInvoiceBox');
    await Hive.openBox('invoiceBox');
    await Hive.openBox('reportBox');
    await Hive.openBox('tasksToDoBox');
    await Hive.openBox('passwordBox');
    await Hive.openBox('usersBox');
    await Hive.openBox('sessionBox');
    await Hive.openBox('printedBox');
    await Hive.openBox('currentPurchaseBox');
    await Hive.openBox('addPurchaseBox');
    await Hive.openBox('nonretailstockBox');

    var passwordBox = Hive.box('passwordBox');
    if (!passwordBox.containsKey('password')) {
      passwordBox.put('password', '122003');
    }
  }
}
