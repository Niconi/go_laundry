import 'package:flutter/material.dart';
import 'package:go_laundry/models/order.dart';
import 'package:go_laundry/models/service_type.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/order_list_item.dart';
import 'package:flutter/services.dart';

class OrderScreenContent extends StatefulWidget {
  const OrderScreenContent({Key? key}) : super(key: key);

  @override
  State<OrderScreenContent> createState() => _OrderScreenContentState();
}

class _OrderScreenContentState extends State<OrderScreenContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Order> ongoingOrders = [
    Order(
      id: '162432',
      serviceType: ServiceType.cuciLipat,
      price: 10000,
      date: DateTime(2024, 1, 29, 12, 30),
      iconPath: 'assets/icons/lipat.png',
    ),
  ];

  final List<Order> historyOrders = [
    Order(
      id: '242432',
      serviceType: ServiceType.cuciSetrika,
      price: 10000,
      date: DateTime(2024, 1, 30, 12, 30),
      iconPath: 'assets/icons/setrika.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor, // Menambahkan background color untuk seluruh screen
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Order History',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        bottom: TabBar(
          enableFeedback: true,
          controller: _tabController,
          onTap: (index) {
            HapticFeedback.vibrate();
          },
          tabs: const [
            Tab(
              text: 'Ongoing',
            ),
            Tab(
              text: 'History',
            ),
          ],
          labelStyle: regularText14,
          labelColor: limeGreenColor,
          unselectedLabelColor: grayColor,
          indicatorColor: limeGreenColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: limeGreenColor, width: 2)),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: ongoingOrders.length,
              itemBuilder: (context, index) {
                return OrderListItem(
                  order: ongoingOrders[index],
                  onDetailPressed: () {},
                );
              },
            ),
            ListView.builder(
              itemCount: historyOrders.length,
              itemBuilder: (context, index) {
                return OrderListItem(
                  order: historyOrders[index],
                  onDetailPressed: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
