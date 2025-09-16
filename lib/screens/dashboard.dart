import 'package:flutter/material.dart';
import 'package:software/authentication/logout.dart';
import 'package:software/distributor/schedule.dart';
import 'package:software/reuseable_widget/password.dart';
import 'package:software/screens/medicine_invoices.dart';
import 'package:software/purchaserecord/currentpurchase.dart';
import 'package:software/screens/reports.dart';
import 'package:software/salerecord/currentsale.dart';
import 'package:software/salerecord/viewsale.dart';
import 'package:software/screens/bussines_details.dart';
import 'package:software/distributor/alldistributor.dart';
import 'package:software/screens/invoice.dart';
import 'package:software/screens/discount.dart';
import 'package:software/stocks/availablestocks.dart';
import 'package:software/stocks/expiredstocks.dart';
import 'package:software/purchaserecord/addpurchase.dart';
import 'package:software/stocks/requiredstocks.dart';
import 'package:software/screens/tasks_to_do.dart';
import 'package:software/stocks/nonpaidstock.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
//  static const String routeName = '/dashboard';
  TextEditingController searchController = TextEditingController();
  bool _isHoveredViewSale = false;
  bool _isHoveredCurrentSale = false;
  bool _isHoveredViewPurchase = false;
  bool _isHoveredAddPurchase = false;
  bool _isHoveredAvailableStock = false;
  bool _isHoveredExpiredStock = false;
  bool _isHoveredRequiredStocks = false;
  bool __isHoveredNonPaidStocks = false;
  bool _isHoveredAllDistributor = false;
  bool _isHoveredinvoiced = false;
  bool _isHovereddetailed = false;
  bool __isHoveredschedule = false;
  bool __isHoveredReport = false;
  bool __isHoveredTasks = false;
  bool _isHoveredMedicineInvoiced = false;
  bool _isDiscount = false;
  bool _isHoveredlogout = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008000),
      body: Row(
        children: [
          Container(
            width: 220,
            color: Colors.white,
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Icon(
                        Icons.local_pharmacy,
                        size: 50,
                        color: Color(0xFF008000),
                      ),
                      Text(
                        "Al-Shifa ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Medical Store",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                //color: _isHovered ? Color(0xFF008000) : Colors.white,
                ExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Text("Sale Record"),
                  leading: Icon(Icons.point_of_sale),
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredViewSale = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredViewSale = false;
                      }),
                      child: Container(
                        color: _isHoveredViewSale
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          // tileColor:
                          //     _isHovered ? Color(0xFF008000) : Colors.white,
                          title: const Text("View Sales"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Viewsale(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredCurrentSale = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredCurrentSale = false;
                      }),
                      child: Container(
                        color: _isHoveredCurrentSale
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                            title: const Text("Current Sale"),
                            onTap: () async {
                              bool canOpen = await checkPassword(context);

                              if (canOpen && context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Currentsale()),
                                );
                              }
                            }),
                      ),
                    ),
                  ],
                ),

                ExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Text("Purchase Record"),
                  leading: Icon(Icons.shopping_bag),
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredViewPurchase = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredViewPurchase = false;
                      }),
                      child: Container(
                        color: _isHoveredViewPurchase
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          title: const Text("Add Purchases"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PurchaseScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredAddPurchase = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredAddPurchase = false;
                      }),
                      child: Container(
                        color: _isHoveredAddPurchase
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                            title: const Text("Current Purchase"),
                            onTap: () async {
                              bool canOpen = await checkPassword(context);
                              if (canOpen && context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Currentpurchase()),
                                );
                              }
                            }),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Text("Stocks"),
                  leading: Icon(Icons.inventory_rounded),
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredAvailableStock = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredAvailableStock = false;
                      }),
                      child: Container(
                        color: _isHoveredAvailableStock
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          title: const Text("Available Stock"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Availablestocks(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredExpiredStock = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredExpiredStock = false;
                      }),
                      child: Container(
                        color: _isHoveredExpiredStock
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          title: const Text("Expired Stock"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Expiredstocks(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredRequiredStocks = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredRequiredStocks = false;
                      }),
                      child: Container(
                        color: _isHoveredRequiredStocks
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          title: const Text("Required Stocks"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Requiredstocks(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        __isHoveredNonPaidStocks = true;
                      }),
                      onExit: (_) => setState(() {
                        __isHoveredNonPaidStocks = false;
                      }),
                      child: Container(
                        color: __isHoveredNonPaidStocks
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          title: const Text("Non Paid Stocks"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Nonpaidstock(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Text("Distributor"),
                  leading: Icon(Icons.local_shipping),
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredAllDistributor = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredAllDistributor = false;
                      }),
                      child: Container(
                        color: _isHoveredAllDistributor
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          title: const Text("All Distributors"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Alldistributor(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        __isHoveredschedule = true;
                      }),
                      onExit: (_) => setState(() {
                        __isHoveredschedule = false;
                      }),
                      child: Container(
                        color: __isHoveredschedule
                            ? Color(0xFF008000)
                            : Colors.white,
                        child: ListTile(
                          // tileColor:
                          title: const Text("Booking Schedule"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SchedulePage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                MouseRegion(
                  onEnter: (_) => setState(() {
                    _isHoveredinvoiced = true;
                  }),
                  onExit: (_) => setState(() {
                    _isHoveredinvoiced = false;
                  }),
                  child: Container(
                    color:
                        _isHoveredinvoiced ? Color(0xFF008000) : Colors.white,
                    child: ListTile(
                      title: const Text("Invoice"),
                      leading: Icon(Icons.receipt_long),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvoiceScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                MouseRegion(
                  onEnter: (_) => setState(() {
                    __isHoveredReport = true;
                  }),
                  onExit: (_) => setState(() {
                    __isHoveredReport = false;
                  }),
                  child: Container(
                    color: __isHoveredReport ? Color(0xFF008000) : Colors.white,
                    child: ListTile(
                        title: const Text("Reports"),
                        leading: Icon(Icons.info_outline),
                        onTap: () async {
                          bool canOpen = await checkPassword(context);
                          if (!mounted) return;

                          if (canOpen && context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Reports()),
                            );
                          }
                        }),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) => setState(() {
                    __isHoveredTasks = true;
                  }),
                  onExit: (_) => setState(() {
                    __isHoveredTasks = false;
                  }),
                  child: Container(
                    color: __isHoveredTasks ? Color(0xFF008000) : Colors.white,
                    child: ListTile(
                      title: const Text("Tasks"),
                      leading: Icon(Icons.assignment),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TasksToDo(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) => setState(() {
                    _isDiscount = true;
                  }),
                  onExit: (_) => setState(() {
                    _isDiscount = false;
                  }),
                  child: Container(
                    color: _isDiscount ? Color(0xFF008000) : Colors.white,
                    child: ListTile(
                      title: const Text("Discount"),
                      leading: Icon(Icons.money_off_csred_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Discount(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) => setState(() {
                    _isHovereddetailed = true;
                  }),
                  onExit: (_) => setState(() {
                    _isHovereddetailed = false;
                  }),
                  child: Container(
                    color:
                        _isHovereddetailed ? Color(0xFF008000) : Colors.white,
                    child: ListTile(
                      title: const Text("Bussiness Details"),
                      leading: Icon(Icons.info_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BussinesDetails(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) => setState(() {
                    _isHoveredMedicineInvoiced = true;
                  }),
                  onExit: (_) => setState(() {
                    _isHoveredMedicineInvoiced = false;
                  }),
                  child: Container(
                    color: _isHoveredMedicineInvoiced
                        ? Color(0xFF008000)
                        : Colors.white,
                    child: ListTile(
                      title: const Text("Medicines Invoice"),
                      leading: Icon(Icons.numbers),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StoreMedicineInvoice(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) => setState(() {
                    _isHoveredlogout = true;
                  }),
                  onExit: (_) => setState(() {
                    _isHoveredlogout = false;
                  }),
                  child: Container(
                    color: _isHoveredlogout ? Color(0xFF008000) : Colors.white,
                    child: ListTile(
                      title: const Text("Log Out"),
                      leading: Icon(Icons.logout),
                      onTap: () {
                        LogoutDialog.show(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 150, top: 60),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/Hammas.jpg'),
                        radius: 60,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Text(
                            'Hi Hammas,',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(width: 200),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 80, left: 50),
                    //   child: SizedBox(
                    //     width: 300,
                    //     height: 50,
                    //     child: TextFormField(
                    //       controller: searchController,
                    //       onChanged: (value) {},
                    //       style: const TextStyle(
                    //         fontSize: 18,
                    //         color: Colors.black,
                    //       ),
                    //       decoration: InputDecoration(
                    //         hintText: 'Search Medicine',
                    //         hintStyle: const TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //         prefixIcon: const Icon(
                    //           Icons.search,
                    //           color: Colors.red,
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           borderSide: BorderSide.none,
                    //         ),
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
