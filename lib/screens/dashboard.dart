import 'package:flutter/material.dart';
import 'package:software/screens/authentication/logout.dart';
import 'package:software/screens/distributor/schedule.dart';
import 'package:software/screens/global_widgets/password.dart';
import 'package:software/screens/medicine_invoices.dart';
import 'package:software/screens/purchase_records/currentpurchase.dart';
import 'package:software/screens/reports.dart';
import 'package:software/screens/salerecord/currentsale.dart';
import 'package:software/screens/salerecord/viewsale.dart';
import 'package:software/screens/bussines_details.dart';
import 'package:software/screens/distributor/alldistributor.dart';
import 'package:software/screens/invoice.dart';
import 'package:software/screens/discount.dart';
import 'package:software/screens/stocks/availablestocks.dart';
import 'package:software/screens/stocks/expiredstocks.dart';
import 'package:software/screens/purchase_records/addpurchase.dart';
import 'package:software/screens/stocks/nonretailstockesprices.dart';
import 'package:software/screens/stocks/requiredstocks.dart';
import 'package:software/screens/task_todo/tasks_to_do.dart';
import 'package:software/screens/stocks/nonpaidstock.dart';

enum SelectedPage {
  none,
  // Sale Record
  viewSales,
  currentSale,
  // Purchase Record
  addPurchases,
  currentPurchase,
  // Stocks
  availableStock,
  expiredStock,
  requiredStocks,
  nonPaidStocks,
  nonRetailStocks,
  // Distributor
  allDistributors,
  bookingSchedule,
  // Others
  invoice,
  reports,
  tasks,
  discount,
  businessDetails,
  medicinesInvoice
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
//  static const String routeName = '/dashboard';
  TextEditingController searchController = TextEditingController();
  SelectedPage _selectedPage = SelectedPage.none;
  Widget _buildPageContent() {
    switch (_selectedPage) {
      case SelectedPage.viewSales:
        return const Viewsale();
      case SelectedPage.currentSale:
        return const Currentsale();
      case SelectedPage.addPurchases:
        return const PurchaseScreen();
      case SelectedPage.currentPurchase:
        return const Currentpurchase();
      case SelectedPage.availableStock:
        return const Availablestocks();
      case SelectedPage.expiredStock:
        return const Expiredstocks();
      case SelectedPage.requiredStocks:
        return const Requiredstocks();
      case SelectedPage.nonPaidStocks:
        return const Nonpaidstock();
      case SelectedPage.nonRetailStocks:
        return const NonRetailStockPrices();
      case SelectedPage.allDistributors:
        return const Alldistributor();
      case SelectedPage.bookingSchedule:
        return const SchedulePage();
      case SelectedPage.invoice:
        return InvoiceScreen();
      case SelectedPage.reports:
        return const Reports();
      case SelectedPage.tasks:
        return const TasksToDo();
      case SelectedPage.discount:
        return const Discount();
      case SelectedPage.businessDetails:
        return const BussinesDetails();
      case SelectedPage.medicinesInvoice:
        return const StoreMedicineInvoice();
      case SelectedPage.none:
      default:
        return const Center(
          child: Text(
            'Welcome to Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  bool _isHoveredlogout = false;

  Widget _buildExpansionTile({
    required String title,
    required IconData icon,
    required List<Map<String, dynamic>> items,
  }) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      title: Text(title),
      leading: Icon(icon),
      children: items.map((item) {
        bool isHovered = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return _buildHoverableTile(
              isHovered: isHovered,
              onHover: (value) => setState(() => isHovered = value),
              title: item['title'],
              onTap: item['onTap'],
              icon: item['icon'],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildHoverableTile({
    required bool isHovered,
    required Function(bool) onHover,
    required String title,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: ColoredBox(
        color: isHovered ? Theme.of(context).hoverColor : Colors.transparent,
        child: ListTile(
          title: Text(title),
          leading: icon != null ? Icon(icon) : null,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300,
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
                      ),
                      Text(
                        "Al-Shifa ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Medical Store",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildExpansionTile(
                  title: "Sale Record",
                  icon: Icons.point_of_sale,
                  items: [
                    {
                      'title': "View Sales",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.viewSales),
                    },
                    {
                      'title': "Current Sale",
                      'onTap': () async {
                        bool canOpen = await checkPassword(context);
                        if (canOpen && context.mounted) {
                          setState(
                              () => _selectedPage = SelectedPage.currentSale);
                        }
                      },
                    },
                  ],
                ),
                _buildExpansionTile(
                  title: "Purchase Record",
                  icon: Icons.shopping_bag,
                  items: [
                    {
                      'title': "Add Purchases",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.addPurchases),
                    },
                    {
                      'title': "Current Purchase",
                      'onTap': () async {
                        bool canOpen = await checkPassword(context);
                        if (canOpen && context.mounted) {
                          setState(() =>
                              _selectedPage = SelectedPage.currentPurchase);
                        }
                      },
                    },
                  ],
                ),
                _buildExpansionTile(
                  title: "Stocks",
                  icon: Icons.inventory_rounded,
                  items: [
                    {
                      'title': "Available Stock",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.availableStock),
                    },
                    {
                      'title': "Expired Stock",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.expiredStock),
                    },
                    {
                      'title': "Required Stocks",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.requiredStocks),
                    },
                    {
                      'title': "Non Paid Stocks",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.nonPaidStocks),
                    },
                    {
                      'title': "Non Retail Stocks",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.nonRetailStocks),
                    },
                  ],
                ),
                _buildExpansionTile(
                  title: "Distributor",
                  icon: Icons.local_shipping,
                  items: [
                    {
                      'title': "All Distributors",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.allDistributors),
                    },
                    {
                      'title': "Booking Schedule",
                      'onTap': () => setState(
                          () => _selectedPage = SelectedPage.bookingSchedule),
                    },
                  ],
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;
                    return _buildHoverableTile(
                      isHovered: isHovered,
                      onHover: (value) => setState(() => isHovered = value),
                      title: "Invoice",
                      icon: Icons.receipt_long,
                      onTap: () => this
                          .setState(() => _selectedPage = SelectedPage.invoice),
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;
                    return _buildHoverableTile(
                      isHovered: isHovered,
                      onHover: (value) => setState(() => isHovered = value),
                      title: "Reports",
                      icon: Icons.info_outline,
                      onTap: () async {
                        bool canOpen = await checkPassword(context);
                        if (!mounted) return;
                        if (canOpen && context.mounted) {
                          this.setState(
                              () => _selectedPage = SelectedPage.reports);
                        }
                      },
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;
                    return _buildHoverableTile(
                      isHovered: isHovered,
                      onHover: (value) => setState(() => isHovered = value),
                      title: "Tasks",
                      icon: Icons.assignment,
                      onTap: () => this
                          .setState(() => _selectedPage = SelectedPage.tasks),
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;
                    return _buildHoverableTile(
                      isHovered: isHovered,
                      onHover: (value) => setState(() => isHovered = value),
                      title: "Discount",
                      icon: Icons.money_off_csred_rounded,
                      onTap: () => this.setState(
                          () => _selectedPage = SelectedPage.discount),
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;
                    return _buildHoverableTile(
                      isHovered: isHovered,
                      onHover: (value) => setState(() => isHovered = value),
                      title: "Bussiness Details",
                      icon: Icons.info_rounded,
                      onTap: () => this.setState(
                          () => _selectedPage = SelectedPage.businessDetails),
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;
                    return _buildHoverableTile(
                      isHovered: isHovered,
                      onHover: (value) => setState(() => isHovered = value),
                      title: "Medicines Invoice",
                      icon: Icons.numbers,
                      onTap: () => this.setState(
                          () => _selectedPage = SelectedPage.medicinesInvoice),
                    );
                  },
                ),
                MouseRegion(
                  onEnter: (_) => setState(() => _isHoveredlogout = true),
                  onExit: (_) => setState(() => _isHoveredlogout = false),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isHoveredlogout ? Color(0xFF008000) : Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
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
          // Dashboard area here
          Expanded(
            child: Column(
              children: [
                // Header with profile
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/Hammas.jpg'),
                        radius: 60,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hi Hammas,',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: _buildPageContent(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
