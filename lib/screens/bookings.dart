import 'package:flutter/material.dart';
import 'package:kooho_test/utils/colors.dart';
import 'package:kooho_test/widgets/custom_tab_bar.dart';

import '../widgets/booking_card.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  final tabBar = ['Pending', "Completed", "Expired"];
  ValueNotifier<String> currentTab = ValueNotifier<String>('Completed');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black1A,
        title: const Text("Bookings"),
        centerTitle: false,
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            children: [
              CustomTabBar(tabBar: tabBar, currentTab: currentTab),
              const SizedBox(height: 30),
              ...List.filled(3, const BookingCard()),
            ],
          ),
        ),
      ),
    );
  }
}
